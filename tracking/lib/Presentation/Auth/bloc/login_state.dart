part of 'login_bloc.dart';

sealed class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {
  final String msg = "Connexion en cours...";
  @override
  List<Object> get props => [msg];
}

final class LoginError extends LoginState {
  final String msgError = "Erreur de connexion";
  @override
  List<Object> get props => [msgError];
}

final class LoginLoaded extends LoginState {
  final String token;

  const LoginLoaded(this.token);
}


class Unauthenticated extends LoginState {}