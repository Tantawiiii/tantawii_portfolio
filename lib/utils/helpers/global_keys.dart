import 'package:flutter/widgets.dart';

class GlobalKeys {
  static final GlobalKey aboutKey = GlobalKey();
  static final GlobalKey servicesKey = GlobalKey();
  static final GlobalKey portfolioKey = GlobalKey();
  static final GlobalKey hobbiesKey = GlobalKey();
  static final GlobalKey letsTalkKey = GlobalKey();

}


/**
 *
 *
 *    onTap: () {
    Scrollable.ensureVisible(
    GlobalKeys.aboutKey.currentContext!,
    duration: const Duration(milliseconds: 200),
    curve: Curves.easeInOut,
    );
    },
 *
 *
 */