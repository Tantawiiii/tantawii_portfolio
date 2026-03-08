import 'package:flutter/material.dart';

/// Data model for work experience. Add new entries by appending to [allExperiences].
class ExperienceModel {
  final String company;
  final String role;
  final String description;
  final IconData icon;
  final Color iconColor;
  final String? link;

  const ExperienceModel({
    required this.company,
    required this.role,
    required this.description,
    this.icon = Icons.work_outline,
    this.iconColor = Colors.purpleAccent,
    this.link,
  });

  /// Master list of work experiences — add or remove entries here to scale.
  static const List<ExperienceModel> allExperiences = [
    ExperienceModel(
      company: 'CIB on the Mobile',
      role: 'Software Engineer',
      description:
          'Take your client onboard seamlessly by our amazing tool of digital onboard process.',
      icon: Icons.star_border_rounded,
      iconColor: Color(0xFF7B61FF),
    ),
    ExperienceModel(
      company: 'CIB on the Mobile',
      role: 'Flutter Developer',
      description:
          'Take your client onboard seamlessly by our amazing tool of digital onboard process.',
      icon: Icons.lightbulb_outline,
      iconColor: Color(0xFFFF6B6B),
    ),
    ExperienceModel(
      company: 'CIB on the Mobile',
      role: 'Mobile Developer',
      description:
          'Take your client onboard seamlessly by our amazing tool of digital onboard process.',
      icon: Icons.rocket_launch_outlined,
      iconColor: Color(0xFF4ECDC4),
    ),
    ExperienceModel(
      company: 'CIB on the Mobile',
      role: 'UI/UX Designer',
      description:
          'Take your client onboard seamlessly by our amazing tool of digital onboard process.',
      icon: Icons.auto_awesome,
      iconColor: Color(0xFFFFD93D),
    ),
  ];
}
