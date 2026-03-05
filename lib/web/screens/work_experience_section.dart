import 'package:flutter/material.dart';
import 'package:tantawii_portfolio/utils/constants/colors.dart';
import 'package:tantawii_portfolio/utils/helpers/global_keys.dart';
import 'package:tantawii_portfolio/utils/helpers/responsive.dart';
import 'package:tantawii_portfolio/utils/models/experience_model.dart';
import '../widgets/animated_section.dart';

class WorkExperienceSection extends StatelessWidget {
  const WorkExperienceSection({super.key});

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
      key: GlobalKeys.workExperienceKey,
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: isMobile ? 40 : 80,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimatedSection(
            child: Text(
              'Work Experience',
              style: TextStyle(
                fontSize: isMobile ? 28 : 36,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: 'Preahvihear',
              ),
            ),
          ),
          SizedBox(height: isMobile ? 24 : 40),
          _buildExperienceGrid(context),
        ],
      ),
    );
  }

  Widget _buildExperienceGrid(BuildContext context) {
    final experiences = ExperienceModel.allExperiences;
    final crossAxisCount = ResponsiveHelper.responsiveValue<int>(
      context,
      mobile: 1,
      tablet: 2,
      desktop: 2,
    );

    return LayoutBuilder(
      builder: (context, constraints) {
        final spacing = 20.0;
        final itemWidth = (constraints.maxWidth - spacing * (crossAxisCount - 1)) / crossAxisCount;

        return Wrap(
          spacing: spacing,
          runSpacing: spacing,
          children: List.generate(experiences.length, (index) {
            return AnimatedSection(
              delay: Duration(milliseconds: 100 * index),
              child: SizedBox(
                width: crossAxisCount == 1 ? constraints.maxWidth : itemWidth,
                child: _ExperienceCard(experience: experiences[index]),
              ),
            );
          }),
        );
      },
    );
  }
}

class _ExperienceCard extends StatefulWidget {
  final ExperienceModel experience;

  const _ExperienceCard({required this.experience});

  @override
  State<_ExperienceCard> createState() => _ExperienceCardState();
}

class _ExperienceCardState extends State<_ExperienceCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOutCubic,
        transform: _isHovered
            ? (Matrix4.identity()..translate(0, -4, 0))
            : Matrix4.identity(),
        padding: EdgeInsets.all(isMobile ? 20 : 24),
        decoration: BoxDecoration(
          color: TColors.cardBackground.withOpacity(_isHovered ? 0.9 : 0.6),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: _isHovered
                ? Colors.purpleAccent.withOpacity(0.6)
                : TColors.cardBorderColor,
            width: 1.5,
          ),
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                    color: Colors.purpleAccent.withOpacity(0.15),
                    blurRadius: 30,
                    spreadRadius: 0,
                    offset: const Offset(0, 8),
                  ),
                ]
              : [],
        ),
        child: Row(
          children: [
            // Icon container
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: widget.experience.iconColor.withOpacity(0.15),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(
                widget.experience.icon,
                color: widget.experience.iconColor,
                size: 28,
              ),
            ),
            const SizedBox(width: 16),
            // Text content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.experience.company,
                    style: TextStyle(
                      fontSize: isMobile ? 16 : 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'Preahvihear',
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    widget.experience.description,
                    style: TextStyle(
                      fontSize: 13,
                      color: TColors.textGrey,
                      height: 1.5,
                      fontFamily: 'Preahvihear',
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 12),
                  _LearnMoreButton(isHovered: _isHovered),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LearnMoreButton extends StatefulWidget {
  final bool isHovered;
  const _LearnMoreButton({required this.isHovered});

  @override
  State<_LearnMoreButton> createState() => _LearnMoreButtonState();
}

class _LearnMoreButtonState extends State<_LearnMoreButton> {
  bool _btnHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _btnHovered = true),
      onExit: (_) => setState(() => _btnHovered = false),
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: _btnHovered
              ? Colors.purpleAccent.withOpacity(0.2)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Colors.purpleAccent.withOpacity(0.6),
            width: 1,
          ),
        ),
        child: Text(
          'LEARN MORE',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Colors.purpleAccent,
            letterSpacing: 1.2,
            fontFamily: 'Preahvihear',
          ),
        ),
      ),
    );
  }
}
