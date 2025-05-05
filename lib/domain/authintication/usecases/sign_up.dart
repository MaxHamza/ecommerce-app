import 'package:dartz/dartz.dart';
import 'package:shop_application/core/configs/usecase.dart';
import 'package:shop_application/data/auth/models/create_user.dart';
import 'package:shop_application/domain/authintication/repository/auth.dart';
import '../../../service_locator.dart';

class SignUpUseCase extends UseCases<Either,UserCreateReq>{
  @override
  Future<Either> call(UserCreateReq param) async{
   return sl<AuthRepository>().signUp(param);
  }

}