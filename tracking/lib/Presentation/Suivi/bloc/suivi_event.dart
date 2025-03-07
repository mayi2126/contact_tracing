part of 'suivi_bloc.dart';

@immutable
sealed class SuiviEvent {}

class GetPatientsEvent extends SuiviEvent {
  
}

class GetPatientSuiviEvent extends SuiviEvent {
  final String? min;
  final String? max;
  GetPatientSuiviEvent({this.min, this.max});
}
