part of 'data_bloc.dart';

@immutable
sealed class DataEvent {}



class FetchVillageQuartier extends DataEvent {

  final int id;
  FetchVillageQuartier(this.id);
}

class QuartierReset extends DataEvent {}



class VillageEvent extends DataEvent {}



class ThemesEvent extends DataEvent {
  final String type;
  ThemesEvent(this.type);
}


class ProfessionsEvent extends DataEvent {

}

class MotifsEvent extends DataEvent {
}