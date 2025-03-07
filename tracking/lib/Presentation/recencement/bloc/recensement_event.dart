part of 'recensement_bloc.dart';

sealed class RecensementEvent extends Equatable {
  const RecensementEvent();

  @override
  List<Object> get props => [];
}


class StoreInfoGenRec extends RecensementEvent {
  final InfoGenRec infoGenRec;
  const StoreInfoGenRec(this.infoGenRec);
}


class AddChefMenage extends RecensementEvent {
  final Menage menage;
  const AddChefMenage(this.menage);
}

class AddMenageMember extends RecensementEvent {
  final Member menage;
  const AddMenageMember(this.menage);
}


class ConfirmationRecensement extends RecensementEvent {
const ConfirmationRecensement();
}


class HandleGetRecensement extends RecensementEvent {
  final String dateMin;
  final String dateMax;
  const HandleGetRecensement( this.dateMin, this.dateMax);
  @override
  List<Object> get props => [dateMin, dateMax];
}
