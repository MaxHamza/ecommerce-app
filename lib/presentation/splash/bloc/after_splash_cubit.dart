import'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';
part 'after_splash_state.dart';

class AfterSplashCubit extends Cubit<AfterSplashState> {
  AfterSplashCubit() : super(AfterSplashInitial());
 Future<void> appStarted()async{
await Future.delayed(Duration(seconds: 2));
   emit(AfterSplashUnAuth());
 }

}
