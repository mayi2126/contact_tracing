part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginDataSending extends LoginEvent {
  final String pwd;
  final String email;

  const LoginDataSending(this.pwd, this.email);
  
}
