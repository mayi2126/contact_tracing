part of 'causerie_bloc.dart';

@immutable
sealed class CauserieState {}

final class CauserieInitial extends CauserieState {}


final class CauserieLoaded extends CauserieState {
  final List<Causerie> causerie;
  CauserieLoaded(this.causerie);
}

final class CauserieError extends CauserieState {
  final String message;
  CauserieError(this.message);
}

final class CauserieLoading extends CauserieState {}

final class CauserieAdded extends CauserieState {
}
