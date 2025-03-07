import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tracking/Presentation/ContreRef/data/Repository/getContreRef.dart';
import 'package:tracking/Presentation/ContreRef/data/Repository/getFemSucepEnceintes.dart';
import 'package:tracking/Presentation/Referencement/data/Models/referencement.dart';

part 'list_event.dart';
part 'list_state.dart';

class ListBloc extends Bloc<ListEvent, ListState> {
  ListBloc() : super(ListInitial()) {
    on<GetContreReferedEvent>(_onGetContreReferencement);
    on<GetContreReferedEventByDate>(_onGetContreReferencementByDate);

  }

  void dispose() {
    super.close();
  }

  void _onGetContreReferencement(
      GetContreReferedEvent event, Emitter<ListState> emit) async {
    emit(CounterReferencementLoading());

    final RetrieveContreReferedRepositoryImpl referencementRepository =
        RetrieveContreReferedRepositoryImpl();

    try {
      final List<Referencement> result =
          await referencementRepository.fetchAll();

      emit(CounterReferencementLoaded(result));
    } catch (e) {
      emit(CounterReferencementError(e.toString()));
    }
  }

  void _onGetContreReferencementByDate( GetContreReferedEventByDate event, Emitter<ListState> emit) async {

    final RetrieveContreRefRepositoryImpl referencementRepository =
        RetrieveContreRefRepositoryImpl();

        emit(ContreReferencementLoading());

    try {
      final List<Referencement> result =
          await referencementRepository.fetchAll();

      emit(ContreReferencementLoaded(result));
    } catch (e) {
      print(e.toString());
      emit(ContreReferencementError(e.toString()));
    }

  }

  

  
}
