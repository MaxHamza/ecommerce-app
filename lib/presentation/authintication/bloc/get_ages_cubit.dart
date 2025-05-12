import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_application/domain/authintication/usecases/get_ages.dart';
import '../../../service_locator.dart';
part 'get_ages_state.dart';

class GetAgesCubit extends Cubit<GetAgesState> {
  GetAgesCubit() : super(GetAgesInitial());
  void getAges() async {
    emit(GetAgesLoading());
    var returnedData = await sl<GetAges>().call('')..fold((l) => null, (r) => null);
    returnedData.fold((message) => emit(GetAgesFailure(message: message)),
        (data) => emit(GetAgesLoaded(query: data)));
  }
}
