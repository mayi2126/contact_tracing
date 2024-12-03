import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:tracking/Presentation/visite/data/Models/visite.dart';
import 'package:tracking/Presentation/visite/data/Models/visite_model.dart';
import 'package:tracking/Presentation/visite/data/Repository/retrieve_vististe.dart';
import 'package:tracking/Presentation/visite/data/Repository/visite_repo.dart';
import 'package:tracking/components/utils/date_filter.dart';

part 'visite_event.dart';
part 'visite_state.dart';

class VisiteBloc extends Bloc<VisiteEvent, VisiteState> {
  VisiteBloc() : super(VisiteInitial()) {
    on<AddVisiteDomicile>(_onAddVisiteDomicile);
    on<GetVisites>(_onGetVisites);
  }

  Future<void> _onAddVisiteDomicile(
      AddVisiteDomicile event, Emitter<VisiteState> emit) async {
    emit(VisiteLoading());
    final VisiteRepositoryImpl visiteRepository = VisiteRepositoryImpl();
    final bool result = await visiteRepository.addVisiteDomicile(event.visite);
    if (result) {
      emit(VisiteAdded());
    } else {
      emit(VisiteError("Erreur lors de l'ajout de la visite"));
    }
  }

  Future<void> _onGetVisites(
      GetVisites event, Emitter<VisiteState> emit) async {
    emit(VisiteGetLoading());

    final RetrieveVisiteRepositoryImpl retrieveVisiteRepository =
        RetrieveVisiteRepositoryImpl();

    try {
      final List<VisiteModel> result = await retrieveVisiteRepository
          .fetchVisitesById(event.dateMin, event.dateMax);
        

      if (result.isNotEmpty)
       {
                final List<VisiteModel> todayVisites = filterResultsByToday(result);

        
        emit(VisiteGetLoaded(result,todayVisites));
      }
      else {
        
      emit(VisiteIsEmpty());
      }

    } catch (e) {
      print(e.toString());
    emit(VisiteGetError("Erreur lors de la récupération des visites"));

    }

  }
}
