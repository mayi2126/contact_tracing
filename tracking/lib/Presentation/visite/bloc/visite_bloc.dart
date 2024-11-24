import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:tracking_pregnant/Presentation/visite/data/Models/visite.dart';
import 'package:tracking_pregnant/Presentation/visite/data/Repository/visite_repo.dart';

part 'visite_event.dart';
part 'visite_state.dart';

class VisiteBloc extends Bloc<VisiteEvent, VisiteState> {
 
  final  VisiteRepositoryImpl visiteRepository ;

  VisiteBloc({required this.visiteRepository}) : super(VisiteInitial()) {
    on<AddVisiteDomicile>(_onAddVisiteDomicile);
  }

  Future<void> _onAddVisiteDomicile ( AddVisiteDomicile event, Emitter<VisiteState> emit) async {
    emit(VisiteLoading());
   await Future.delayed(const Duration(seconds: 3));
    // await visiteRepository.addVisiteDomicile(event.visite);
    emit(VisiteAdded());
  }
}
