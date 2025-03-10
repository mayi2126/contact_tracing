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

/* --------------------------------- Themes --------------------------------- */
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


/* ------------------------------- Professions ------------------------------ */


final class ProfessionInitial extends DataState {}


class ProfessionLoading extends DataState {}

class ProfessionLoaded extends DataState {
  final List<Map<String, dynamic>> professions;
  ProfessionLoaded(this.professions);
}

class ProfessionError extends DataState {
  final String message;
  ProfessionError(this.message);
}


/* ---------------------------------- Motif --------------------------------- */

final class MotifInitial extends DataState {}


class MotifLoading extends DataState {}

class MotifLoaded extends DataState {
  final List<Map<String, dynamic>> motifs;
  MotifLoaded(this.motifs);
}

class MotifError extends DataState {
  final String message;
  MotifError(this.message);
}

/* --------------------------- Element de Donnees --------------------------- */

class ElementDeDonneInitial extends DataState {}

class ElementDeDonneLoading extends DataState {}

class ElementDeDonneLoaded extends DataState {
  final List<Map<String, dynamic>> elements;
  ElementDeDonneLoaded(this.elements);
}

class ElementDeDonneError extends DataState {
  final String message;
  ElementDeDonneError(this.message);
}

