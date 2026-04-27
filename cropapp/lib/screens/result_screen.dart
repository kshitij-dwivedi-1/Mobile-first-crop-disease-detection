// lib/screens/result_screen.dart

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../data/disease_advice.dart';
import '../services/classifier.dart';

class ResultScreen extends StatelessWidget {
  final File imageFile;
  final ClassificationResult result;

  const ResultScreen({
    super.key,
    required this.imageFile,
    required this.result,
  });

  @override
  Widget build(BuildContext context) {
    final info = diseaseAdvice[result.label];
    final isHealthy = info?.isHealthy ?? false;
    final severity = info?.severity ?? 'medium';

    final Color accentColor = isHealthy
        ? const Color(0xFF2E7D32)
        : severity == 'high'
            ? const Color(0xFFC62828)
            : const Color(0xFFE65100);

    final Color bgColor = isHealthy
        ? const Color(0xFFE8F5E9)
        : severity == 'high'
            ? const Color(0xFFFFEBEE)
            : const Color(0xFFFFF3E0);

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7F2),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded,
              color: Color(0xFF1B3A1F)),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Analysis Result',
          style: TextStyle(
            color: Color(0xFF1B3A1F),
            fontFamily: 'Georgia',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Hero image card ──────────────────────────────────────────────
            _buildImageCard(accentColor, isHealthy)
                .animate()
                .fadeIn(duration: 400.ms)
                .slideY(begin: 0.1),

            const SizedBox(height: 16),

            // ── Confidence bar ────────────────────────────────────────────────
            _buildConfidenceCard(accentColor)
                .animate()
                .fadeIn(delay: 150.ms, duration: 400.ms)
                .slideY(begin: 0.1),

            const SizedBox(height: 16),

            if (info != null) ...[
              // ── Description ───────────────────────────────────────────────
              _buildSection(
                icon: Icons.info_outline_rounded,
                title: 'About',
                color: accentColor,
                bgColor: bgColor,
                child: Text(
                  info.description,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF3D4F3E),
                    height: 1.6,
                  ),
                ),
              )
                  .animate()
                  .fadeIn(delay: 250.ms, duration: 400.ms)
                  .slideY(begin: 0.1),

              const SizedBox(height: 12),

              // ── Symptoms (if diseased) ────────────────────────────────────
              if (!isHealthy && info.symptoms.isNotEmpty) ...[
                _buildSection(
                  icon: Icons.warning_amber_rounded,
                  title: 'Symptoms to Look For',
                  color: accentColor,
                  bgColor: bgColor,
                  child: _buildBulletList(info.symptoms, accentColor),
                )
                    .animate()
                    .fadeIn(delay: 350.ms, duration: 400.ms)
                    .slideY(begin: 0.1),
                const SizedBox(height: 12),
              ],

              // ── Treatments (if diseased) ──────────────────────────────────
              if (!isHealthy && info.treatments.isNotEmpty) ...[
                _buildSection(
                  icon: Icons.medical_services_outlined,
                  title: 'Recommended Treatment',
                  color: accentColor,
                  bgColor: bgColor,
                  child: _buildBulletList(info.treatments, accentColor),
                )
                    .animate()
                    .fadeIn(delay: 450.ms, duration: 400.ms)
                    .slideY(begin: 0.1),
                const SizedBox(height: 12),
              ],

              // ── Prevention ────────────────────────────────────────────────
              if (info.prevention.isNotEmpty) ...[
                _buildSection(
                  icon: Icons.shield_outlined,
                  title: isHealthy ? 'Care Tips' : 'Prevention',
                  color: accentColor,
                  bgColor: bgColor,
                  child: _buildBulletList(info.prevention, accentColor),
                )
                    .animate()
                    .fadeIn(delay: 550.ms, duration: 400.ms)
                    .slideY(begin: 0.1),
              ],
            ] else ...[
              // Unknown label fallback
              _buildSection(
                icon: Icons.help_outline_rounded,
                title: 'Unknown Condition',
                color: accentColor,
                bgColor: bgColor,
                child: const Text(
                  'No detailed advice found for this detection. Please consult a local agricultural extension officer for guidance.',
                  style: TextStyle(fontSize: 14, color: Color(0xFF3D4F3E), height: 1.6),
                ),
              ),
            ],

            const SizedBox(height: 24),

            // ── Disclaimer ────────────────────────────────────────────────
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Row(
                children: [
                  Icon(Icons.science_outlined,
                      size: 18, color: Colors.grey.shade500),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'AI-based estimation. Always confirm with a certified agronomist before applying treatments.',
                      style: TextStyle(
                          fontSize: 11,
                          color: Colors.grey.shade600,
                          height: 1.5),
                    ),
                  ),
                ],
              ),
            )
                .animate()
                .fadeIn(delay: 650.ms, duration: 400.ms),
          ],
        ),
      ),
    );
  }

  Widget _buildImageCard(Color accentColor, bool isHealthy) {
    return Container(
      height: 240,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 20,
            offset: const Offset(0, 8),
          )
        ],
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.file(imageFile,
                width: double.infinity,
                height: 240,
                fit: BoxFit.cover),
          ),
          // Gradient overlay with label
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(20)),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.75),
                  ],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(
                          color: accentColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          diseaseAdvice[_labelKey]?.plant ?? 'Plant',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      if (!isHealthy)
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 3),
                          decoration: BoxDecoration(
                            color: Colors.red.shade700,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text(
                            'DISEASE DETECTED',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.5,
                            ),
                          ),
                        )
                      else
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 3),
                          decoration: BoxDecoration(
                            color: Colors.green.shade600,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text(
                            '✓ HEALTHY',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    diseaseAdvice[_labelKey]?.displayName ??
                        result.label.replaceAll('_', ' '),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Georgia',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String get _labelKey => result.label;

  Widget _buildConfidenceCard(Color accentColor) {
    final pct = result.confidence;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Confidence Score',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF3D4F3E),
                ),
              ),
              Text(
                '${(pct * 100).toStringAsFixed(1)}%',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: accentColor,
                  fontFamily: 'Georgia',
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          LinearPercentIndicator(
            padding: EdgeInsets.zero,
            lineHeight: 10,
            percent: pct.clamp(0.0, 1.0),
            backgroundColor: Colors.grey.shade200,
            progressColor: accentColor,
            barRadius: const Radius.circular(8),
            animation: true,
            animationDuration: 800,
          ),
          const SizedBox(height: 6),
          Text(
            pct >= 0.85
                ? 'High confidence — result is reliable'
                : pct >= 0.60
                    ? 'Moderate confidence — consider a second scan'
                    : 'Low confidence — try a clearer, closer photo',
            style: TextStyle(
              fontSize: 11,
              color: Colors.grey.shade500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection({
    required IconData icon,
    required String title,
    required Color color,
    required Color bgColor,
    required Widget child,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 12,
              offset: const Offset(0, 4))
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: bgColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon, size: 18, color: color),
              ),
              const SizedBox(width: 10),
              Text(
                title,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          child,
        ],
      ),
    );
  }

  Widget _buildBulletList(List<String> items, Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items.map((item) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Container(
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(
                    color: color,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  item,
                  style: const TextStyle(
                    fontSize: 13.5,
                    color: Color(0xFF3D4F3E),
                    height: 1.5,
                  ),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
