part of 'ref_bloc.dart';

@immutable
sealed class RefEvent {}


class HandleMakeReferencementEvent extends RefEvent {
  final int id;
  HandleMakeReferencementEvent({required this.id});
}