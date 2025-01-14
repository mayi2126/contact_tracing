class Info {
  final int id;
  final int idQuartier;
  final String dateRecensement;
  final String localisationGpsRec;
  final List<Menage> menages;

  Info({
    required this.id,
    required this.idQuartier,
    required this.dateRecensement,
    required this.localisationGpsRec,
    required this.menages,
  });
}

class Menage {
  final int id;
  final String nomChef;
  final String prenomChef;
  final List<Membre> membres;

  Menage({
    required this.id,
    required this.nomChef,
    required this.prenomChef,
    required this.membres,
  });
}

class Membre {
  final int id;
  final String nom;
  final String prenom;
  final int age;
  final String sexe;
  final String contact;
  final String observation;

  Membre({
    required this.id,
    required this.nom,
    required this.prenom,
    required this.age,
    required this.sexe,
    required this.contact,
    required this.observation,
  });
}
