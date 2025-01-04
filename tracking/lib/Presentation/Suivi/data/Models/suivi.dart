import 'package:meta/meta.dart';
import 'dart:convert';

class Suivi {
    String rdvrespecte;
    String cpnavantdouzsa;
    String dispomedicament;
    String palumiidisponible;
    String paludormirsousmii;
    String palutpiun;
    String palutpideux;
    String palutpitrois;
    String palutpiquatre;
    String statuvaccorrect;
    String analysemedrealise;
    String recherchesignedanger;
    String grossesseconfirme;
    String agegrossesse;
    String issusaccouchement;
    String lieuaccouchementfs;
    String sirdvrespectenon;

    Suivi({
        required this.rdvrespecte,
        required this.cpnavantdouzsa,
        required this.dispomedicament,
        required this.palumiidisponible,
        required this.paludormirsousmii,
        required this.palutpiun,
        required this.palutpideux,
        required this.palutpitrois,
        required this.palutpiquatre,
        required this.statuvaccorrect,
        required this.analysemedrealise,
        required this.recherchesignedanger,
        required this.grossesseconfirme,
        required this.agegrossesse,
        required this.issusaccouchement,
        required this.lieuaccouchementfs,
        required this.sirdvrespectenon,
    });

    Suivi copyWith({
        String? rdvrespecte,
        String? cpnavantdouzsa,
        String? dispomedicament,
        String? palumiidisponible,
        String? paludormirsousmii,
        String? palutpiun,
        String? palutpideux,
        String? palutpitrois,
        String? palutpiquatre,
        String? statuvaccorrect,
        String? analysemedrealise,
        String? recherchesignedanger,
        String? grossesseconfirme,
        String? agegrossesse,
        String? issusaccouchement,
        String? lieuaccouchementfs,
        String? sirdvrespectenon,
    }) => 
        Suivi(
            rdvrespecte: rdvrespecte ?? this.rdvrespecte,
            cpnavantdouzsa: cpnavantdouzsa ?? this.cpnavantdouzsa,
            dispomedicament: dispomedicament ?? this.dispomedicament,
            palumiidisponible: palumiidisponible ?? this.palumiidisponible,
            paludormirsousmii: paludormirsousmii ?? this.paludormirsousmii,
            palutpiun: palutpiun ?? this.palutpiun,
            palutpideux: palutpideux ?? this.palutpideux,
            palutpitrois: palutpitrois ?? this.palutpitrois,
            palutpiquatre: palutpiquatre ?? this.palutpiquatre,
            statuvaccorrect: statuvaccorrect ?? this.statuvaccorrect,
            analysemedrealise: analysemedrealise ?? this.analysemedrealise,
            recherchesignedanger: recherchesignedanger ?? this.recherchesignedanger,
            grossesseconfirme: grossesseconfirme ?? this.grossesseconfirme,
            agegrossesse: agegrossesse ?? this.agegrossesse,
            issusaccouchement: issusaccouchement ?? this.issusaccouchement,
            lieuaccouchementfs: lieuaccouchementfs ?? this.lieuaccouchementfs,
            sirdvrespectenon: sirdvrespectenon ?? this.sirdvrespectenon,
        );

    factory Suivi.fromJson(String str) => Suivi.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Suivi.fromMap(Map<String, dynamic> json) => Suivi(
        rdvrespecte: json["rdvrespecte"],
        cpnavantdouzsa: json["cpnavantdouzsa"],
        dispomedicament: json["dispomedicament"],
        palumiidisponible: json["palumiidisponible"],
        paludormirsousmii: json["paludormirsousmii"],
        palutpiun: json["palutpiun"],
        palutpideux: json["palutpideux"],
        palutpitrois: json["palutpitrois"],
        palutpiquatre: json["palutpiquatre"],
        statuvaccorrect: json["statuvaccorrect"],
        analysemedrealise: json["analysemedrealise"],
        recherchesignedanger: json["recherchesignedanger"],
        grossesseconfirme: json["grossesseconfirme"],
        agegrossesse: json["agegrossesse"],
        issusaccouchement: json["issusaccouchement"],
        lieuaccouchementfs: json["lieuaccouchementfs"],
        sirdvrespectenon: json["sirdvrespectenon"],
    );

    Map<String, dynamic> toMap() => {
        "rdvrespecte": rdvrespecte,
        "cpnavantdouzsa": cpnavantdouzsa,
        "dispomedicament": dispomedicament,
        "palumiidisponible": palumiidisponible,
        "paludormirsousmii": paludormirsousmii,
        "palutpiun": palutpiun,
        "palutpideux": palutpideux,
        "palutpitrois": palutpitrois,
        "palutpiquatre": palutpiquatre,
        "statuvaccorrect": statuvaccorrect,
        "analysemedrealise": analysemedrealise,
        "recherchesignedanger": recherchesignedanger,
        "grossesseconfirme": grossesseconfirme,
        "agegrossesse": agegrossesse,
        "issusaccouchement": issusaccouchement,
        "lieuaccouchementfs": lieuaccouchementfs,
        "sirdvrespectenon": sirdvrespectenon,
    };
}
