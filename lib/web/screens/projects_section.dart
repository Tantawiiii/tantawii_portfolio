import 'package:flutter/material.dart';
import 'package:tantawii_portfolio/utils/constants/colors.dart';
import 'package:tantawii_portfolio/utils/helpers/global_keys.dart';
import 'package:tantawii_portfolio/utils/helpers/responsive.dart';
import 'package:tantawii_portfolio/utils/models/project_model.dart';
import '../widgets/animated_section.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

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

    final projects = ProjectModel.allProjects;

    return Container(
      key: GlobalKeys.projectsKey,
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: isMobile ? 40 : 80,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(projects.length, (index) {
          final isEven = index.isEven;
          return Padding(
            padding: EdgeInsets.only(bottom: isMobile ? 40 : 80),
            child: AnimatedSection(
              delay: Duration(milliseconds: 150 * index),
              child: _ProjectCard(
                project: projects[index],
                imageOnRight: isEven,
              ),
            ),
          );
        }),
      ),
    );
  }
}

class _ProjectCard extends StatefulWidget {
  final ProjectModel project;
  final bool imageOnRight;

  const _ProjectCard({
    required this.project,
    required this.imageOnRight,
  });

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);

    if (isMobile) {
      return _buildMobileLayout(context);
    }
    return _buildDesktopLayout(context);
  }

  Widget _buildDesktopLayout(BuildContext context) {
    final textContent = _buildTextContent(context);
    final imageContent = _buildImageContent(context);

    final children = widget.imageOnRight
        ? [Expanded(child: textContent), const SizedBox(width: 40), Expanded(child: imageContent)]
        : [Expanded(child: imageContent), const SizedBox(width: 40), Expanded(child: textContent)];

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        transform: _isHovered
            ? (Matrix4.identity()..translate(0, -6, 0))
            : Matrix4.identity(),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: children,
        ),
      ),
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTextContent(context),
        const SizedBox(height: 20),
        _buildImageContent(context),
      ],
    );
  }

  Widget _buildTextContent(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);
    final align = isMobile
        ? CrossAxisAlignment.start
        : (widget.imageOnRight
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.end);
    final textAlign = isMobile
        ? TextAlign.start
        : (widget.imageOnRight ? TextAlign.start : TextAlign.end);

    return Column(
      crossAxisAlignment: align,
      children: [
        Text(
          widget.project.subtitle,
          style: TextStyle(
            fontSize: 14,
            color: Colors.purpleAccent,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.5,
            fontFamily: 'Preahvihear',
          ),
        ),
        const SizedBox(height: 8),
        Text(
          widget.project.title,
          style: TextStyle(
            fontSize: isMobile ? 24 : 32,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontFamily: 'Preahvihear',
          ),
          textAlign: textAlign,
        ),
        const SizedBox(height: 20),
        // Description card with glassmorphism
        Container(
          padding: EdgeInsets.all(isMobile ? 20 : 28),
          decoration: BoxDecoration(
            color: TColors.cardBackground.withOpacity(0.8),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: TColors.cardBorderColor,
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.purpleAccent.withOpacity(0.08),
                blurRadius: 40,
                spreadRadius: 0,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Text(
            widget.project.description,
            style: TextStyle(
              fontSize: isMobile ? 14 : 16,
              color: TColors.textGrey,
              height: 1.7,
              fontFamily: 'Preahvihear',
            ),
            textAlign: textAlign,
          ),
        ),
        const SizedBox(height: 16),
        // Tech stack chips
        if (widget.project.techStack.isNotEmpty)
          Wrap(
            alignment: widget.imageOnRight ? WrapAlignment.start : WrapAlignment.end,
            spacing: 8,
            runSpacing: 8,
            children: widget.project.techStack
                .map((tech) => _TechChip(label: tech))
                .toList(),
          ),
      ],
    );
  }

  Widget _buildImageContent(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: _isHovered
              ? Colors.purpleAccent.withOpacity(0.4)
              : TColors.cardBorderColor,
          width: 1.5,
        ),
        boxShadow: _isHovered
            ? [
                BoxShadow(
                  color: Colors.purpleAccent.withOpacity(0.15),
                  blurRadius: 30,
                  offset: const Offset(0, 10),
                ),
              ]
            : [],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(
          widget.project.imagePath,
          height: isMobile ? 200 : 320,
          width: double.infinity,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              height: isMobile ? 200 : 320,
              color: TColors.cardBackground,
              child: const Center(
                child: Icon(
                  Icons.image_outlined,
                  color: TColors.textGrey,
                  size: 48,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _TechChip extends StatelessWidget {
  final String label;
  const _TechChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.purpleAccent.withOpacity(0.1),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 12,
          color: Colors.purpleAccent,
          fontWeight: FontWeight.w500,
          fontFamily: 'Preahvihear',
        ),
      ),
    );
  }
}
