import 'package:bounce/bounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tantawii_portfolio/utils/constants/colors.dart';
import 'package:tantawii_portfolio/utils/constants/text_strings.dart';
import 'package:tantawii_portfolio/utils/constants/image_strings.dart';
import 'package:tantawii_portfolio/utils/helpers/global_keys.dart';
import 'package:tantawii_portfolio/utils/helpers/responsive.dart';

class HeaderMenu extends StatelessWidget {
  const HeaderMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);
    final horizontalPadding = ResponsiveHelper.responsiveValue<double>(
      context,
      mobile: 16,
      tablet: 24,
      desktop: 40,
    );

    return Container(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      width: double.infinity,
      height: isMobile ? 64 : 80,
      decoration: BoxDecoration(
        color: TColors.headerBackground.withOpacity(0.95),
        border: Border(
          bottom: BorderSide(
            color: TColors.cardBorderColor.withOpacity(0.5),
            width: 1,
          ),
        ),
      ),
      child: isMobile ? _buildMobileHeader(context) : _buildDesktopHeader(context),
    );
  }

  Widget _buildDesktopHeader(BuildContext context) {
    final logoWidth = ResponsiveHelper.responsiveValue<double>(
      context,
      mobile: 120,
      tablet: 140,
      desktop: 160,
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          IImages.appLogoSvg,
          width: logoWidth,
          height: 36,
        ),
        Row(children: _buildMenuItems()),
      ],
    );
  }

  Widget _buildMobileHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          IImages.appLogoSvg,
          width: 120,
          height: 28,
        ),
        _HamburgerButton(onPressed: () => _showMobileMenu(context)),
      ],
    );
  }

  List<Widget> _buildMenuItems() {
    return [
      _menuItem(TTexts.tAbout, GlobalKeys.aboutKey),
      const SizedBox(width: 36),
      _menuItem(TTexts.tWorkEX, GlobalKeys.workExperienceKey),
      const SizedBox(width: 36),
      _menuItem(TTexts.tSkills, GlobalKeys.skillsKey),
      const SizedBox(width: 36),
      _menuItem(TTexts.tProjects, GlobalKeys.projectsKey),
      const SizedBox(width: 36),
      _menuItem(TTexts.tContact, GlobalKeys.contactKey),
    ];
  }

  Widget _menuItem(String text, GlobalKey key) {
    return _NavItem(text: text, sectionKey: key);
  }

  void _showMobileMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
            color: TColors.headerBackground,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            border: Border.all(
              color: TColors.cardBorderColor,
              width: 1,
            ),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Handle bar
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.white24,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 24),
              ..._buildMobileMenuItems(context),
              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }

  List<Widget> _buildMobileMenuItems(BuildContext context) {
    final items = [
      (TTexts.tAbout, GlobalKeys.aboutKey),
      (TTexts.tWorkEX, GlobalKeys.workExperienceKey),
      (TTexts.tSkills, GlobalKeys.skillsKey),
      (TTexts.tProjects, GlobalKeys.projectsKey),
      (TTexts.tContact, GlobalKeys.contactKey),
    ];

    return items.map((item) {
      return Bounce(
        onTap: () {
          Navigator.pop(context);
          Future.delayed(const Duration(milliseconds: 200), () {
            if (item.$2.currentContext != null) {
              Scrollable.ensureVisible(
                item.$2.currentContext!,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOutCubic,
              );
            }
          });
        },
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: TColors.cardBorderColor.withOpacity(0.3),
              ),
            ),
          ),
          child: Text(
            item.$1,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.white,
              fontFamily: 'Preahvihear',
            ),
          ),
        ),
      );
    }).toList();
  }
}

/// Individual nav item with hover underline animation.
class _NavItem extends StatefulWidget {
  final String text;
  final GlobalKey sectionKey;

  const _NavItem({required this.text, required this.sectionKey});

  @override
  State<_NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<_NavItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          if (widget.sectionKey.currentContext != null) {
            Scrollable.ensureVisible(
              widget.sectionKey.currentContext!,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOutCubic,
            );
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.text,
              style: TextStyle(
                fontSize: kIsWeb ? 16 : 14,
                fontWeight: FontWeight.w500,
                color: _isHovered ? Colors.purpleAccent : Colors.white,
                fontFamily: 'Preahvihear',
              ),
            ),
            const SizedBox(height: 4),
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: _isHovered ? 24 : 0,
              height: 2,
              decoration: BoxDecoration(
                color: Colors.purpleAccent,
                borderRadius: BorderRadius.circular(1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Animated hamburger button for mobile.
class _HamburgerButton extends StatefulWidget {
  final VoidCallback onPressed;
  const _HamburgerButton({required this.onPressed});

  @override
  State<_HamburgerButton> createState() => _HamburgerButtonState();
}

class _HamburgerButtonState extends State<_HamburgerButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onPressed,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: _isHovered
                ? Colors.purpleAccent.withOpacity(0.15)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Icon(
            Icons.menu_rounded,
            color: Colors.white,
            size: 28,
          ),
        ),
      ),
    );
  }
}
