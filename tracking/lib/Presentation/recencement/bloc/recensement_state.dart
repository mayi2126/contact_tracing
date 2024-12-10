part of 'recensement_bloc.dart';

sealed class RecensementState extends Equatable {
  const RecensementState();
  
  @override
  List<Object> get props => [];
}

final class RecensementInitial extends RecensementState {

}

/* -------------------------------------------------------------------------- */
/*                                INFO GEN REC                                */
/* -------------------------------------------------------------------------- */
final class InfoGenRecLoading extends RecensementState {

}
final class InfoGenRecStored extends RecensementState { 
}
final class InfoGenRecError extends RecensementState {
  final String message;
  const InfoGenRecError(this.message);
  @override
  List<Object> get props => [message];
}

/* -------------------------------------------------------------------------- */
/*                                 Chef menage                                */
/* -------------------------------------------------------------------------- */


/* -------------------------------------------------------------------------- */
/*                                INFO GEN REC                                */
/* -------------------------------------------------------------------------- */
final class ChefMenageLoading extends RecensementState {

}
final class ChefMenageStored extends RecensementState { 
}
final class ChefMenageError extends RecensementState {
  final String message;
  const ChefMenageError(this.message);
  @override
  List<Object> get props => [message];
}

/* -------------------------------------------------------------------------- */
/*                                   MEMBER                                   */
/* -------------------------------------------------------------------------- */


final class MenageMemberLoading extends RecensementState {

}
final class MenageMemberStored extends RecensementState { 
}
final class MenageMemberError extends RecensementState {
  final String message;
  const MenageMemberError(this.message);
  @override
  List<Object> get props => [message];
}

/* -------------------------------------------------------------------------- */
/*                          CONFIRMATION RECENSEMENT                          */
/* -------------------------------------------------------------------------- */


final class ConfirmationRecensementLoading extends RecensementState {

}
final class ConfirmationRecensementStored extends RecensementState { 
}
final class ConfirmationRecensementError extends RecensementState {
  final String message;
  const ConfirmationRecensementError(this.message);
  @override
  List<Object> get props => [message];
}
