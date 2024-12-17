
import 'dart:convert';

class Referencement {
    String fullName;
    String nomquartier;
    String nomvillage;
    String libcpecm;
    String sexezerovingtquatremoisrec;
    int membreagerec;

    Referencement({
        required this.fullName,
        required this.nomquartier,
        required this.nomvillage,
        required this.libcpecm,
        required this.sexezerovingtquatremoisrec,
        required this.membreagerec,
    });

    Referencement copyWith({
        String? fullName,
        String? nomquartier,
        String? nomvillage,
        String? libcpecm,
        String? sexezerovingtquatremoisrec,
        int? membreagerec,
    }) => 
        Referencement(
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
        fullName: json["full_name"],
        nomquartier: json["nomquartier"],
        nomvillage: json["nomvillage"],
        libcpecm: json["libcpecm"],
        sexezerovingtquatremoisrec: json["sexezerovingtquatremoisrec"],
        membreagerec: json["membreagerec"],
    );

    Map<String, dynamic> toMap() => {
        "full_name": fullName,
        "nomquartier": nomquartier,
        "nomvillage": nomvillage,
        "libcpecm": libcpecm,
        "sexezerovingtquatremoisrec": sexezerovingtquatremoisrec,
        "membreagerec": membreagerec,
    };
}
