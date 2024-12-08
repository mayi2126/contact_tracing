part of 'causerie_bloc.dart';

@immutable
sealed class CauserieEvent extends Equatable {
  const CauserieEvent();

  @override
  List<Object> get props => [];
}

class CreateCauserie extends CauserieEvent {
  final Causerie causerie;
  const CreateCauserie(this.causerie);

  @override
  List<Object> get props => [causerie];
  
}

class GetCauseries extends CauserieEvent {
  final String dateMin;
  final String dateMax;
  const GetCauseries( this.dateMin, this.dateMax);
  @override
  List<Object> get props => [dateMin, dateMax];
}

