import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tracking/externe-data/repo/professions_repo.dart';
import 'package:tracking/externe-data/repo/quartier_repo.dart';
import 'package:tracking/externe-data/repo/theme_repo.dart';
import 'package:tracking/externe-data/repo/village_repo.dart';

part 'data_event.dart';
part 'data_state.dart';

/* -------------------------------- Quartier -------------------------------- */
class DataBloc extends Bloc<DataEvent, DataState> {
  final QuartierRepository quartierRepository;

  DataBloc(this.quartierRepository) : super(DataInitial()) {
    on<FetchVillageQuartier>((event, emit) async {
      emit(VillageQuartierLoading());
      try {
        final villagesQuartiers =
            await quartierRepository.fetchVillageQuartier();
        emit(VillageQuartierLoaded(villagesQuartiers));
      } catch (e) {
        emit(VillageQuartierError(e.toString()));
      }
    });
  }
}


/* --------------------------------- Village -------------------------------- */
class VillageBloc extends Bloc<DataEvent, DataState> {
  final VillageRepository villageRepository;

  VillageBloc(this.villageRepository) : super(VillageInitial()) {
    on<VillageEvent>((event, emit) async {
      emit(VillageLoading());
      try {
        final villages =
            await villageRepository.fetchVillage();
        emit(VillageLoaded(villages));
      } catch (e) {
        emit(VillageError(e.toString()));
      }
    });
  }
}

/* --------------------------------- Themes --------------------------------- */
class ThemeBloc extends Bloc<DataEvent, DataState> {
  final ThemesRepository _themesRepository;

  ThemeBloc(this._themesRepository) : super(ThemeInitial()) {
    on<ThemesEvent>((event, emit) async {
      emit(ThemeLoading());
      try {
        final themes =
            await _themesRepository.fetchThemesByType(event.type);
        emit(ThemeLoaded(themes));
      } catch (e) {
        emit(ThemeError(e.toString()));
      }
    });
  }
}

/* ------------------------------- Professions ------------------------------ */
class ProfessionBloc extends Bloc<DataEvent, DataState> {
  final ProfessionsRepository _professionsRepository;

  ProfessionBloc(this._professionsRepository) : super(ProfessionInitial()) {    
    on<ProfessionsEvent>((event, emit) async {
      emit(ProfessionLoading());
      try {
        final professions = await _professionsRepository.fetchProfessions();
        emit(ProfessionLoaded(professions));
      } catch (e) {
        emit(ProfessionError(e.toString()));
      }
    });
  }
}


