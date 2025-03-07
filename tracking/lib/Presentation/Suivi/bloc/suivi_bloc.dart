import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tracking/Presentation/Referencement/data/Models/referencement.dart';
import 'package:tracking/Presentation/Suivi/data/Models/patient_suivi.dart';
import 'package:tracking/Presentation/Suivi/data/Repository/getPatients.dart';
import 'package:tracking/Presentation/Suivi/data/Repository/getPatientsSuivi.dart';

part 'suivi_event.dart';
part 'suivi_state.dart';

class SuiviBloc extends Bloc<SuiviEvent, SuiviState> {
  SuiviBloc() : super(SuiviInitial()) {
    on<GetPatientsEvent>(_onHandleGetPatients);
    on<GetPatientSuiviEvent>(_onHandleGetPatientsSuivis);
  }

  void _onHandleGetPatients(GetPatientsEvent event, Emitter<SuiviState> emit) async {
    emit(GetPatientsLoading());
    RetrievePatientsRepositoryImpl repositoryImpl = RetrievePatientsRepositoryImpl();

    try {
       List<Referencement> result = await repositoryImpl.fetchAll();

      //  List<Referencement> result = [];

      //  Referencement s1 = Referencement(id:12,agegrossesse: "20",recommandation: ",jlksdjl",libcpecm: "ckljvl",fullName: "Ahoui",nomquartier: "dklfoo",nomvillage: "koojoj",sexezerovingtquatremoisrec: "20",membreagerec: 20,dateprochainrdv: "2024-05-10",libmotif: "kmlkf",prestatairesoins: "koh",dateref: "2024-06-10",refereVers: "Kpogan",grossesseconfirme: "Oui");
      //  result.add(s1);
      emit(GetPatientsSuccess(result));
    }
    catch (e) {
      emit(GetPatientsError(e.toString()));
    }

    
  }

  void _onHandleGetPatientsSuivis(GetPatientSuiviEvent event, Emitter<SuiviState> emit) async {
    emit(GetPatientsSuiviLoading());
    RetrievePatientsSuivisRepositoryImpl repositoryImpl = RetrievePatientsSuivisRepositoryImpl();

    try {
       List<PatientSuivi> result = await repositoryImpl.fetchAll();

      //  List<Referencement> result = [];

      //  Referencement s1 = Referencement(id:12,agegrossesse: "20",recommandation: ",jlksdjl",libcpecm: "ckljvl",fullName: "Ahoui",nomquartier: "dklfoo",nomvillage: "koojoj",sexezerovingtquatremoisrec: "20",membreagerec: 20,dateprochainrdv: "2024-05-10",libmotif: "kmlkf",prestatairesoins: "koh",dateref: "2024-06-10",refereVers: "Kpogan",grossesseconfirme: "Oui");
      //  result.add(s1);
      emit(GetPatientsSuiviSuccess(result));
    }
    catch (e) {
      print(e.toString());
      emit(GetPatientsSuiviError(e.toString()));
    }

    
  }
}
