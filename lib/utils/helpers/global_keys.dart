import 'package:flutter/widgets.dart';

class GlobalKeys {
  static final GlobalKey aboutKey = GlobalKey();
  static final GlobalKey workExperienceKey = GlobalKey();
  static final GlobalKey skillsKey = GlobalKey();
  static final GlobalKey projectsKey = GlobalKey();
  static final GlobalKey contactKey = GlobalKey();

  // Legacy aliases
  static GlobalKey get servicesKey => workExperienceKey;
  static GlobalKey get portfolioKey => skillsKey;
  static GlobalKey get hobbiesKey => projectsKey;
  static GlobalKey get letsTalkKey => contactKey;
}