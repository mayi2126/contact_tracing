part of 'manage_bloc.dart';

@immutable
sealed class ManageState {}

final class ManageInitial extends ManageState {}

final class AddingLoading extends ManageState {}

final class AddingError extends ManageState {
  final String message;
  AddingError(this.message);
}

final class AddSuiviSuccessed extends ManageState {}
