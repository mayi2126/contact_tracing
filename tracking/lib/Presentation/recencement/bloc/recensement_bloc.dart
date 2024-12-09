import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tracking/Presentation/recencement/data/Models/info_genrec.dart';
import 'package:tracking/Presentation/recencement/data/Repository/add_recensement.dart';

part 'recensement_event.dart';
part 'recensement_state.dart';

class RecensementBloc extends Bloc<RecensementEvent, RecensementState> {
  RecensementBloc() : super(RecensementInitial()) {
    on<StoreInfoGenRec>(_onStoreInfoGenRec);
  }

  Future<void> _onStoreInfoGenRec(StoreInfoGenRec event, Emitter<RecensementState> emit) async {
    emit((InfoGenRecLoading()));
    try {
      final AddRecensementRepository repository = AddRecensementRepositoryImpl();
      await repository.storeInfoGenRec(event.infoGenRec);
      emit(InfoGenRecStored());
    } catch (e) {
      emit(InfoGenRecError(e.toString()));
    }
  }
}
