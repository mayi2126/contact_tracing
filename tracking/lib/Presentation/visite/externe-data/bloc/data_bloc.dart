import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tracking_pregnant/Presentation/visite/externe-data/repo/quartier_repo.dart';
import 'package:tracking_pregnant/Presentation/visite/externe-data/repo/theme_repo.dart';
import 'package:tracking_pregnant/Presentation/visite/externe-data/repo/village_repo.dart';

part 'data_event.dart';
part 'data_state.dart';

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


class ThemeBloc extends Bloc<DataEvent, DataState> {
  final ThemesRepository _themesRepository;

  ThemeBloc(this._themesRepository) : super(ThemeInitial()) {
    on<ThemesEvent>((event, emit) async {
      emit(ThemeLoading());
      try {
        final themes =
            await _themesRepository.fetchThemesByType('ACTIVITÉS PRÉVENTIVES ');
        emit(ThemeLoaded(themes));
      } catch (e) {
        emit(ThemeError(e.toString()));
      }
    });
  }
}


