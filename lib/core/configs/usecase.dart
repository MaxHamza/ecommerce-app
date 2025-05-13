
abstract class UseCases<type,params>{
  Future<type>call(params ?param);
}