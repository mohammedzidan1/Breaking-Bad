import 'dart:ui';

import 'package:flutter/material.dart';
import 'helper/routs/app_routs.dart';

void main() {
  runApp(BreakingBadApp(
    appRouts: AppRouts(),
  ));
}

class BreakingBadApp extends StatelessWidget {
  final AppRouts appRouts;
  const BreakingBadApp({Key? key, required this.appRouts}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouts.genirateRoute,
    );
  }
}
