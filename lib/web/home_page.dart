
import 'package:flutter/material.dart';
import 'package:tantawii_portfolio/utils/constants/colors.dart';

import 'header_menu.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.primaryBackground,
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderMenu(),
            //

          ],

        ),
      ),
    );
  }
}
