import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tracking/Presentation/Referencement/data/Models/referencement.dart';
import 'package:tracking/Presentation/Referencement/data/Repository/getAllReferencemeent.dart';

part 'referencement_event.dart';
part 'referencement_state.dart';

class ReferencementBloc extends Bloc<ReferencementEvent, ReferencementState> {
  ReferencementBloc() : super(ReferencementInitial()) {
    on<GetReferencementEvent>(_onGetReferencement);
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
}
