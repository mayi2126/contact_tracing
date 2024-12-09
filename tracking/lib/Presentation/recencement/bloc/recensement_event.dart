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
