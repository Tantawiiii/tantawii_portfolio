import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/helpers/global_keys.dart';
import '../utils/helpers/spacing.dart';
import '../utils/theming/styles.dart';

class HeaderMenu extends StatelessWidget {
  const HeaderMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
       SvgPicture.asset("assets/Logo.svg"),
        horizontalSpace(100),
        InkWell(
          onTap: () {
            Scrollable.ensureVisible(
              GlobalKeys.aboutKey.currentContext!,
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
            );
          },
          child: Text(
            'About',
            style: TextStyles.font20WhiteMedium,
          ),
        ),
        horizontalSpace(40),
        InkWell(
          onTap: () {
            Scrollable.ensureVisible(
              GlobalKeys.servicesKey.currentContext!,
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
            );
          },
          child: Text(
            'Services',
            style: TextStyles.font20WhiteMedium,
          ),
        ),
        horizontalSpace(40),
        InkWell(
          onTap: () {
            Scrollable.ensureVisible(
              GlobalKeys.portfolioKey.currentContext!,
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
            );
          },
          child: Text(
            'Portfolio',
            style: TextStyles.font20WhiteMedium,
          ),
        ),
        horizontalSpace(40),
        InkWell(
          onTap: () {
            Scrollable.ensureVisible(
              GlobalKeys.hobbiesKey.currentContext!,
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
            );
          },
          child: Text(
            'Hobbies',
            style: TextStyles.font20WhiteMedium,
          ),
        ),

      ],
    );
  }
}
