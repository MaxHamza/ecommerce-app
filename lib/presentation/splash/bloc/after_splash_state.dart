part of 'after_splash_cubit.dart';

@immutable
sealed class AfterSplashState {}

final class AfterSplashInitial extends AfterSplashState {}
final class AfterSplashAuth extends AfterSplashState {}
final class AfterSplashUnAuth extends AfterSplashState {}
final class AfterSplashDisplaySplash extends AfterSplashState {}
