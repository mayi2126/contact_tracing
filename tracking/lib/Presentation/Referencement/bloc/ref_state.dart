part of 'ref_bloc.dart';

@immutable
sealed class RefState {}

final class RefInitial extends RefState {}

final class MakeReferencementLoading extends RefState {

}

final class MakeReferencementSuccess extends RefState {
}

final class MakeReferencementError extends RefState {
  final String message;
  MakeReferencementError(this.message);
  
}



