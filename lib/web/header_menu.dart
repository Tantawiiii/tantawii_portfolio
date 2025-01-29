import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tantawii_portfolio/utils/constants/colors.dart';
import 'package:tantawii_portfolio/utils/constants/text_strings.dart';

import '../utils/helpers/global_keys.dart';
import '../utils/helpers/spacing.dart';
import '../utils/theming/styles.dart';

class HeaderMenu extends StatelessWidget {
  const HeaderMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  EdgeInsets.symmetric(horizontal: 140.h, ),
      width: double.infinity,
      height: 76.h,
      decoration: BoxDecoration(
        color: TColors.headerBackground,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
         Row(
           children: [
             SvgPicture.asset("assets/Logo.svg",width: 420.w,height: 47.h,),
           ],
         ),
          Row(
            children: [
              Bounce(
                onTap: () {
                  Scrollable.ensureVisible(
                    GlobalKeys.aboutKey.currentContext!,
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeInOut,
                  );
                },
                child: Text(
                  TTexts.tAbout,
                  style: TextStyles.font16WhiteMedium,
                ),
              ),
              horizontalSpace(60),
              Bounce(
                onTap: () {
                  Scrollable.ensureVisible(
                    GlobalKeys.servicesKey.currentContext!,
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeInOut,
                  );
                },
                child: Text(
                  TTexts.tWorkEX,
                  style: TextStyles.font16WhiteMedium,
                ),
              ),
              horizontalSpace(60),
              Bounce(
                onTap: () {
                  Scrollable.ensureVisible(
                    GlobalKeys.portfolioKey.currentContext!,
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeInOut,
                  );
                },
                child: Text(
                  TTexts.tSkills,
                  style: TextStyles.font16WhiteMedium,
                ),
              ),
             horizontalSpace(60),
              Bounce(
                onTap: () {
                  Scrollable.ensureVisible(
                    GlobalKeys.hobbiesKey.currentContext!,
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeInOut,
                  );
                },
                child: Text(
                  TTexts.tProjects,
                  style: TextStyles.font16WhiteMedium,
                ),
              ),

              horizontalSpace(60),
              Bounce(
                onTap: () {
                  Scrollable.ensureVisible(
                    GlobalKeys.hobbiesKey.currentContext!,
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeInOut,
                  );
                },
                child: Text(
                  TTexts.tContact,
                  style: TextStyles.font16WhiteMedium,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
