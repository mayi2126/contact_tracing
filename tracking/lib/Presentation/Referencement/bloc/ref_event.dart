part of 'ref_bloc.dart';

@immutable
sealed class RefEvent {}


class HandleMakeReferencementEvent extends RefEvent {
  final int id;
  final String idMotif;
  HandleMakeReferencementEvent({required this.id, required this.idMotif});
}