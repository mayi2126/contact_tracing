part of 'referencement_bloc.dart';

@immutable
sealed class ReferencementState {}

final class ReferencementInitial extends ReferencementState {}

final class ReferencementGetLoading extends ReferencementState {}

final class ReferencementGetLoaded extends ReferencementState {
  final List<Referencement> referencements;
  ReferencementGetLoaded(this.referencements);
}

final class ReferencementGetError extends ReferencementState {
  final String errorMessage;
  ReferencementGetError(this.errorMessage);
}


/* -------------------------------------------------------------------------- */
/*                              Refered Ref     state                         */
/* -------------------------------------------------------------------------- */


final class ReferedRefGetLoading extends ReferencementState {}

final class ReferedRefGetLoaded extends ReferencementState {
  final List<Referencement> referedRefs;
  ReferedRefGetLoaded(this.referedRefs);
}

final class ReferedRefGetError extends ReferencementState {
  final String errorMessage;
  ReferedRefGetError(this.errorMessage);
}

/* -------------------------------------------------------------------------- */
/*                          contre refrencementState                          */
/* -------------------------------------------------------------------------- */


final class CounterReferencementLoading extends ReferencementState {}


final class CounterReferencementLoaded extends ReferencementState {
  final List<Referencement> counterReferencements;
  CounterReferencementLoaded(this.counterReferencements);
}

final class CounterReferencementError extends ReferencementState {
  final String errorMessage;
  CounterReferencementError(this.errorMessage);
}

