import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_application/core/configs/theme/app_theme.dart';
import 'package:shop_application/firebase_options.dart';
import 'package:shop_application/presentation/authintication/bloc/age_selection_cubit.dart';
import 'package:shop_application/presentation/authintication/bloc/gender_cubit.dart';
import 'package:shop_application/presentation/authintication/bloc/get_ages_cubit.dart';
import 'package:shop_application/presentation/splash/bloc/after_splash_cubit.dart';
import 'package:shop_application/presentation/splash/pages/splash_screen.dart';
import 'package:shop_application/service_locator.dart';
// Import the generated file
import 'firebase_options.dart';
// Import the generated file

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
 await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AgeSelectionCubit>(create: (context)=>AgeSelectionCubit()),
        BlocProvider<GetAgesCubit>(create: (context)=>GetAgesCubit()),
        BlocProvider<AfterSplashCubit>(create: (context)=>AfterSplashCubit()..appStarted()),
      ],
      child: MaterialApp(
        theme: AppTheme.appTheme,
        home: const SplashScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
