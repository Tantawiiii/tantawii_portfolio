import 'package:flutter/material.dart';
import 'package:tantawii_portfolio/utils/constants/colors.dart';
import 'package:tantawii_portfolio/utils/helpers/global_keys.dart';
import 'package:tantawii_portfolio/utils/helpers/responsive.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/animated_section.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

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

    return Container(
      key: GlobalKeys.contactKey,
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: isMobile ? 40 : 80,
      ),
      child: AnimatedSection(
        child: Column(
          children: [
            Text(
              'Get In Touch',
              style: TextStyle(
                fontSize: isMobile ? 28 : 36,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: 'Preahvihear',
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: isMobile ? double.infinity : 500,
              child: Text(
                'Although I\'m not currently looking for any new opportunities, '
                'my inbox is always open. Whether you have a question or just '
                'want to say hi, I\'ll try my best to get back to you!',
                style: TextStyle(
                  fontSize: isMobile ? 14 : 16,
                  color: TColors.textGrey,
                  height: 1.7,
                  fontFamily: 'Preahvihear',
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 40),
            _SayHelloButton(),
            const SizedBox(height: 60),
            // Social links
            _SocialLinks(isMobile: isMobile),
            const SizedBox(height: 40),
            // Footer
            Text(
              '© ${DateTime.now().year} Ahmed Tantawii. All rights reserved.',
              style: TextStyle(
                fontSize: 12,
                color: TColors.textGrey.withOpacity(0.6),
                fontFamily: 'Preahvihear',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SayHelloButton extends StatefulWidget {
  @override
  State<_SayHelloButton> createState() => _SayHelloButtonState();
}

class _SayHelloButtonState extends State<_SayHelloButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () async {
          final uri = Uri.parse('mailto:tantawii@example.com');
          if (await canLaunchUrl(uri)) {
            launchUrl(uri);
          }
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 16),
          decoration: BoxDecoration(
            color: _isHovered
                ? Colors.purpleAccent.withOpacity(0.2)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Colors.purpleAccent,
              width: 1.5,
            ),
            boxShadow: _isHovered
                ? [
                    BoxShadow(
                      color: Colors.purpleAccent.withOpacity(0.2),
                      blurRadius: 20,
                      spreadRadius: 0,
                    ),
                  ]
                : [],
          ),
          child: Text(
            'Say Hello 👋',
            style: TextStyle(
              fontSize: 16,
              color: Colors.purpleAccent,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.0,
              fontFamily: 'Preahvihear',
            ),
          ),
        ),
      ),
    );
  }
}

class _SocialLinks extends StatelessWidget {
  final bool isMobile;
  const _SocialLinks({required this.isMobile});

  @override
  Widget build(BuildContext context) {
    final links = [
      _SocialItem(Icons.link, 'GitHub', 'https://github.com'),
      _SocialItem(Icons.work_outline, 'LinkedIn', 'https://linkedin.com'),
      _SocialItem(Icons.code, 'Twitter', 'https://twitter.com'),
    ];

    return Wrap(
      spacing: isMobile ? 20 : 32,
      runSpacing: 16,
      alignment: WrapAlignment.center,
      children: links.map((item) => _SocialIcon(item: item)).toList(),
    );
  }
}

class _SocialItem {
  final IconData icon;
  final String label;
  final String url;

  _SocialItem(this.icon, this.label, this.url);
}

class _SocialIcon extends StatefulWidget {
  final _SocialItem item;
  const _SocialIcon({required this.item});

  @override
  State<_SocialIcon> createState() => _SocialIconState();
}

class _SocialIconState extends State<_SocialIcon> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () async {
          final uri = Uri.parse(widget.item.url);
          if (await canLaunchUrl(uri)) {
            launchUrl(uri);
          }
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          transform: _isHovered
              ? (Matrix4.identity()..translate(0, -4, 0))
              : Matrix4.identity(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: _isHovered
                      ? Colors.purpleAccent.withOpacity(0.2)
                      : TColors.cardBackground.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: _isHovered
                        ? Colors.purpleAccent.withOpacity(0.6)
                        : TColors.cardBorderColor,
                  ),
                ),
                child: Icon(
                  widget.item.icon,
                  color: _isHovered ? Colors.purpleAccent : Colors.white70,
                  size: 22,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                widget.item.label,
                style: TextStyle(
                  fontSize: 12,
                  color: _isHovered ? Colors.purpleAccent : TColors.textGrey,
                  fontFamily: 'Preahvihear',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
