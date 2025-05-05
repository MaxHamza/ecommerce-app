import 'package:dartz/dartz.dart';
import 'package:shop_application/data/auth/source/auth_firebase_service.dart';
import 'package:shop_application/domain/authintication/repository/auth.dart';
import '../../../service_locator.dart';
import '../models/create_user.dart';

class AuthRepositoryImpl extends AuthRepository{

  @override
  Future<Either> signUp(UserCreateReq createUser)async {
   return sl<AuthFirebaseService>().signUp(createUser);
  }

}