import 'package:meta/meta.dart';
import 'dart:convert';

class Member {
    DateTime membredatenaissrec;
    String membrenomrec;
    String membreprenomrec;
    int membreagerec;
    int agemois;
    String sexezerovingtquatremoisrec;
    String contactrec;
    int idprofessionref;
    String observationrec;
    int userEnreg;

    Member({
        required this.membredatenaissrec,
        required this.membrenomrec,
        required this.membreprenomrec,
        required this.membreagerec,
        required this.agemois,
        required this.sexezerovingtquatremoisrec,
        required this.contactrec,
        required this.idprofessionref,
        required this.observationrec,
        required this.userEnreg,
    });

    Member copyWith({
        DateTime? membredatenaissrec,
        String? membrenomrec,
        String? membreprenomrec,
        int? membreagerec,
        int? agemois,
        String? sexezerovingtquatremoisrec,
        String? contactrec,
        int? idprofessionref,
        String? observationrec,
        int? userEnreg,
    }) => 
        Member(
            membredatenaissrec: membredatenaissrec ?? this.membredatenaissrec,
            membrenomrec: membrenomrec ?? this.membrenomrec,
            membreprenomrec: membreprenomrec ?? this.membreprenomrec,
            membreagerec: membreagerec ?? this.membreagerec,
            agemois: agemois ?? this.agemois,
            sexezerovingtquatremoisrec: sexezerovingtquatremoisrec ?? this.sexezerovingtquatremoisrec,
            contactrec: contactrec ?? this.contactrec,
            idprofessionref: idprofessionref ?? this.idprofessionref,
            observationrec: observationrec ?? this.observationrec,
            userEnreg: userEnreg ?? this.userEnreg,
        );

    factory Member.fromJson(String str) => Member.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Member.fromMap(Map<String, dynamic> json) => Member(
        membredatenaissrec: DateTime.parse(json["membredatenaissrec"]),
        membrenomrec: json["membrenomrec"],
        membreprenomrec: json["membreprenomrec"],
        membreagerec: json["membreagerec"],
        agemois: json["agemois"],
        sexezerovingtquatremoisrec: json["sexezerovingtquatremoisrec"],
        contactrec: json["contactrec"],
        idprofessionref: json["idprofessionref"],
        observationrec: json["observationrec"],
        userEnreg: json["userEnreg"],
    );

    Map<String, dynamic> toMap() => {
        "membredatenaissrec": "${membredatenaissrec.year.toString().padLeft(4, '0')}-${membredatenaissrec.month.toString().padLeft(2, '0')}-${membredatenaissrec.day.toString().padLeft(2, '0')}",
        "membrenomrec": membrenomrec,
        "membreprenomrec": membreprenomrec,
        "membreagerec": membreagerec,
        "agemois": agemois,
        "sexezerovingtquatremoisrec": sexezerovingtquatremoisrec,
        "contactrec": contactrec,
        "idprofessionref": idprofessionref,
        "observationrec": observationrec,
        "userEnreg": userEnreg,
    };
}
