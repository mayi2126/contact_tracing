import 'package:meta/meta.dart';
import 'dart:convert';

class VisiteModel {
  final dynamic id;
  final dynamic idAscAp;
  final dynamic idelementDonnee;
  final dynamic nbrepersonnetoucheeFnq;
  final dynamic nbrepersonnetoucheeFe;
  final dynamic nbrepersonnetoucheeFa;
  final dynamic nbrepersonnetoucheeH;
  final dynamic idFsAp;  // Changed from dynamic to dynamic
  final dynamic createdAt;
  final dynamic updatedAt;
  final dynamic usermodif;
  final dynamic nbreenfantzvtouche;
  final dynamic nbreautrestouche;
  final dynamic idcommune;  // Changed from dynamic to dynamic
  final dynamic idregion;  // Changed from dynamic to dynamic
  final dynamic iddistrict;  // Changed from dynamic to dynamic
  final dynamic idvillage;  // Changed from dynamic to dynamic
  final dynamic idquartier;
  final dynamic dateAp;
  final dynamic lieuAp;
  final dynamic dateEnreg;
  final dynamic dateModif;
  final dynamic userEnreg;
  final dynamic nomquartier;
  final dynamic libelementdedonnee;
  final dynamic nomvillage;
  final dynamic libcpecm;

  // Constructor
  VisiteModel({
    required this.id,
    required this.idAscAp,
    required this.idelementDonnee,
    required this.nbrepersonnetoucheeFnq,
    required this.nbrepersonnetoucheeFe,
    required this.nbrepersonnetoucheeFa,
    required this.nbrepersonnetoucheeH,
    required this.idFsAp,
    required this.createdAt,
    required this.updatedAt,
    required this.usermodif,
    required this.nbreenfantzvtouche,
    required this.nbreautrestouche,
    required this.idcommune,
    required this.idregion,
    required this.iddistrict,
    required this.idvillage,
    required this.idquartier,
    required this.dateAp,
    required this.lieuAp,
    required this.dateEnreg,
    required this.dateModif,
    required this.userEnreg,
    required this.nomquartier,
    required this.libelementdedonnee,
    required this.nomvillage,
    required this.libcpecm,
  });

  // Method to create a new VisiteModel with some updated values
  VisiteModel copyWith({
    dynamic id,
    dynamic idAscAp,
    dynamic idelementDonnee,
    dynamic nbrepersonnetoucheeFnq,
    dynamic nbrepersonnetoucheeFe,
    dynamic nbrepersonnetoucheeFa,
    dynamic nbrepersonnetoucheeH,
    dynamic idFsAp,  // Changed to dynamic
    dynamic createdAt,
    dynamic updatedAt,
    dynamic usermodif,
    dynamic nbreenfantzvtouche,
    dynamic nbreautrestouche,
    dynamic idcommune,  // Changed to dynamic
    dynamic idregion,  // Changed to dynamic
    dynamic iddistrict,  // Changed to dynamic
    dynamic idvillage,  // Changed to dynamic
    dynamic idquartier,
    dynamic dateAp,
    dynamic lieuAp,
    dynamic dateEnreg,
    dynamic dateModif,
    dynamic userEnreg,
    dynamic nomquartier,
    dynamic libelementdedonnee,
    dynamic nomvillage,
    dynamic libcpecm,
  }) {
    return VisiteModel(
      id: id ?? this.id,
      idAscAp: idAscAp ?? this.idAscAp,
      idelementDonnee: idelementDonnee ?? this.idelementDonnee,
      nbrepersonnetoucheeFnq: nbrepersonnetoucheeFnq ?? this.nbrepersonnetoucheeFnq,
      nbrepersonnetoucheeFe: nbrepersonnetoucheeFe ?? this.nbrepersonnetoucheeFe,
      nbrepersonnetoucheeFa: nbrepersonnetoucheeFa ?? this.nbrepersonnetoucheeFa,
      nbrepersonnetoucheeH: nbrepersonnetoucheeH ?? this.nbrepersonnetoucheeH,
      idFsAp: idFsAp ?? this.idFsAp,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      usermodif: usermodif ?? this.usermodif,
      nbreenfantzvtouche: nbreenfantzvtouche ?? this.nbreenfantzvtouche,
      nbreautrestouche: nbreautrestouche ?? this.nbreautrestouche,
      idcommune: idcommune ?? this.idcommune,
      idregion: idregion ?? this.idregion,
      iddistrict: iddistrict ?? this.iddistrict,
      idvillage: idvillage ?? this.idvillage,
      idquartier: idquartier ?? this.idquartier,
      dateAp: dateAp ?? this.dateAp,
      lieuAp: lieuAp ?? this.lieuAp,
      dateEnreg: dateEnreg ?? this.dateEnreg,
      dateModif: dateModif ?? this.dateModif,
      userEnreg: userEnreg ?? this.userEnreg,
      nomquartier: nomquartier ?? this.nomquartier,
      libelementdedonnee: libelementdedonnee ?? this.libelementdedonnee,
      nomvillage: nomvillage ?? this.nomvillage,
      libcpecm: libcpecm ?? this.libcpecm,
    );
  }

  // JSON parsing
  factory VisiteModel.fromJson(dynamic str) => VisiteModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  // Parsing the Map<String, dynamic> dynamico a VisiteModel object
  factory VisiteModel.fromMap(Map<String, dynamic> json) => VisiteModel(
    id: json["id"],
    idAscAp: json["idAscAp"],
    idelementDonnee: json["IdelementDonnee"],
    nbrepersonnetoucheeFnq: json["nbrepersonnetoucheeFnq"],
    nbrepersonnetoucheeFe: json["nbrepersonnetoucheeFE"],
    nbrepersonnetoucheeFa: json["nbrepersonnetoucheeFA"],
    nbrepersonnetoucheeH: json["nbrepersonnetoucheeH"],
    idFsAp: json["idFsAp"],  // Changed to int
    createdAt: json["created_at"],  // String format
    updatedAt: json["updated_at"],  // String format
    usermodif: json["usermodif"],
    nbreenfantzvtouche: json["nbreenfantzvtouche"],
    nbreautrestouche: json["nbreautrestouche"],
    idcommune: json["Idcommune"],  // Changed to int
    idregion: json["Idregion"],  // Changed to int
    iddistrict: json["Iddistrict"],  // Changed to int
    idvillage: json["Idvillage"],  // Changed to int
    idquartier: json["Idquartier"],
    dateAp: json["dateAp"],  // String format
    lieuAp: json["lieuAp"],
    dateEnreg: json["dateEnreg"],  // String format
    dateModif: json["dateModif"],  // String format
    userEnreg: json["userEnreg"],
    nomquartier: json["nomquartier"],
    libelementdedonnee: json["libelementdedonnee"],
    nomvillage: json["nomvillage"],
    libcpecm: json["libcpecm"],
  );

  // Convert the VisiteModel object to a Map<String, dynamic>
  Map<String, dynamic> toMap() => {
    "id": id,
    "idAscAp": idAscAp,
    "IdelementDonnee": idelementDonnee,
    "nbrepersonnetoucheeFnq": nbrepersonnetoucheeFnq,
    "nbrepersonnetoucheeFE": nbrepersonnetoucheeFe,
    "nbrepersonnetoucheeFA": nbrepersonnetoucheeFa,
    "nbrepersonnetoucheeH": nbrepersonnetoucheeH,
    "idFsAp": idFsAp,  // Changed to int
    "created_at": createdAt,  // String format
    "updated_at": updatedAt,  // String format
    "usermodif": usermodif,
    "nbreenfantzvtouche": nbreenfantzvtouche,
    "nbreautrestouche": nbreautrestouche,
    "Idcommune": idcommune,  // Changed to int
    "Idregion": idregion,  // Changed to int
    "Iddistrict": iddistrict,  // Changed to int
    "Idvillage": idvillage,  // Changed to int
    "Idquartier": idquartier,
    "dateAp": dateAp,  // String format
    "lieuAp": lieuAp,
    "dateEnreg": dateEnreg,  // String format
    "dateModif": dateModif,  // String format
    "userEnreg": userEnreg,
    "nomquartier": nomquartier,
    "libelementdedonnee": libelementdedonnee,
    "nomvillage": nomvillage,
    "libcpecm": libcpecm,
  };
}
