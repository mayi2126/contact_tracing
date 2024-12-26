
import 'dart:convert';

class Referencement {
    String? fullName;
    String? nomquartier;
    String? nomvillage;
    String? libcpecm;
    String? sexezerovingtquatremoisrec;
    int? membreagerec;
    String? recommandation;
    String? agegrossesse;
    String? dateref;

    Referencement({
        required this.fullName,
        required this.nomquartier,
        required this.nomvillage,
        required this.libcpecm,
        required this.sexezerovingtquatremoisrec,
        required this.membreagerec,
        required this.recommandation,
        required this.agegrossesse,
        required this.dateref,
    });

    Referencement copyWith({
        String? fullName,
        String? nomquartier,
        String? nomvillage,
        String? libcpecm,
        String? sexezerovingtquatremoisrec,
        int? membreagerec,
        String? recommandation,
        String? agegrossesse,
        String? dateref,
    }) => 
        Referencement(
          dateref: dateref ?? this.dateref,
          agegrossesse: agegrossesse ?? this.agegrossesse,
          recommandation: recommandation ?? this.recommandation,
            fullName: fullName ?? this.fullName,
            nomquartier: nomquartier ?? this.nomquartier,
            nomvillage: nomvillage ?? this.nomvillage,
            libcpecm: libcpecm ?? this.libcpecm,
            sexezerovingtquatremoisrec: sexezerovingtquatremoisrec ?? this.sexezerovingtquatremoisrec,
            membreagerec: membreagerec ?? this.membreagerec,
        );

    factory Referencement.fromJson(String str) => Referencement.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Referencement.fromMap(Map<String, dynamic> json) => Referencement(
      dateref: json["dateref"],
      agegrossesse: json["agegrossesse"],
      recommandation: json["recommandation"],
        fullName: json["full_name"],
        nomquartier: json["nomquartier"],
        nomvillage: json["nomvillage"],
        libcpecm: json["libcpecm"],
        sexezerovingtquatremoisrec: json["sexezerovingtquatremoisrec"],
        membreagerec: json["membreagerec"],
    );

    Map<String, dynamic> toMap() => {
      "dateref": dateref,
      "agegrossesse":agegrossesse,
        "full_name": fullName,
        "nomquartier": nomquartier,
        "nomvillage": nomvillage,
        "libcpecm": libcpecm,
        "sexezerovingtquatremoisrec": sexezerovingtquatremoisrec,
        "membreagerec": membreagerec,
        "recommandation": recommandation
    };
}
