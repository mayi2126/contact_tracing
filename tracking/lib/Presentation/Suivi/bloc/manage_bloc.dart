import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tracking/Presentation/Suivi/data/Models/suivi.dart';
import 'package:tracking/Presentation/Suivi/data/Repository/addSuivi.dart';

part 'manage_event.dart';
part 'manage_state.dart';

class ManageBloc extends Bloc<ManageEvent, ManageState> {
  ManageBloc() : super(ManageInitial()) {
    on<AddingSuiviEvent>(_onHandleAddingSuivi);
  }

  void _onHandleAddingSuivi(AddingSuiviEvent event, Emitter<ManageState> emit) async{
    emit(AddingLoading());
    AddSuiviRepositoryImpl addSuiviRepository = AddSuiviRepositoryImpl();
    try {
      bool result = await addSuiviRepository.addSuivi(event.suivi);
      if (result) {
        emit(AddSuiviSuccessed());
      }
      else {
        emit(AddingError("Erreur lors de l'ajout du suivi"));
      }
    } catch (e) {
              emit(AddingError("Erreur lors de l'ajout du suivi"));

    }
  }
}
