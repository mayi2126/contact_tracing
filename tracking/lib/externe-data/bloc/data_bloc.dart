import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tracking/db/selects/selects.dart';
import 'package:tracking/externe-data/repo/quartier_repo.dart';
import 'package:tracking/externe-data/repo/theme_repo.dart';

part 'data_event.dart';
part 'data_state.dart';

/* -------------------------------- Quartier -------------------------------- */
class DataBloc extends Bloc<DataEvent, DataState> {
  

  DataBloc() : super(DataInitial()) {
    on<QuartierReset>((event, emit) async {emit(DataInitial());});
    
    on<FetchVillageQuartier>((event, emit) async {
      
      emit(VillageQuartierLoading());
      try {
        // final QuartierRepository quartierRepository = QuartierRepository();
        final villagesQuartiers =
            await retrievedQuartiersData(event.id);
        emit(VillageQuartierLoaded(villagesQuartiers));
      } catch (e) {
        emit(VillageQuartierError(e.toString()));
      }
    });
  }
}


/* --------------------------------- Village -------------------------------- */
class VillageBloc extends Bloc<DataEvent, DataState> {
  // final VillageRepository villageRepository;

  VillageBloc() : super(VillageInitial()) {
    on<VillageEvent>((event, emit) async {
      emit(VillageLoading());
      try {
        final villages =
            await retrievedVillagesData();
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
  

  ProfessionBloc() : super(ProfessionInitial()) {    
    on<ProfessionsEvent>((event, emit) async {
      emit(ProfessionLoading());
      try {
        final professions = await retrievedProfessionsData();
        emit(ProfessionLoaded(professions));
      } catch (e) {
        emit(ProfessionError(e.toString()));
      }
    });
  }
}

/* ---------------------------------- Motif --------------------------------- */
class MotifBloc extends Bloc<DataEvent, DataState> {

  MotifBloc() : super(MotifInitial()) {
    on<MotifsEvent>((event, emit) async {
      emit(MotifLoading());
      try {
        final professions = await retrievedMotifsData();
        emit(MotifLoaded(professions));
      } catch (e) {
        emit(MotifError(e.toString()));
      }
    });
  }
}


