
String generateMenageCode({
  required String libcpecm,
  required String nomVillage,
  required String nomQuartier,
  required String annee,
  required int recensementAddChefMenages,
}) {
  // Utilisation de padLeft pour garantir que le numéro soit formaté avec des zéros à gauche
  String recensementCode = recensementAddChefMenages.toString().padLeft(3, '0');

  return 'MNG-C-${libcpecm.replaceAll(' ', '').substring(0, 5).toUpperCase()}${nomVillage.substring(0, 3).toUpperCase()}${nomQuartier.substring(0, 3).toUpperCase()}$annee-000$recensementCode';
}
