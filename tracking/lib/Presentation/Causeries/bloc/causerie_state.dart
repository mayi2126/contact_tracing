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


/* ------------------------------ GET CAUSERIES ----------------------------- */

final class CauserieGetLoaded extends CauserieState {
  final List<VisiteModel> causeries;
    final List<VisiteModel> todaysCauseries;

  CauserieGetLoaded(this.causeries,this.todaysCauseries);
}

final class TodaysCauserie extends CauserieState {
  final List<VisiteModel> todaysCauseries;
  TodaysCauserie(this.todaysCauseries);
}

final class CauserieGetError extends CauserieState {
  final String message;
  CauserieGetError(this.message);
}

final class CauserieGetLoading extends CauserieState {}

final class CauserieGetAdded extends CauserieState {
}


final class CauserieIsEmpty extends CauserieState {
}


final class CauserieGetSearch extends CauserieState {
  
}
