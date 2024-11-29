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

class GetCauserie extends CauserieEvent {
  final String id;

  const GetCauserie(this.id);

  @override
  List<Object> get props => [id];
}

class GetCauseries extends CauserieEvent {
  const GetCauseries();


  @override
  List<Object> get props => [];
}
