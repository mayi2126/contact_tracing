import 'dart:convert';

class OffLineRecensement {
    int id;
    String membreprenomrec;
    String membrenomrec;
    int membreagerec;
    int agemois;
    String? libprofession;

    OffLineRecensement({
        required this.id,
        required this.membreprenomrec,
        required this.membrenomrec,
        required this.membreagerec,
        required this.agemois,
         this.libprofession = "CUSINIER",
    });

    OffLineRecensement copyWith({
        int? id,
        String? membreprenomrec,
        String? membrenomrec,
        int? membreagerec,
        int? agemois,
        String? libprofession,
    }) => 
        OffLineRecensement(
            id: id ?? this.id,
            membreprenomrec: membreprenomrec ?? this.membreprenomrec,
            membrenomrec: membrenomrec ?? this.membrenomrec,
            membreagerec: membreagerec ?? this.membreagerec,
            agemois: agemois ?? this.agemois,
            libprofession: libprofession ?? this.libprofession,
        );

    factory OffLineRecensement.fromJson(String str) => OffLineRecensement.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory OffLineRecensement.fromMap(Map<String, dynamic> json) => OffLineRecensement(
        id: json["id"],
        membreprenomrec: json["membreprenomrec"],
        membrenomrec: json["membrenomrec"],
        membreagerec: json["membreagerec"],
        agemois: json["agemois"],
        libprofession: json["libprofession"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "membreprenomrec": membreprenomrec,
        "membrenomrec": membrenomrec,
        "membreagerec": membreagerec,
        "agemois": agemois,
        "libprofession": libprofession,
    };
}
