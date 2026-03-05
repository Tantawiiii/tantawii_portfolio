import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:tantawii_portfolio/utils/constants/colors.dart';
import 'package:tantawii_portfolio/utils/helpers/global_keys.dart';
import 'package:tantawii_portfolio/utils/helpers/responsive.dart';
import 'package:tantawii_portfolio/utils/models/skill_model.dart';
import '../widgets/animated_section.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);
    final screenWidth = MediaQuery.sizeOf(context).width;

    final horizontalPadding = ResponsiveHelper.responsiveValue<double>(
      context,
      mobile: 24,
      tablet: 48,
      desktop: screenWidth * 0.1,
    );

    return Container(
      key: GlobalKeys.skillsKey,
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: isMobile ? 40 : 80,
      ),
      child: Column(
        children: [
          // Header text
          AnimatedSection(
            child: Column(
              children: [
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: isMobile ? 22 : 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'Preahvihear',
                      height: 1.4,
                    ),
                    children: const [
                      TextSpan(text: "I'm currently looking to join a "),
                      TextSpan(
                        text: 'cross-functional',
                        style: TextStyle(
                          color: Colors.purpleAccent,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      TextSpan(text: ' team'),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'that values improving people\'s lives through accessible design',
                  style: TextStyle(
                    fontSize: isMobile ? 14 : 18,
                    color: TColors.textGrey,
                    fontFamily: 'Preahvihear',
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          SizedBox(height: isMobile ? 32 : 48),
          // Skills icons grid
          AnimatedSection(
            delay: const Duration(milliseconds: 200),
            child: _buildSkillsGrid(context),
          ),
          SizedBox(height: isMobile ? 32 : 48),
          // Orbital animation
          AnimatedSection(
            delay: const Duration(milliseconds: 400),
            child: _OrbitalWidget(isMobile: isMobile),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillsGrid(BuildContext context) {
    final skills = SkillModel.allSkills;
    final isMobile = ResponsiveHelper.isMobile(context);

    return Wrap(
      alignment: WrapAlignment.center,
      spacing: isMobile ? 12 : 20,
      runSpacing: isMobile ? 12 : 20,
      children: skills.map((skill) => _SkillChip(skill: skill)).toList(),
    );
  }
}

/// A single skill chip with hover animation.
class _SkillChip extends StatefulWidget {
  final SkillModel skill;
  const _SkillChip({required this.skill});

  @override
  State<_SkillChip> createState() => _SkillChipState();
}

class _SkillChipState extends State<_SkillChip> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);
    final chipSize = isMobile ? 48.0 : 56.0;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Tooltip(
        message: widget.skill.name,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOutCubic,
          width: chipSize,
          height: chipSize,
          transform: _isHovered
              ? (Matrix4.identity()..scale(1.15))
              : Matrix4.identity(),
          transformAlignment: Alignment.center,
          decoration: BoxDecoration(
            color: _isHovered
                ? widget.skill.color.withOpacity(0.2)
                : TColors.cardBackground.withOpacity(0.6),
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: _isHovered
                  ? widget.skill.color.withOpacity(0.6)
                  : TColors.cardBorderColor,
              width: 1.5,
            ),
            boxShadow: _isHovered
                ? [
                    BoxShadow(
                      color: widget.skill.color.withOpacity(0.3),
                      blurRadius: 20,
                      spreadRadius: 0,
                    ),
                  ]
                : [],
          ),
          child: Center(
            child: Icon(
              widget.skill.icon,
              color: _isHovered ? widget.skill.color : Colors.white70,
              size: isMobile ? 22 : 26,
            ),
          ),
        ),
      ),
    );
  }
}

/// Animated orbital rings widget — the galaxy-like effect.
class _OrbitalWidget extends StatefulWidget {
  final bool isMobile;
  const _OrbitalWidget({required this.isMobile});

  @override
  State<_OrbitalWidget> createState() => _OrbitalWidgetState();
}

class _OrbitalWidgetState extends State<_OrbitalWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = widget.isMobile ? 200.0 : 340.0;

    return SizedBox(
      width: size * 2.2,
      height: size,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return CustomPaint(
            painter: _OrbitalPainter(
              rotation: _controller.value * 2 * math.pi,
              color: Colors.purpleAccent.withOpacity(0.3),
            ),
            child: Center(child: child),
          );
        },
        child: Container(
          width: widget.isMobile ? 80 : 120,
          height: widget.isMobile ? 80 : 120,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: RadialGradient(
              colors: [
                Colors.purpleAccent.withOpacity(0.6),
                Colors.purpleAccent.withOpacity(0.1),
                Colors.transparent,
              ],
              stops: const [0.3, 0.6, 1.0],
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.purpleAccent.withOpacity(0.4),
                blurRadius: 60,
                spreadRadius: 20,
              ),
            ],
          ),
          child: Center(
            child: Text(
              '∑',
              style: TextStyle(
                fontSize: widget.isMobile ? 36 : 52,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: 'Preahvihear',
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _OrbitalPainter extends CustomPainter {
  final double rotation;
  final Color color;

  _OrbitalPainter({required this.rotation, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0
      ..color = color;

    // Draw 3 elliptical orbits at different angles
    for (int i = 0; i < 3; i++) {
      final angle = rotation + (i * math.pi / 3);
      canvas.save();
      canvas.translate(center.dx, center.dy);
      canvas.rotate(angle * 0.1 + i * 0.3);

      final rx = size.width * 0.42 - (i * 20);
      final ry = size.height * 0.35 - (i * 10);
      canvas.drawOval(Rect.fromCenter(center: Offset.zero, width: rx * 2, height: ry * 2), paint);
      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(covariant _OrbitalPainter oldDelegate) =>
      rotation != oldDelegate.rotation;
}
