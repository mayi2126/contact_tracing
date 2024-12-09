import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:tracking/Presentation/Causeries/data/Models/causerie.dart';
import 'package:tracking/Presentation/Causeries/data/Repository/causerie_repository.dart';
import 'package:tracking/Presentation/Causeries/data/Repository/retrieve_repository.dart';
import 'package:tracking/Presentation/Causeries/data/Repository/update_causerie.dart';
import 'package:tracking/Presentation/visite/data/Models/visite_model.dart';

import 'package:tracking/components/utils/date_filter.dart';

part 'causerie_event.dart';
part 'causerie_state.dart';

class CauserieBloc extends Bloc<CauserieEvent, CauserieState> {

  CauserieBloc() : super(CauserieInitial()) {
    on<CreateCauserie>(_onAddCauserie);
    on<GetCauseries>(_onRetrieveCauserie);
    on<UpdateCauserie>(_onCauserieUpdate);
  }

  Future<void> _onAddCauserie(
      CreateCauserie event, Emitter<CauserieState> emit) async {
    emit(CauserieLoading());
    final CauserieRepositoryImpl causerieRepository = CauserieRepositoryImpl();
    final bool result = await causerieRepository.addCauserie(event.causerie);
    if (result) {
      emit(CauserieAdded());
    } else {
      emit(CauserieError("Erreur lors de l'ajout de la visite"));
    }
  }

  Future<void> _onRetrieveCauserie(
      GetCauseries event, Emitter<CauserieState> emit) async {
    
    emit(CauserieGetLoading());

    final RetrieveCauserieRepositoryImpl retrieveVisiteRepository =
        RetrieveCauserieRepositoryImpl();

    try {
      final List<VisiteModel> result = await retrieveVisiteRepository
          .fetchCauserieById(event.dateMin, event.dateMax);


    

      if (result.isNotEmpty) {
        final List<VisiteModel> todayVisites = filterResultsByToday(result);
        emit(CauserieGetLoaded(result,todayVisites));
      } else {
        emit(CauserieIsEmpty());
      }
    } catch (e) {
      emit(CauserieGetError("Erreur lors de la récupération des causeries"));
    }
  }



  Future<void> _onCauserieUpdate(UpdateCauserie event, Emitter<CauserieState> emit) async {
    try {

      emit(CauserieUpdateLoading());
      final UpdateCauserieImpl updateCauserie = UpdateCauserieImpl();
      
      bool result = await updateCauserie.updateCauserie(event.causerie, event.id);

      if (result) {
        emit(CauserieUpdated());
      }
      else {
        emit(CauserieUpdateError("Erreur lors de la mise à jour de la Causerie"));
      }
    } catch (e) {
        emit(CauserieUpdateError("Erreur lors de la mise à jour de la Causerie"));

    }
  }


 

}
