import 'package:flutter_bloc/flutter_bloc.dart';


class AgeSelectionCubit extends Cubit<String> {
  AgeSelectionCubit() : super('Age Range');
  String selectedAge='';
 void displayAge(String age){
  selectedAge=age;
  emit(age);
 }
}
