part of 'visite_bloc.dart';

@immutable
sealed class VisiteEvent extends Equatable {
  const VisiteEvent();
  @override
  List<Object?> get props => [];
}

class AddVisiteDomicile extends VisiteEvent {
  final Visite visite;
  const AddVisiteDomicile(this.visite);
  @override
  List<Object?> get props => [visite];
}


class GetVisites extends VisiteEvent {
  final String dateMin;
  final String dateMax;
  const GetVisites( this.dateMin, this.dateMax);
  @override
  List<Object?> get props => [dateMin, dateMax];
}