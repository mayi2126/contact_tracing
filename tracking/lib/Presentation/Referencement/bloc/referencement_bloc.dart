import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tracking/Presentation/Referencement/data/Models/referencement.dart';
import 'package:tracking/Presentation/Referencement/data/Repository/getAllReferencemeent.dart';
import 'package:tracking/Presentation/Referencement/getReferedRef.dart';

part 'referencement_event.dart';
part 'referencement_state.dart';

class ReferencementBloc extends Bloc<ReferencementEvent, ReferencementState> {
  ReferencementBloc() : super(ReferencementInitial()) {
    on<GetReferencementEvent>(_onGetReferencement);
    on<GetReferedRefEvent>(_onHandleReferedRef);
  }

  void dispose() {
    super.close();
  }

  void _onGetReferencement(
      GetReferencementEvent event, Emitter<ReferencementState> emit) async {
    emit(ReferencementGetLoading());

    final RetrieveReferencementRepositoryImpl referencementRepository =
        RetrieveReferencementRepositoryImpl();

    try {
      final List<Referencement> result =
          await referencementRepository.fetchAll();

      emit(ReferencementGetLoaded(result));
    } catch (e) {
      emit(ReferencementGetError(e.toString()));
    }
  }

  void _onHandleReferedRef(
      GetReferedRefEvent event, Emitter<ReferencementState> emit) async {
    emit(ReferedRefGetLoading());

    final RetrieveReferedRefRepositoryImpl referedRefRepositoryImpl =
        RetrieveReferedRefRepositoryImpl();

    try {
      final List<Referencement> result =
          await referedRefRepositoryImpl.fetchAll();

      emit(ReferedRefGetLoaded(result));
    } catch (e) {
      emit(ReferedRefGetError(e.toString()));
    }
  }

  

  
}
