part of 'manage_bloc.dart';

@immutable
sealed class ManageEvent {}

class AddingSuiviEvent extends ManageEvent {
  final Suivi suivi;
  AddingSuiviEvent(this.suivi);
}
