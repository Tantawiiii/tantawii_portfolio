import 'package:bounce/bounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tantawii_portfolio/utils/constants/colors.dart';
import 'package:tantawii_portfolio/utils/constants/text_strings.dart';

import '../../utils/constants/image_strings.dart';
import '../../utils/helpers/global_keys.dart';
import '../../utils/helpers/spacing.dart';
import '../../utils/theming/styles.dart';

class HeaderMenu extends StatelessWidget {
  const HeaderMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w,),
      width: double.infinity,
      height: 80.h,
      decoration: BoxDecoration(
        color: TColors.headerBackground,
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 800) {
            // Large Screen (Web / Tablet )
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset("assets/Logo.svg", width: 180.w, height: 40.h),
                Row(
                  children: _buildMenuItems(),
                ),
              ],
            );
          } else {
            // Small Screen (Mobile)
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: SvgPicture.asset(IImages.appLogoSvg, width: 120.w, height: 30.h),
                ),
                IconButton(
                  icon: Icon(Icons.menu, color: Colors.white, size: 60.sp),
                  onPressed: () {
                    _showMobileMenu(context);
                  },
                ),
              ],
            );
          }
        },
      ),
    );
  }

  List<Widget> _buildMenuItems() {
    return [
      _menuItem(TTexts.tAbout, GlobalKeys.aboutKey),
      horizontalSpace(40),
      _menuItem(TTexts.tWorkEX, GlobalKeys.servicesKey),
      horizontalSpace(40),
      _menuItem(TTexts.tSkills, GlobalKeys.portfolioKey),
      horizontalSpace(40),
      _menuItem(TTexts.tProjects, GlobalKeys.hobbiesKey),
      horizontalSpace(40),
      _menuItem(TTexts.tContact, GlobalKeys.hobbiesKey),
    ];
  }

  Widget _menuItem(String text, GlobalKey key) {
    return Bounce(
      onTap: () {
        Scrollable.ensureVisible(
          key.currentContext!,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
        );
      },
      child: Text(
        text,
        style: kIsWeb
            ? TextStyles.font18WhiteMedium
            : TextStyles.font16WhiteMedium,
      ),
    );
  }


  void _showMobileMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: TColors.headerBackground,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  icon: Icon(Icons.close, color: Colors.white, size: 40.sp),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              SizedBox(height: 10.h),
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  children: _buildMenuItems()
                      .map((item) => Padding(
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                    child: item,
                  ))
                      .toList(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

}
