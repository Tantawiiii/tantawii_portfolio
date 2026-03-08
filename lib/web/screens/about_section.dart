import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:tantawii_portfolio/utils/constants/colors.dart';
import 'package:tantawii_portfolio/utils/constants/image_strings.dart';
import 'package:tantawii_portfolio/utils/helpers/global_keys.dart';
import 'package:tantawii_portfolio/utils/helpers/responsive.dart';
import '../widgets/animated_section.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);
    final isTablet = ResponsiveHelper.isTablet(context);
    final screenWidth = MediaQuery.sizeOf(context).width;

    final horizontalPadding = ResponsiveHelper.responsiveValue<double>(
      context,
      mobile: 24,
      tablet: 48,
      desktop: screenWidth * 0.1,
    );

    return Container(
      key: GlobalKeys.aboutKey,
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: isMobile ? 40 : 60,
      ),
      child: AnimatedSection(
        child: isMobile || isTablet
            ? _buildMobileLayout(context)
            : _buildDesktopLayout(context),
      ),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildImageSection(context),
        const SizedBox(width: 40),
        Expanded(child: _buildTextContent(context)),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildHelloText(context),
        const SizedBox(height: 16),
        _buildImageSection(context),
        const SizedBox(height: 24),
        _buildTextContent(context),
      ],
    );
  }

  Widget _buildHelloText(BuildContext context) {
    final fontSize = ResponsiveHelper.responsiveValue<double>(
      context,
      mobile: 14,
      desktop: 16,
    );
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'Hello! I Am ',
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.w600,
              color: Colors.white,
              fontFamily: 'Preahvihear',
            ),
          ),
          TextSpan(
            text: 'Ahmed Tantawii',
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.w600,
              color: Colors.purpleAccent,
              fontFamily: 'Preahvihear',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageSection(BuildContext context) {
    final imageSize = ResponsiveHelper.responsiveValue<double>(
      context,
      mobile: 160,
      tablet: 180,
      desktop: 220,
    );
    return Stack(
      alignment: Alignment.center,
      children: [
        SvgPicture.asset(
          IImages.backForProfileImage,
          width: imageSize + 20,
          height: imageSize + 20,
          fit: BoxFit.cover,
        ),
        ClipOval(
          child: Image.asset(
            IImages.profile,
            width: imageSize,
            height: imageSize,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }

  Widget _buildTextContent(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);
    final crossAxis =
        isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start;
    final textAlign = isMobile ? TextAlign.center : TextAlign.start;

    final titleSize = ResponsiveHelper.responsiveValue<double>(
      context,
      mobile: 20,
      tablet: 22,
      desktop: 24,
    );
    final headlineSize = ResponsiveHelper.responsiveValue<double>(
      context,
      mobile: 24,
      tablet: 28,
      desktop: 32,
    );

    return Column(
      crossAxisAlignment: crossAxis,
      children: [
        if (!isMobile) ...[
          _buildHelloText(context),
          const SizedBox(height: 16),
        ],
        Text(
          'A Designer who',
          style: TextStyle(
            fontSize: titleSize,
            fontWeight: FontWeight.w500,
            color: Colors.white,
            fontFamily: 'Preahvihear',
          ),
          textAlign: textAlign,
        ),
        const SizedBox(height: 4),
        RichText(
          textAlign: textAlign,
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Judges a book\nby its ',
                style: TextStyle(
                  fontSize: headlineSize,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  height: 1.3,
                  fontFamily: 'Preahvihear',
                ),
              ),
              TextSpan(
                text: 'cover',
                style: TextStyle(
                  fontSize: headlineSize,
                  fontWeight: FontWeight.bold,
                  color: Colors.purpleAccent,
                  fontFamily: 'Preahvihear',
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.purpleAccent,
                  decorationStyle: TextDecorationStyle.wavy,
                ),
              ),
              TextSpan(
                text: '...',
                style: TextStyle(
                  fontSize: headlineSize,
                  fontWeight: FontWeight.bold,
                  color: Colors.purpleAccent,
                  fontFamily: 'Preahvihear',
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'Because if the cover does not impress you what else can?',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w300,
            color: TColors.textGrey,
            fontFamily: 'Preahvihear',
          ),
          textAlign: textAlign,
        ),
        const SizedBox(height: 48),
        // "I'm a Software Engineer" with typing animation
        AnimatedSection(
          delay: const Duration(milliseconds: 300),
          child: _buildEngineerSection(context),
        ),
      ],
    );
  }

  Widget _buildEngineerSection(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);
    final crossAxis =
        isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start;
    final textAlign = isMobile ? TextAlign.center : TextAlign.start;

    final bigTitleSize = ResponsiveHelper.responsiveValue<double>(
      context,
      mobile: 28,
      tablet: 36,
      desktop: 42,
    );

    return Column(
      crossAxisAlignment: crossAxis,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "I'm a ",
              style: TextStyle(
                fontSize: bigTitleSize,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: 'Preahvihear',
              ),
            ),
            AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  'Software Engineer.',
                  textStyle: TextStyle(
                    fontSize: bigTitleSize,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: 'Preahvihear',
                  ),
                  speed: const Duration(milliseconds: 80),
                ),
                TypewriterAnimatedText(
                  'Flutter Developer.',
                  textStyle: TextStyle(
                    fontSize: bigTitleSize,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: 'Preahvihear',
                  ),
                  speed: const Duration(milliseconds: 80),
                ),
              ],
              repeatForever: true,
              pause: const Duration(seconds: 2),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Currently, I\'m a Software Engineer at  ',
              style: TextStyle(
                fontSize: isMobile ? 14 : 16,
                color: TColors.textGrey,
                fontFamily: 'Preahvihear',
              ),
            ),
            Icon(Icons.facebook, color: Colors.blue, size: isMobile ? 16 : 20),
            const SizedBox(width: 4),
            Text(
              'Facebook,',
              style: TextStyle(
                fontSize: isMobile ? 14 : 16,
                color: Colors.blue,
                fontWeight: FontWeight.w600,
                fontFamily: 'Preahvihear',
              ),
            ),
          ],
        ),
        const SizedBox(height: 32),
        SizedBox(
          width: isMobile ? double.infinity : 600,
          child: Text(
            'A self-taught UI/UX designer, functioning in the industry for 3+ years now.\n'
            'I make meaningful and delightful digital products that create an equilibrium\n'
            'between user needs and business goals.',
            style: TextStyle(
              fontSize: isMobile ? 14 : 16,
              fontWeight: FontWeight.w300,
              color: TColors.textGrey,
              height: 1.8,
              fontFamily: 'Preahvihear',
            ),
            textAlign: textAlign,
          ),
        ),
      ],
    );
  }
}
