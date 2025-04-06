import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_application/core/configs/assets/add_image.dart';
import 'package:shop_application/core/configs/theme/app_colors.dart';
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: SvgPicture.asset(AppImage.logo),
      ),
    );
  }
}
