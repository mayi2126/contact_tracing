import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'manage_event.dart';
part 'manage_state.dart';

class ManageBloc extends Bloc<ManageEvent, ManageState> {
  ManageBloc() : super(ManageInitial()) {
    on<ManageEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
