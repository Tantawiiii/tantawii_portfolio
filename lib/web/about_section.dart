import 'package:flutter/material.dart';
import 'package:tantawii_portfolio/utils/constants/image_strings.dart';

import '../utils/helpers/global_keys.dart';

class AboutSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      key: GlobalKeys.aboutKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Image.asset(
                      width: 200,
                      height: 200,
                      fit: BoxFit.cover,
                      IImages.d3_image,
                  ),

                  Positioned(
                    top: -20,
                    child: Text(
                      "Hello! I am Ibrahim Memon",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.purpleAccent,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(width: 20),
              // Title Section
              Column(
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
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        TextSpan(
                          text: "cover...",
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.purpleAccent,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  // Subtitle Section
                  Text(
                    "Because if the cover does not impress you what else can?",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                      color: Colors.grey[400],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),

            ],
          ),
        ),
    );
  }
}

