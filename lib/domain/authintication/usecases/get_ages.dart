import 'package:dartz/dartz.dart';
import 'package:shop_application/core/configs/usecase.dart';
import 'package:shop_application/data/auth/models/create_user.dart';
import 'package:shop_application/domain/authintication/repository/auth.dart';
import '../../../service_locator.dart';

class GetAges extends UseCases<Either,dynamic>{
  @override
  Future<Either> call(dynamic param) {
    return sl<AuthRepository>().getAges();
  }

}