part of 'list_bloc.dart';

@immutable
sealed class ListState {}

final class ListInitial extends ListState {}


/* -------------------------------------------------------------------------- */
/*                          contre refrencementState                          */
/* -------------------------------------------------------------------------- */


final class CounterReferencementLoading extends ListState {}


final class CounterReferencementLoaded extends ListState {
  final List<Referencement> counterReferencements;
  CounterReferencementLoaded(this.counterReferencements);
}

final class CounterReferencementError extends ListState {
  final String errorMessage;
  CounterReferencementError(this.errorMessage);
}

/* ------------------------------- Contre ref ------------------------------- */


final class ContreReferencementLoading extends ListState {}


final class ContreReferencementLoaded extends ListState {
  final List<Referencement> contreReferencements;
  ContreReferencementLoaded(this.contreReferencements);
}

final class ContreReferencementError extends ListState {
  final String errorMessage;
  ContreReferencementError(this.errorMessage);
}
