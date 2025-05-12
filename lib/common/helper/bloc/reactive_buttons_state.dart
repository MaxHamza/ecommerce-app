part of 'reactive_buttons_cubit.dart';

sealed class ReactiveButtonsState {}

final class ReactiveButtonsInitial extends ReactiveButtonsState {}
final class ReactiveButtonsLoading extends ReactiveButtonsState {}
final class ReactiveButtonsSuccess extends ReactiveButtonsState {}
final class ReactiveButtonsFailure extends ReactiveButtonsState {
  final String message;
  ReactiveButtonsFailure(this.message);
}
