import 'dart:convert';

class Visite {

    int idFsAp;
    int idquartier;
    int idAscAp;
    int idvillage;
    String dateAp;
    String lieuAp;
    int idelementDonnee;
    int nbrepersonnetoucheeFnq;
    int nbrepersonnetoucheeFe;
    int nbrepersonnetoucheeFa;
    int nbrepersonnetoucheeH;
    int nbreenfantzvtouche;
    String nbreautrestouche;
    int userEnreg;

    Visite({
        required this.idFsAp,
        required this.idquartier,
        required this.idAscAp,
        required this.idvillage,
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
        int? idFsAp,
        int? idquartier,
        int? idAscAp,
        int? idvillage,
        String? dateAp,
        String? lieuAp,
        int? idelementDonnee,
        int? nbrepersonnetoucheeFnq,
        int? nbrepersonnetoucheeFe,
        int? nbrepersonnetoucheeFa,
        int? nbrepersonnetoucheeH,
        int? nbreenfantzvtouche,
        String? nbreautrestouche,
        int? userEnreg,
    }) => 
        Visite(
            idFsAp: idFsAp ?? this.idFsAp,
            idquartier: idquartier ?? this.idquartier,
            idAscAp: idAscAp ?? this.idAscAp,
            idvillage: idvillage ?? this.idvillage,
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
        idFsAp: json["idFsAp"],
        idquartier: json["Idquartier"],
        idAscAp: json["idAscAp"],
        idvillage: json["Idvillage"],
        dateAp: json["dateAp"],
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
        "idFsAp": idFsAp,
        "Idquartier": idquartier,
        "idAscAp": idAscAp,
        "Idvillage": idvillage,
        "dateAp": dateAp,
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
