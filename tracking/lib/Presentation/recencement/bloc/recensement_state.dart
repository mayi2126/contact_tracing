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
