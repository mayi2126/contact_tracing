import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tracking/Presentation/ContreRef/data/Repository/postContreRef.dart';

part 'contre_ref_event.dart';
part 'contre_ref_state.dart';

class ContreRefBloc extends Bloc<ContreRefEvent, ContreRefState> {
  ContreRefBloc() : super(ContreRefInitial()) {
    on<CreateContreRefEvent>(_onHandleCreateContreRef);
  }

  void _onHandleCreateContreRef(
      CreateContreRefEvent event, Emitter<ContreRefState> emit) async {
    emit(CreateContreReferencementLoading());
    MakeContreReferencementRepositoryImpl
        makeContreReferencementRepositoryImpl =
        MakeContreReferencementRepositoryImpl();

    try {
      final bool result =
          await makeContreReferencementRepositoryImpl.makeContreReferencement(
              event.prestataire,
              event.recommendation,
              event.grossesseconfirme,
              event.idRef);
      if (result) {
        emit(CreateContreReferencementSuccess());
      } else {
        emit(CreateContreReferencementError("Une erreur est survenue"));
      }
    } catch (e) {
      emit(CreateContreReferencementError(e.toString()));
    }
  }
}
