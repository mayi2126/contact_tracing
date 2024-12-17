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