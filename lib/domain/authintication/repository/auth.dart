import 'package:dartz/dartz.dart';
import 'package:shop_application/data/auth/models/create_user.dart';

abstract class AuthRepository{
  Future<Either>signUp(UserCreateReq createUser);
}