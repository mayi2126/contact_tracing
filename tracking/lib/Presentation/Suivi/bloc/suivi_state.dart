part of 'suivi_bloc.dart';

@immutable
sealed class SuiviState {}

final class SuiviInitial extends SuiviState {}

/* -------------------------- Get femmes enceintes -------------------------- */

class GetPatientsLoading extends SuiviState {}

class GetPatientsSuccess extends SuiviState {
  final List<Referencement> patients;
  GetPatientsSuccess(this.patients);
}

class GetPatientsError extends SuiviState {
  final String message;
  GetPatientsError(this.message);
}

/* -------------------------- Get femme enceinte -------------------------- */

