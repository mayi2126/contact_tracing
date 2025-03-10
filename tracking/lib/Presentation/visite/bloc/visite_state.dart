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
/* -------------------------------------------------------------------------- */
/*                                 Get visites                                */
/* -------------------------------------------------------------------------- */


final class VisiteGetInitial extends VisiteState {}

final class VisiteGet extends VisiteState {}

final class VisiteGetLoaded extends VisiteState {
  final List<VisiteModel> visites;
  final List<VisiteModel> todaysVisites;
  VisiteGetLoaded(this.visites,this.todaysVisites);
}

final class VisiteGetError extends VisiteState {
  final String message;
  VisiteGetError(this.message);
}

final class VisiteGetLoading extends VisiteState {}


final class VisiteGetYesterday extends VisiteState {
  
}

final class VisiteIsEmpty extends VisiteState {
  
}


/* -------------------------------------------------------------------------- */
/*                                Update Visite                               */
/* -------------------------------------------------------------------------- */

final class VisiteUpdated extends VisiteState {}

final class VisiteUpdateError extends VisiteState {
  final String message;
  VisiteUpdateError(this.message);
}

final class VisiteUpdateLoading extends VisiteState {}