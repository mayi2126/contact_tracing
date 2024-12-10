import 'package:meta/meta.dart';
import 'dart:convert';

class Menage {
    String nomchefmenagerec;
    String prenomchefmenagerec;
    int userEnreg;

    Menage({
        required this.nomchefmenagerec,
        required this.prenomchefmenagerec,
        required this.userEnreg,
    });

    Menage copyWith({
        String? nomchefmenagerec,
        String? prenomchefmenagerec,
        int? userEnreg,
    }) => 
        Menage(
            nomchefmenagerec: nomchefmenagerec ?? this.nomchefmenagerec,
            prenomchefmenagerec: prenomchefmenagerec ?? this.prenomchefmenagerec,
            userEnreg: userEnreg ?? this.userEnreg,
        );

    factory Menage.fromJson(String str) => Menage.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Menage.fromMap(Map<String, dynamic> json) => Menage(
        nomchefmenagerec: json["nomchefmenagerec"],
        prenomchefmenagerec: json["prenomchefmenagerec"],
        userEnreg: json["userEnreg"],
    );

    Map<String, dynamic> toMap() => {
        "nomchefmenagerec": nomchefmenagerec,
        "prenomchefmenagerec": prenomchefmenagerec,
        "userEnreg": userEnreg,
    };
}
