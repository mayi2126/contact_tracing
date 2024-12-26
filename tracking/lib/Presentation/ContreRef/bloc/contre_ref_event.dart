part of 'contre_ref_bloc.dart';

@immutable
sealed class ContreRefEvent {}

class CreateContreRefEvent extends ContreRefEvent {
  final String prestataire;
  final String recommendation;
  final String grossesseconfirme;
  final int idRef;

  CreateContreRefEvent({
    required this.prestataire,
    required this.recommendation,
    required this.grossesseconfirme,
    required this.idRef,
  });

}
