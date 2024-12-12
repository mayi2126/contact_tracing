import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tracking/Presentation/recencement/data/Models/info_genrec.dart';
import 'package:tracking/Presentation/recencement/data/Models/member.dart';
import 'package:tracking/Presentation/recencement/data/Models/menage.dart';
import 'package:tracking/Presentation/recencement/data/Repository/add_member_menage.dart';
import 'package:tracking/Presentation/recencement/data/Repository/add_menage.dart';
import 'package:tracking/Presentation/recencement/data/Repository/add_recensement.dart';
import 'package:tracking/Presentation/recencement/data/Repository/confirmation.dart';
import 'package:tracking/Presentation/recencement/data/Models/recensement.dart';
import 'package:tracking/Presentation/recencement/data/Repository/retrieve_rec.dart';
import 'package:tracking/components/utils/date_filter.dart';


part 'recensement_event.dart';
part 'recensement_state.dart';

class RecensementBloc extends Bloc<RecensementEvent, RecensementState> {
  RecensementBloc() : super(RecensementInitial()) {
    on<StoreInfoGenRec>(_onStoreInfoGenRec);
    on<AddChefMenage>(_onAddChefMenage);
    on<AddMenageMember>(_onAddMenageMember);
    on<ConfirmationRecensement>(_onConfRec);
    on<HandleGetRecensement>(_onGetRecensement);
  }

  Future<void> _onStoreInfoGenRec(StoreInfoGenRec event, Emitter<RecensementState> emit) async {
    emit((InfoGenRecLoading()));
    try {
      final AddRecensementRepository repository = AddRecensementRepositoryImpl();
      bool result =  await repository.storeInfoGenRec(event.infoGenRec);
      if (result) {
      emit(InfoGenRecStored());
        
      }
      else{

      emit(const InfoGenRecError("Erreur lors de l'ajout d'un recensement"));
      }

    } catch (e) {
      emit(InfoGenRecError(e.toString()));
    }
  }



  /// Handle [AddChefMenage] event. Emits [ChefMenageLoading], [ChefMenageStored] or [ChefMenageError] state.
  ///
  /// [ChefMenageLoading] is emitted when the event is received.
  /// [ChefMenageStored] is emitted when the chef de menage is stored successfully in the database.
  /// [ChefMenageError] is emitted when an error occurs during the storing process.
  /// The error message is provided in the state.
  Future<void> _onAddChefMenage(AddChefMenage event, Emitter<RecensementState> emit) async {
    emit((ChefMenageLoading()));
    try {
      final AddMenageRepository repository = AddMenageRepositoryImpl();
      bool result = await repository.addMenage(event.menage);
      if (result) {
        
      emit(ChefMenageStored());
      }
      else{
      emit(const ChefMenageError("Erreur lors de l'ajout d'un chef de menage"));

      }

    } catch (e) {
      emit(ChefMenageError(e.toString()));
    }
  }

  /// Handle [AddMenageMember] event. Emits [MenageMemberLoading], [MenageMemberStored] or [MenageMemberError] state.
  ///
  /// [MenageMemberLoading] is emitted when the event is received.
  /// [MenageMemberStored] is emitted when the menage member is stored successfully in the database.
  /// [MenageMemberError] is emitted when an error occurs during the storing process.
  /// The error message is provided in the state.
  Future<void> _onAddMenageMember(AddMenageMember event, Emitter<RecensementState> emit) async {
    emit((MenageMemberLoading()));
    try {
      final AddMember repository = AddMemberImpl();
      bool result = await repository.addMemberMenage(event.menage);

      if (result) {
      emit(MenageMemberStored());
      }else{
      emit(const MenageMemberError("Erreur lors de l'ajout d'un membre de menage"));

      }

    } catch (e) {
      emit(MenageMemberError(e.toString()));
    }
  }


   Future<void> _onConfRec(ConfirmationRecensement event, Emitter<RecensementState> emit) async {
    emit((ConfirmationRecensementLoading()));
    try {
      final RecConfRepositoryImpl repository = RecConfRepositoryImpl();
      bool result = await repository.recConf();

      if (result) {
        
      emit(ConfirmationRecensementSuccess());
      }
      else{
      emit(const ConfirmationRecensementError("Erreur lors de la confirmation du recensement"));

      }

    } catch (e) {
      emit(ConfirmationRecensementError(e.toString()));
    }
  }


  Future<void> _onGetRecensement(
      HandleGetRecensement event, Emitter<RecensementState> emit) async {
        
    emit(GetRecensementLoading());

    final RetrieveRecensementRepository retrieveRecensementRepository =
        RetrieveRecensementRepositoryImpl();

    try {
      final List<Recensement> result = await retrieveRecensementRepository
          .fetchRecensementsById(event.dateMin, event.dateMax);
        
     

      if (result.isNotEmpty)
       {
            final List<Recensement> todayVisites = filterRecensementByToday(result);
      
        emit(GetRecensementSuccess(result,todayVisites));
      }
      else {
              print("get 3");

      emit(EmptyRecensement());
      }

    } catch (e) {

    emit(const GetRecensementError("Erreur lors de la récupération des recensements"));

    }

  }


}
