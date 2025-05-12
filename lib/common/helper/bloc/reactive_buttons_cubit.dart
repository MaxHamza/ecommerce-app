import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_application/core/configs/usecase.dart';
import 'package:shop_application/data/auth/models/create_user.dart';

part 'reactive_buttons_state.dart';

class ReactiveButtonsCubit extends Cubit<ReactiveButtonsState> {
  ReactiveButtonsCubit() : super(ReactiveButtonsInitial());

  Future<void> execute(
      {required UseCases useCases, required dynamic param}) async {
    emit(ReactiveButtonsLoading());
    try {
      Either returnedData = await useCases.call(param);
      returnedData.fold((message) => emit(ReactiveButtonsFailure(message)),
          (_) => emit(ReactiveButtonsSuccess()));
    } catch (e) {
      emit(ReactiveButtonsFailure(e.toString()));
    }
  }
}
