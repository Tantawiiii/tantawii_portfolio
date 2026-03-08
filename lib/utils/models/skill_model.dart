import 'package:flutter/material.dart';

/// Data model for a skill item. Add new skills by appending to [allSkills].
class SkillModel {
  final String name;
  final IconData? icon;
  final String? assetPath;
  final Color color;

  const SkillModel({
    required this.name,
    this.icon,
    this.assetPath,
    this.color = Colors.white,
  });

  /// Master list of skills — add or remove entries here to scale.
  static const List<SkillModel> allSkills = [
    SkillModel(name: 'Flutter', icon: Icons.flutter_dash, color: Color(0xFF02569B)),
    SkillModel(name: 'Dart', icon: Icons.code, color: Color(0xFF0175C2)),
    SkillModel(name: 'Firebase', icon: Icons.local_fire_department, color: Color(0xFFFFA000)),
    SkillModel(name: 'REST APIs', icon: Icons.api, color: Color(0xFF4CAF50)),
    SkillModel(name: 'Git', icon: Icons.merge_type, color: Color(0xFFF05032)),
    SkillModel(name: 'Node.js', icon: Icons.dns, color: Color(0xFF68A063)),
    SkillModel(name: 'Figma', icon: Icons.design_services, color: Color(0xFFF24E1E)),
    SkillModel(name: 'React', icon: Icons.web, color: Color(0xFF61DAFB)),
    SkillModel(name: 'JavaScript', icon: Icons.javascript, color: Color(0xFFF7DF1E)),
    SkillModel(name: 'TypeScript', icon: Icons.code_off, color: Color(0xFF3178C6)),
    SkillModel(name: 'MongoDB', icon: Icons.storage, color: Color(0xFF47A248)),
    SkillModel(name: 'PostgreSQL', icon: Icons.table_chart, color: Color(0xFF336791)),
    SkillModel(name: 'Docker', icon: Icons.directions_boat, color: Color(0xFF2496ED)),
  ];
}
