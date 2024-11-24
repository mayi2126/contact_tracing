part of 'visite_bloc.dart';

@immutable
sealed class VisiteState {}

final class VisiteInitial extends VisiteState {}

final class VisiteLoaded extends VisiteState {
  final List<Visite> visite;
  VisiteLoaded(this.visite);
}

final class VisiteError extends VisiteState {
  final String message;
  VisiteError(this.message);
}

final class VisiteLoading extends VisiteState {}

final class VisiteAdded extends VisiteState {
}