import 'package:get_it/get_it.dart';
import 'package:shop_application/data/auth/repository/auth_repository_impl.dart';
import 'package:shop_application/domain/authintication/repository/auth.dart';
import 'package:shop_application/domain/authintication/usecases/sign_up.dart';

import 'data/auth/source/auth_firebase_service.dart';

final sl=GetIt.instance;
Future<void>initializeDependencies()async{
  //services
  sl.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());
  //repositories
 sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());

  //useCases
  sl.registerSingleton<SignUpUseCase>(SignUpUseCase());
}