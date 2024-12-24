part of 'contre_ref_bloc.dart';

@immutable
sealed class ContreRefState {}

final class ContreRefInitial extends ContreRefState {}

/* -------------------------------------------------------------------------- */
/*                          Contre referencementState                         */
/* -------------------------------------------------------------------------- */

final  class CreateContreReferencementLoading extends ContreRefState {}


final class CreateContreReferencementSuccess extends ContreRefState {}


final class CreateContreReferencementError extends ContreRefState {
  final String errorMessage;
  CreateContreReferencementError(this.errorMessage);
}