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