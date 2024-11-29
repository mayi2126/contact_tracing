import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:tracking_pregnant/Presentation/Causeries/data/Models/causerie.dart';
import 'package:tracking_pregnant/Presentation/Causeries/data/Repository/causerie_repository.dart';

part 'causerie_event.dart';
part 'causerie_state.dart';

class CauserieBloc extends Bloc<CauserieEvent, CauserieState> {

  final CauserieRepositoryImpl causerieRepository ;



  CauserieBloc({required this.causerieRepository}) : super(CauserieInitial()) {
    on<CreateCauserie>(_onAddCauserie);
  }  

  Future<void> _onAddCauserie ( CreateCauserie event, Emitter<CauserieState> emit) async {
    emit(CauserieLoading());
    final bool result =   await causerieRepository.addCauserie(event.causerie);
    if(result) {
      emit(CauserieAdded());
    }
    else {
      emit(CauserieError("Erreur lors de l'ajout de la visite"));
    }
   
  }
}


