part of 'data_bloc.dart';

@immutable
sealed class DataState {}

final class DataInitial extends DataState {}


class VillageQuartierLoading extends DataState {}

class VillageQuartierLoaded extends DataState {
  final List<Map<String, dynamic>> villagesquartiers;
  VillageQuartierLoaded(this.villagesquartiers);
}

class VillageQuartierError extends DataState {
  final String message;
  VillageQuartierError(this.message);
}


final class VillageInitial extends DataState {}


class VillageLoading extends DataState {}

class VillageLoaded extends DataState {
  final List<Map<String, dynamic>> villages;
  VillageLoaded(this.villages);
}

class VillageError extends DataState {
  final String message;
  VillageError(this.message);
}


final class ThemeInitial extends DataState {}


class ThemeLoading extends DataState {}

class ThemeLoaded extends DataState {
  final List<Map<String, dynamic>> themes;
  ThemeLoaded(this.themes);
}

class ThemeError extends DataState {
  final String message;
  ThemeError(this.message);
}

