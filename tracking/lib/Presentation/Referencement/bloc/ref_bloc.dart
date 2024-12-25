import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tracking/Presentation/Referencement/data/Repository/postReferencement.dart';

part 'ref_event.dart';
part 'ref_state.dart';

class RefBloc extends Bloc<RefEvent, RefState> {
  RefBloc() : super(RefInitial()) {
    on<HandleMakeReferencementEvent>(_onMakeReferencement);
  }

  void _onMakeReferencement(HandleMakeReferencementEvent event, Emitter<RefState> emit) async {

    emit(MakeReferencementLoading());

    try {
       final MakeReferencementRepositoryImpl makeReferencementRepository =
        MakeReferencementRepositoryImpl();
      final bool result = await makeReferencementRepository.makeReferencement(event.id,event.idMotif);

      emit(MakeReferencementSuccess());

    } catch (e) {
      
    }
  
  }
}
