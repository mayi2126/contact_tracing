part of 'referencement_bloc.dart';

@immutable
sealed class ReferencementEvent {}

class GetReferencementEvent extends ReferencementEvent {}

class GetReferedRefEvent extends ReferencementEvent {}

class GetContreReferedEvent extends ReferencementEvent {}



