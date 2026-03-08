import 'package:flutter/material.dart';
import 'package:tantawii_portfolio/utils/constants/colors.dart';

import 'about_section.dart';
import 'contact_section.dart';
import 'header_menu.dart';
import 'projects_section.dart';
import 'skills_section.dart';
import 'work_experience_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.primaryBackground,
      body: Column(
        children: [
          const HeaderMenu(),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: const [
                  AboutSection(),
                  WorkExperienceSection(),
                  SkillsSection(),
                  ProjectsSection(),
                  ContactSection(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
