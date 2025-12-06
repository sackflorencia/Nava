import 'package:flutter/material.dart';
import 'package:nava/src/routes/router.dart';
import 'package:nava/src/theme/app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      routerConfig: router, 
    );
  }
}