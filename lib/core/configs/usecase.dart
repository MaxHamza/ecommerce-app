import '../../data/auth/models/create_user.dart';

abstract class UseCases<type,params>{
  Future<type>call(params ?param);
}