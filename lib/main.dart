import 'package:flutter/material.dart';
import 'package:shop_application/core/configs/theme/app_theme.dart';
import 'package:shop_application/presentation/splash/pages/splash_screen.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.appTheme,
      home:const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
