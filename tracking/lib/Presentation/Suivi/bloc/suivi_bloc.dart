import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tracking/Presentation/Referencement/data/Models/referencement.dart';
import 'package:tracking/Presentation/Suivi/data/Repository/getPatients.dart';

part 'suivi_event.dart';
part 'suivi_state.dart';

class SuiviBloc extends Bloc<SuiviEvent, SuiviState> {
  SuiviBloc() : super(SuiviInitial()) {
    on<GetPatientsEvent>(_onHandleGetPatients);
  }

  void _onHandleGetPatients(GetPatientsEvent event, Emitter<SuiviState> emit) async {
    emit(GetPatientsLoading());
    RetrievePatientsRepositoryImpl repositoryImpl = RetrievePatientsRepositoryImpl();

    try {
       List<Referencement> result = await repositoryImpl.fetchAll();
      emit(GetPatientsSuccess(result));
    }
    catch (e) {
      emit(GetPatientsError(e.toString()));
    }

    
  }
}
