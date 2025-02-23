import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tantawii_portfolio/utils/constants/image_strings.dart';
import '../../utils/helpers/global_keys.dart';
import '../widgets/build_name_abouts.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      key: GlobalKeys.aboutKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: LayoutBuilder(
          builder: (context, constraints) {
            bool isMobile = constraints.maxWidth < 800;

            return isMobile
                ? _buildMobileLayout()
                : _buildWebLayout();
          },
        ),
      ),
    );
  }

  Widget _buildWebLayout() {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildImageSection(),
            const SizedBox(width: 40),
            _buildTextSection(),
          ],
        ),
        Positioned(
          top: 0,
          bottom: 0,
          right: 0,
          left: 520,
          child: buildHelloText(),
        ),
      ],
    );
  }

  Widget _buildMobileLayout() {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildImageSection(),
            const SizedBox(height: 20),
            _buildTextSection(),
          ],
        ),
        Positioned(
          top: 0,
          bottom: 0,
          right: 0,
          left: 180,
          child: buildHelloText(),
        ),
      ],
    );
  }

  Widget _buildImageSection() {
    return Stack(
      alignment: Alignment.center,
      children: [
        SvgPicture.asset(
          IImages.backForProfileImage,
          width: 220,
          height: 220,
          fit: BoxFit.cover,
        ),
        Image.asset(
          IImages.d3_image,
          width: 180,
          height: 180,
          fit: BoxFit.cover,
        ),
      ],
    );
  }

  Widget _buildTextSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "A Designer who",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "Judges a book by its ",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              TextSpan(
                text: "cover...",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.purpleAccent,
                ),
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        Text(
          "Because if the cover does not impress you, what else can?",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w300,
            color: Colors.grey[400],
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
