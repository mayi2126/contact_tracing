import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_pregnant/Presentation/Auth/data/Repositories/user_login_repo.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserLoginRepo loginRepo ;
  late String data;
  

  LoginBloc(this.loginRepo) : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async {
      if (event is LoginDataSending)  {
        emit(LoginLoading());  
        try {

         

          // await Future.delayed(const Duration(seconds: 10));
        //   SecretInfo _secret = SecretInfo();
          
          data = await loginRepo.logUser(event.pwd, event.email);

          print(data);
        // //  print(data);
        //  _secret.storeToken(data);
        // //  _secret.decodeToken();
        //  _secret.refreshToken();
          emit(LoginLoaded());
         
        } catch (e) {
          emit(LoginError());
        }
      }
    });
  }
}
