import 'package:flutter/material.dart';
import 'package:tantawii_portfolio/portoflio.dart';

import 'utils/routing/app_router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    Portfolio(
      appRouter: AppRouter(),
    ),
  );
}
