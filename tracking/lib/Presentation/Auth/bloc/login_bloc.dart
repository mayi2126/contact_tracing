
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking/Presentation/Auth/data/Repositories/user_login_repo.dart';
import 'package:tracking/app/storage/local_storage.dart';
import 'package:tracking/db/inserts/village_insert.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserLoginRepo authRepository;

  LoginBloc({required this.authRepository}) : super(LoginInitial()) {
    on<LoginDataSending>(_onLogin);
    on<AuthLogout>(_onLogout);
    on<AuthCheckStatus>(_onCheckStatus);
  }

  Future<void> _onLogin(LoginDataSending event, Emitter<LoginState> emit) async {
    emit(LoginLoading());
   
    final token = await authRepository.logUser(event.email, event.pwd);
   
      await insertVillagesFromApi();

    emit(LoginLoaded(token));
    }

  Future<void> _onLogout(AuthLogout event, Emitter<LoginState> emit) async {
    await logout();
    emit(Unauthenticated());
  }

  Future<void> _onCheckStatus(AuthCheckStatus event, Emitter<LoginState> emit) async {
    final token = await getToken();
    if (token != null) {
      emit(LoginLoaded(token));
    } else {
      emit(Unauthenticated());
    }
  }
}

