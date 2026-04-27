// lib/services/classifier.dart

import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:image/image.dart' as img;

class ClassificationResult {
  final String label;
  final double confidence;

  ClassificationResult({required this.label, required this.confidence});
}

class Classifier {
  static const String _modelPath = 'assets/model.tflite';
  static const String _labelsPath = 'assets/labels.txt';
  static const int _inputSize = 224; // Standard plant disease model input

  Interpreter? _interpreter;
  List<String> _labels = [];

  Future<void> loadModel() async {
    try {
      // Load labels
      final labelsData = await rootBundle.loadString('assets/labels.txt');
      _labels = labelsData
          .split('\n')
          .map((e) => e.trim())
          .where((e) => e.isNotEmpty)
          .toList();

      // Load model as raw bytes then create interpreter
      final ByteData modelData = await rootBundle.load('assets/model.tflite');
      final Uint8List modelBytes = modelData.buffer.asUint8List(
        modelData.offsetInBytes,
        modelData.lengthInBytes,
      );
      _interpreter = Interpreter.fromBuffer(modelBytes);

      print('✅ Model loaded. Labels: ${_labels.length}');
    } catch (e, stack) {
      print('❌ Model load error: $e\n$stack');
      rethrow;
    }
  }

  Future<ClassificationResult> classify(File imageFile) async {
    if (_interpreter == null) {
      throw Exception('Model not loaded. Call loadModel() first.');
    }

    // Load and preprocess image
    final imageBytes = await imageFile.readAsBytes();
    img.Image? image = img.decodeImage(imageBytes);
    if (image == null) throw Exception('Failed to decode image');

    // Resize to model input size
    img.Image resized =
        img.copyResize(image, width: _inputSize, height: _inputSize);

    // Convert to float32 input tensor [1, 224, 224, 3] normalized to [0, 1]
    final inputBuffer = List.generate(
      1,
      (_) => List.generate(
        _inputSize,
        (y) => List.generate(
          _inputSize,
          (x) {
            final pixel = resized.getPixel(x, y);
            return [
              pixel.rNormalized,
              pixel.gNormalized,
              pixel.bNormalized,
            ];
          },
        ),
      ),
    );

    // Output buffer
    final outputBuffer =
        List.filled(1, List.filled(_labels.length, 0.0));

    // Run inference
    _interpreter!.run(inputBuffer, outputBuffer);

    final results = outputBuffer[0];

    // Find top prediction
    double maxScore = -double.infinity;
    int maxIndex = 0;
    for (int i = 0; i < results.length; i++) {
      if (results[i] > maxScore) {
        maxScore = results[i];
        maxIndex = i;
      }
    }

    // Apply softmax if raw logits (values outside [0,1] range)
    double confidence = maxScore;
    if (maxScore > 1.0 || maxScore < 0.0) {
      confidence = _softmax(results)[maxIndex];
    }

    return ClassificationResult(
      label: maxIndex < _labels.length ? _labels[maxIndex] : 'Unknown',
      confidence: confidence.clamp(0.0, 1.0),
    );
  }

  List<double> _softmax(List<double> logits) {
    final maxLogit = logits.reduce(max);
    final exps = logits.map((l) => exp(l - maxLogit)).toList();
    final sumExps = exps.reduce((a, b) => a + b);
    return exps.map((e) => e / sumExps).toList();
  }

  void dispose() {
    _interpreter?.close();
  }
}
