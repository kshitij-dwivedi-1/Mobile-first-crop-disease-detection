// lib/screens/home_screen.dart

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:image_picker/image_picker.dart';
import '../services/classifier.dart';
import 'result_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Classifier _classifier = Classifier();
  final ImagePicker _picker = ImagePicker();

  bool _isModelLoading = true;
  bool _isAnalyzing = false;
  String? _modelError;

  @override
  void initState() {
    super.initState();
    _initModel();
  }

  Future<void> _initModel() async {
    try {
      await _classifier.loadModel();
      if (mounted) setState(() => _isModelLoading = false);
    } catch (e) {
      if (mounted) {
        setState(() {
          _isModelLoading = false;
          _modelError = e.toString();
        });
      }
    }
  }

  Future<void> _pickAndClassify(ImageSource source) async {
    if (_isModelLoading || _isAnalyzing) return;

    try {
      final XFile? picked = await _picker.pickImage(
        source: source,
        imageQuality: 85,
        maxWidth: 1024,
        maxHeight: 1024,
      );
      if (picked == null) return;

      setState(() => _isAnalyzing = true);

      final result = await _classifier.classify(File(picked.path));

      if (!mounted) return;
      setState(() => _isAnalyzing = false);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => ResultScreen(
            imageFile: File(picked.path),
            result: result,
          ),
        ),
      );
    } catch (e) {
      if (!mounted) return;
      setState(() => _isAnalyzing = false);
      _showError('Analysis failed: $e');
    }
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red.shade700,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  void dispose() {
    _classifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7F2),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 32),

              // ── Header ─────────────────────────────────────────────────────
              _buildHeader(),

              const SizedBox(height: 40),

              // ── Hero illustration card ────────────────────────────────────
              _buildHeroCard(),

              const SizedBox(height: 32),

              // ── Action buttons ────────────────────────────────────────────
              if (_isModelLoading)
                _buildLoadingState()
              else if (_modelError != null)
                _buildErrorState()
              else
                _buildActionButtons(),

              const SizedBox(height: 32),

              // ── Supported crops section ──────────────────────────────────
              _buildSupportedCrops(),

              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: const Color(0xFF2E7D32),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Icons.eco_rounded,
                  color: Colors.white, size: 22),
            ),
            const SizedBox(width: 12),
            const Text(
              'CropScan',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1B3A1F),
                fontFamily: 'Georgia',
              ),
            ),
          ],
        )
            .animate()
            .fadeIn(duration: 500.ms)
            .slideX(begin: -0.1),

        const SizedBox(height: 20),

        const Text(
          'Detect crop\ndiseases instantly.',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1B3A1F),
            fontFamily: 'Georgia',
            height: 1.2,
          ),
        )
            .animate()
            .fadeIn(delay: 100.ms, duration: 500.ms)
            .slideY(begin: 0.1),

        const SizedBox(height: 10),

        const Text(
          'Photograph a leaf to get an AI-powered diagnosis and expert care advice.',
          style: TextStyle(
            fontSize: 15,
            color: Color(0xFF5A7260),
            height: 1.5,
          ),
        )
            .animate()
            .fadeIn(delay: 200.ms, duration: 500.ms),
      ],
    );
  }

  Widget _buildHeroCard() {
    return Container(
      height: 180,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF2E7D32), Color(0xFF1B5E20)],
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF2E7D32).withOpacity(0.4),
            blurRadius: 20,
            offset: const Offset(0, 8),
          )
        ],
      ),
      child: Stack(
        children: [
          // Decorative circles
          Positioned(
            right: -30,
            top: -30,
            child: Container(
              width: 160,
              height: 160,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.06),
              ),
            ),
          ),
          Positioned(
            right: 30,
            bottom: -40,
            child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.06),
              ),
            ),
          ),
          // Content
          Padding(
            padding: const EdgeInsets.all(18),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        '14 crops supported',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1,
                        ),
                      ),
                      const SizedBox(height: 6),
                      const Text(
                        '38 conditions\nidentified',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Georgia',
                          height: 1.2,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          '100% offline · No internet needed',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(
                  Icons.yard_rounded,
                  size: 72,
                  color: Colors.white24,
                ),
              ],
            ),
          ),
        ],
      ),
    )
        .animate()
        .fadeIn(delay: 250.ms, duration: 500.ms)
        .scale(begin: const Offset(0.95, 0.95));
  }

  Widget _buildLoadingState() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: const Center(
        child: Column(
          children: [
            CircularProgressIndicator(
              color: Color(0xFF2E7D32),
              strokeWidth: 2.5,
            ),
            SizedBox(height: 16),
            Text(
              'Loading AI model…',
              style: TextStyle(color: Color(0xFF5A7260), fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildErrorState() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.red.shade50,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.red.shade200),
      ),
      child: Column(
        children: [
          Icon(Icons.error_outline_rounded,
              color: Colors.red.shade600, size: 40),
          const SizedBox(height: 12),
          Text(
            'Model failed to load',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.red.shade700),
          ),
          const SizedBox(height: 8),
          Text(
            'Ensure model.tflite and labels.txt are in the assets/ folder.',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.red.shade600, fontSize: 13),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _isModelLoading = true;
                _modelError = null;
              });
              _initModel();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red.shade600,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
            ),
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons() {
    return Column(
      children: [
        // Camera button
        _buildActionTile(
          icon: Icons.camera_alt_rounded,
          label: 'Take a Photo',
          subtitle: 'Use your camera for best results',
          color: const Color(0xFF2E7D32),
          onTap: () => _pickAndClassify(ImageSource.camera),
        )
            .animate()
            .fadeIn(delay: 300.ms, duration: 400.ms)
            .slideY(begin: 0.1),

        const SizedBox(height: 12),

        // Gallery button
        _buildActionTile(
          icon: Icons.photo_library_rounded,
          label: 'Choose from Gallery',
          subtitle: 'Select an existing leaf photo',
          color: const Color(0xFF5A7260),
          onTap: () => _pickAndClassify(ImageSource.gallery),
        )
            .animate()
            .fadeIn(delay: 380.ms, duration: 400.ms)
            .slideY(begin: 0.1),

        // Analyzing overlay
        if (_isAnalyzing)
          Container(
            margin: const EdgeInsets.only(top: 24),
            padding: const EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.06),
                    blurRadius: 12,
                    offset: const Offset(0, 4))
              ],
            ),
            child: const Column(
              children: [
                CircularProgressIndicator(
                  color: Color(0xFF2E7D32),
                  strokeWidth: 2.5,
                ),
                SizedBox(height: 14),
                Text(
                  'Analyzing your crop…',
                  style: TextStyle(
                    color: Color(0xFF3D4F3E),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Running AI inference on device',
                  style: TextStyle(color: Color(0xFF5A7260), fontSize: 12),
                ),
              ],
            ),
          ).animate().fadeIn(duration: 300.ms),
      ],
    );
  }

  Widget _buildActionTile({
    required IconData icon,
    required String label,
    required String subtitle,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 12,
                offset: const Offset(0, 4))
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: color.withOpacity(0.12),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(icon, color: color, size: 24),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: color,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: TextStyle(
                        fontSize: 12, color: Colors.grey.shade500),
                  ),
                ],
              ),
            ),
            Icon(Icons.chevron_right_rounded,
                color: Colors.grey.shade400, size: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildSupportedCrops() {
    const crops = [
      ('🍎', 'Apple'),
      ('🫐', 'Blueberry'),
      ('🍒', 'Cherry'),
      ('🌽', 'Corn'),
      ('🍇', 'Grape'),
      ('🍊', 'Orange'),
      ('🍑', 'Peach'),
      ('🫑', 'Pepper'),
      ('🥔', 'Potato'),
      ('🫙', 'Raspberry'),
      ('🌿', 'Soybean'),
      ('🥒', 'Squash'),
      ('🍓', 'Strawberry'),
      ('🍅', 'Tomato'),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Supported Crops',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1B3A1F),
            fontFamily: 'Georgia',
          ),
        )
            .animate()
            .fadeIn(delay: 450.ms, duration: 400.ms),

        const SizedBox(height: 12),

        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: crops.asMap().entries.map((entry) {
            final i = entry.key;
            final crop = entry.value;
            return Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xFFD4E8D4)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.03),
                      blurRadius: 6,
                      offset: const Offset(0, 2))
                ],
              ),
              child: Text(
                '${crop.$1} ${crop.$2}',
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF3D4F3E),
                ),
              ),
            )
                .animate()
                .fadeIn(
                  delay: Duration(milliseconds: 500 + (i * 40)),
                  duration: 300.ms,
                )
                .scale(begin: const Offset(0.8, 0.8));
          }).toList(),
        ),
      ],
    );
  }
}
