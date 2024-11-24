import 'package:meta/meta.dart';
import 'dart:convert';

class Visite {
    int idregion;
    int idFsAp;
    int idquartier;
    int iddistrict;
    int idAscAp;
    int idvillage;
    int idcommune;
    DateTime dateAp;
    String lieuAp;
    int idelementDonnee;
    int nbrepersonnetoucheeFnq;
    int nbrepersonnetoucheeFe;
    int nbrepersonnetoucheeFa;
    int nbrepersonnetoucheeH;
    int nbreenfantzvtouche;
    int nbreautrestouche;
    int userEnreg;

    Visite({
        required this.idregion,
        required this.idFsAp,
        required this.idquartier,
        required this.iddistrict,
        required this.idAscAp,
        required this.idvillage,
        required this.idcommune,
        required this.dateAp,
        required this.lieuAp,
        required this.idelementDonnee,
        required this.nbrepersonnetoucheeFnq,
        required this.nbrepersonnetoucheeFe,
        required this.nbrepersonnetoucheeFa,
        required this.nbrepersonnetoucheeH,
        required this.nbreenfantzvtouche,
        required this.nbreautrestouche,
        required this.userEnreg,
    });

    Visite copyWith({
        int? idregion,
        int? idFsAp,
        int? idquartier,
        int? iddistrict,
        int? idAscAp,
        int? idvillage,
        int? idcommune,
        DateTime? dateAp,
        String? lieuAp,
        int? idelementDonnee,
        int? nbrepersonnetoucheeFnq,
        int? nbrepersonnetoucheeFe,
        int? nbrepersonnetoucheeFa,
        int? nbrepersonnetoucheeH,
        int? nbreenfantzvtouche,
        int? nbreautrestouche,
        int? userEnreg,
    }) => 
        Visite(
            idregion: idregion ?? this.idregion,
            idFsAp: idFsAp ?? this.idFsAp,
            idquartier: idquartier ?? this.idquartier,
            iddistrict: iddistrict ?? this.iddistrict,
            idAscAp: idAscAp ?? this.idAscAp,
            idvillage: idvillage ?? this.idvillage,
            idcommune: idcommune ?? this.idcommune,
            dateAp: dateAp ?? this.dateAp,
            lieuAp: lieuAp ?? this.lieuAp,
            idelementDonnee: idelementDonnee ?? this.idelementDonnee,
            nbrepersonnetoucheeFnq: nbrepersonnetoucheeFnq ?? this.nbrepersonnetoucheeFnq,
            nbrepersonnetoucheeFe: nbrepersonnetoucheeFe ?? this.nbrepersonnetoucheeFe,
            nbrepersonnetoucheeFa: nbrepersonnetoucheeFa ?? this.nbrepersonnetoucheeFa,
            nbrepersonnetoucheeH: nbrepersonnetoucheeH ?? this.nbrepersonnetoucheeH,
            nbreenfantzvtouche: nbreenfantzvtouche ?? this.nbreenfantzvtouche,
            nbreautrestouche: nbreautrestouche ?? this.nbreautrestouche,
            userEnreg: userEnreg ?? this.userEnreg,
        );

    factory Visite.fromJson(String str) => Visite.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Visite.fromMap(Map<String, dynamic> json) => Visite(
        idregion: json["Idregion"],
        idFsAp: json["idFsAp"],
        idquartier: json["Idquartier"],
        iddistrict: json["Iddistrict"],
        idAscAp: json["idAscAp"],
        idvillage: json["Idvillage"],
        idcommune: json["Idcommune"],
        dateAp: DateTime.parse(json["dateAp"]),
        lieuAp: json["lieuAp"],
        idelementDonnee: json["IdelementDonnee"],
        nbrepersonnetoucheeFnq: json["nbrepersonnetoucheeFnq"],
        nbrepersonnetoucheeFe: json["nbrepersonnetoucheeFE"],
        nbrepersonnetoucheeFa: json["nbrepersonnetoucheeFA"],
        nbrepersonnetoucheeH: json["nbrepersonnetoucheeH"],
        nbreenfantzvtouche: json["nbreenfantzvtouche"],
        nbreautrestouche: json["nbreautrestouche"],
        userEnreg: json["userEnreg"],
    );

    Map<String, dynamic> toMap() => {
        "Idregion": idregion,
        "idFsAp": idFsAp,
        "Idquartier": idquartier,
        "Iddistrict": iddistrict,
        "idAscAp": idAscAp,
        "Idvillage": idvillage,
        "Idcommune": idcommune,
        "dateAp": "${dateAp.year.toString().padLeft(4, '0')}-${dateAp.month.toString().padLeft(2, '0')}-${dateAp.day.toString().padLeft(2, '0')}",
        "lieuAp": lieuAp,
        "IdelementDonnee": idelementDonnee,
        "nbrepersonnetoucheeFnq": nbrepersonnetoucheeFnq,
        "nbrepersonnetoucheeFE": nbrepersonnetoucheeFe,
        "nbrepersonnetoucheeFA": nbrepersonnetoucheeFa,
        "nbrepersonnetoucheeH": nbrepersonnetoucheeH,
        "nbreenfantzvtouche": nbreenfantzvtouche,
        "nbreautrestouche": nbreautrestouche,
        "userEnreg": userEnreg,
    };
}
