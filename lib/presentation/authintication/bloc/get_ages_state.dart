part of 'get_ages_cubit.dart';

sealed class GetAgesState {}

final class GetAgesLoading extends GetAgesState {}
final class GetAgesLoaded extends GetAgesState {
  List<QueryDocumentSnapshot<Map<String,dynamic>>> query;
  GetAgesLoaded({required this.query});
}
final class GetAgesFailure extends GetAgesState {
  final String message;
  GetAgesFailure({required this.message});
}