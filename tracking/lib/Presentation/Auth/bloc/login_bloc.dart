import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_pregnant/Presentation/Auth/data/Repositories/user_login_repo.dart';
import 'package:tracking_pregnant/app/storage/local_storage.dart';

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
   
    if (token != null) {

      
      emit(LoginLoaded(token));
    } else {
      emit(Unauthenticated());
    }
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

