part of 'data_bloc.dart';

@immutable
sealed class DataEvent {}



class FetchVillageQuartier extends DataEvent {}



class VillageEvent extends DataEvent {}



class ThemesEvent extends DataEvent {}