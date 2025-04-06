import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'after_splash_state.dart';

class AfterSplashCubit extends Cubit<AfterSplashState> {
  AfterSplashCubit() : super(AfterSplashInitial());
}
