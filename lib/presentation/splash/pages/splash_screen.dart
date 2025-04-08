import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_application/core/configs/assets/add_image.dart';
import 'package:shop_application/core/configs/theme/app_colors.dart';
import 'package:shop_application/presentation/authintication/pages/sign_in.dart';
import 'package:shop_application/presentation/splash/bloc/after_splash_cubit.dart';
import 'package:shop_application/presentation/splash/bloc/after_splash_cubit.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context){
    return BlocListener<AfterSplashCubit, AfterSplashState>(
      listener: (context, state){
       if(state is AfterSplashUnAuth){
         Navigator.push(context, MaterialPageRoute(builder: (context)=>const SignIn()));
       }
      },
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: Center(
          child: SvgPicture.asset(AppImage.logo),
        ),
      ),
    );
  }
}
