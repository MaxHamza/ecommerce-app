import 'package:flutter_bloc/flutter_bloc.dart';
part 'gender_state.dart';

class GenderCubit extends Cubit<int> {
  GenderCubit() : super(0);
  int gender = 0;
  void genderChange(int index) {
    gender = index;
    emit(index);
  }
}
