import 'dart:convert';

class Recensement {
    String sexezerovingtquatremoisrec;
    String contactrec;
    String observationrec;
    int id;
    String codemenageRec;
    String nomchefmenagerec;
    String prenomchefmenagerec;
    String membrenomrec;
    String membreprenomrec;
    String membredatenaissrec;
    int membreagerec;
    String localisationgpsrec;
    String daterecensement;
    String nomquartier;
    String nomvillage;
    String libcpecm;
    String libprofession;
    String codemembreFamille;
    String nomCommune;
    String libDistrict;
    String libRegion;
    int agemois;
    String dateEnreg;

    Recensement({
        required this.sexezerovingtquatremoisrec,
        required this.contactrec,
        required this.observationrec,
        required this.id,
        required this.codemenageRec,
        required this.nomchefmenagerec,
        required this.prenomchefmenagerec,
        required this.membrenomrec,
        required this.membreprenomrec,
        required this.membredatenaissrec,
        required this.membreagerec,
        required this.localisationgpsrec,
        required this.daterecensement,
        required this.nomquartier,
        required this.nomvillage,
        required this.libcpecm,
        required this.libprofession,
        required this.codemembreFamille,
        required this.nomCommune,
        required this.libDistrict,
        required this.libRegion,
        required this.agemois,
        required this.dateEnreg,
    });

    Recensement copyWith({
        String? sexezerovingtquatremoisrec,
        String? contactrec,
        String? observationrec,
        int? id,
        String? codemenageRec,
        String? nomchefmenagerec,
        String? prenomchefmenagerec,
        String? membrenomrec,
        String? membreprenomrec,
        String? membredatenaissrec,
        int? membreagerec,
        String? localisationgpsrec,
        String? daterecensement,
        String? nomquartier,
        String? nomvillage,
        String? libcpecm,
        String? libprofession,
        String? codemembreFamille,
        String? nomCommune,
        String? libDistrict,
        String? libRegion,
        int? agemois,
        String? dateEnreg,
    }) => 
        Recensement(
            sexezerovingtquatremoisrec: sexezerovingtquatremoisrec ?? this.sexezerovingtquatremoisrec,
            contactrec: contactrec ?? this.contactrec,
            observationrec: observationrec ?? this.observationrec,
            id: id ?? this.id,
            codemenageRec: codemenageRec ?? this.codemenageRec,
            nomchefmenagerec: nomchefmenagerec ?? this.nomchefmenagerec,
            prenomchefmenagerec: prenomchefmenagerec ?? this.prenomchefmenagerec,
            membrenomrec: membrenomrec ?? this.membrenomrec,
            membreprenomrec: membreprenomrec ?? this.membreprenomrec,
            membredatenaissrec: membredatenaissrec ?? this.membredatenaissrec,
            membreagerec: membreagerec ?? this.membreagerec,
            localisationgpsrec: localisationgpsrec ?? this.localisationgpsrec,
            daterecensement: daterecensement ?? this.daterecensement,
            nomquartier: nomquartier ?? this.nomquartier,
            nomvillage: nomvillage ?? this.nomvillage,
            libcpecm: libcpecm ?? this.libcpecm,
            libprofession: libprofession ?? this.libprofession,
            codemembreFamille: codemembreFamille ?? this.codemembreFamille,
            nomCommune: nomCommune ?? this.nomCommune,
            libDistrict: libDistrict ?? this.libDistrict,
            libRegion: libRegion ?? this.libRegion,
            agemois: agemois ?? this.agemois,
            dateEnreg: dateEnreg ?? this.dateEnreg,
        );

    factory Recensement.fromJson(String str) => Recensement.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Recensement.fromMap(Map<String, dynamic> json) => Recensement(
        sexezerovingtquatremoisrec: json["sexezerovingtquatremoisrec"],
        contactrec: json["contactrec"],
        observationrec: json["observationrec"],
        id: json["id"],
        codemenageRec: json["codemenageRec"],
        nomchefmenagerec: json["nomchefmenagerec"],
        prenomchefmenagerec: json["prenomchefmenagerec"],
        membrenomrec: json["membrenomrec"],
        membreprenomrec: json["membreprenomrec"],
        membredatenaissrec: json["membredatenaissrec"],
        membreagerec: json["membreagerec"],
        localisationgpsrec: json["localisationgpsrec"],
        daterecensement: json["daterecensement"],
        nomquartier: json["nomquartier"],
        nomvillage: json["nomvillage"],
        libcpecm: json["libcpecm"],
        libprofession: json["libprofession"],
        codemembreFamille: json["codemembreFamille"],
        nomCommune: json["nomCommune"],
        libDistrict: json["libDistrict"],
        libRegion: json["libRegion"],
        agemois: json["agemois"],
        dateEnreg: json["dateEnreg"],
    );

    Map<String, dynamic> toMap() => {
        "sexezerovingtquatremoisrec": sexezerovingtquatremoisrec,
        "contactrec": contactrec,
        "observationrec": observationrec,
        "id": id,
        "codemenageRec": codemenageRec,
        "nomchefmenagerec": nomchefmenagerec,
        "prenomchefmenagerec": prenomchefmenagerec,
        "membrenomrec": membrenomrec,
        "membreprenomrec": membreprenomrec,
        "membredatenaissrec": membredatenaissrec,
        "membreagerec": membreagerec,
        "localisationgpsrec": localisationgpsrec,
        "daterecensement": daterecensement,
        "nomquartier": nomquartier,
        "nomvillage": nomvillage,
        "libcpecm": libcpecm,
        "libprofession": libprofession,
        "codemembreFamille": codemembreFamille,
        "nomCommune": nomCommune,
        "libDistrict": libDistrict,
        "libRegion": libRegion,
        "agemois": agemois,
        "dateEnreg": dateEnreg,
    };
}
