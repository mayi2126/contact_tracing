import 'dart:convert';

class PatientSuivi {
    dynamic statutref;
    dynamic rdvrespecte;
    dynamic sirdvrespectenon;
    dynamic recommandation;
    dynamic cpnavantdouzsa;
    dynamic grossesseconfirme;
    dynamic agegrossesse;
    dynamic sicpnavantdouzsaoui;
    dynamic dispomedicament;
    dynamic sibonnepriseoui;
    dynamic sidispomedicamentoui;
    dynamic sibonneprisenon;
    dynamic palumiidisponible;
    dynamic paludormirsousmii;
    dynamic palutpiun;
    dynamic palutpideux;
    dynamic palutpitrois;
    dynamic palutpiquatre;
    dynamic statuvaccorrect;
    dynamic analysemedrealise;
    dynamic recherchesignedanger;
    dynamic issusaccouchement;
    dynamic lieuaccouchementfs;
    dynamic sidispomedicamentnon;
    dynamic fullName;
    dynamic nomquartier;
    dynamic nomvillage;
    dynamic libcpecm;

    PatientSuivi({
        required this.statutref,
        required this.rdvrespecte,
        required this.sirdvrespectenon,
        required this.recommandation,
        required this.cpnavantdouzsa,
        required this.grossesseconfirme,
        required this.agegrossesse,
        required this.sicpnavantdouzsaoui,
        required this.dispomedicament,
        required this.sibonnepriseoui,
        required this.sidispomedicamentoui,
        required this.sibonneprisenon,
        required this.palumiidisponible,
        required this.paludormirsousmii,
        required this.palutpiun,
        required this.palutpideux,
        required this.palutpitrois,
        required this.palutpiquatre,
        required this.statuvaccorrect,
        required this.analysemedrealise,
        required this.recherchesignedanger,
        required this.issusaccouchement,
        required this.lieuaccouchementfs,
        required this.sidispomedicamentnon,
        required this.fullName,
        required this.nomquartier,
        required this.nomvillage,
        required this.libcpecm,
    });

    PatientSuivi copyWith({
        dynamic statutref,
        dynamic rdvrespecte,
        dynamic sirdvrespectenon,
        dynamic recommandation,
        dynamic cpnavantdouzsa,
        dynamic grossesseconfirme,
        dynamic agegrossesse,
        dynamic sicpnavantdouzsaoui,
        dynamic dispomedicament,
        dynamic sibonnepriseoui,
        dynamic sidispomedicamentoui,
        dynamic sibonneprisenon,
        dynamic palumiidisponible,
        dynamic paludormirsousmii,
        dynamic palutpiun,
        dynamic palutpideux,
        dynamic palutpitrois,
        dynamic palutpiquatre,
        dynamic statuvaccorrect,
        dynamic analysemedrealise,
        dynamic recherchesignedanger,
        dynamic issusaccouchement,
        dynamic lieuaccouchementfs,
        dynamic sidispomedicamentnon,
        dynamic fullName,
        dynamic nomquartier,
        dynamic nomvillage,
        dynamic libcpecm,
    }) => 
        PatientSuivi(
            statutref: statutref ?? this.statutref,
            rdvrespecte: rdvrespecte ?? this.rdvrespecte,
            sirdvrespectenon: sirdvrespectenon ?? this.sirdvrespectenon,
            recommandation: recommandation ?? this.recommandation,
            cpnavantdouzsa: cpnavantdouzsa ?? this.cpnavantdouzsa,
            grossesseconfirme: grossesseconfirme ?? this.grossesseconfirme,
            agegrossesse: agegrossesse ?? this.agegrossesse,
            sicpnavantdouzsaoui: sicpnavantdouzsaoui ?? this.sicpnavantdouzsaoui,
            dispomedicament: dispomedicament ?? this.dispomedicament,
            sibonnepriseoui: sibonnepriseoui ?? this.sibonnepriseoui,
            sidispomedicamentoui: sidispomedicamentoui ?? this.sidispomedicamentoui,
            sibonneprisenon: sibonneprisenon ?? this.sibonneprisenon,
            palumiidisponible: palumiidisponible ?? this.palumiidisponible,
            paludormirsousmii: paludormirsousmii ?? this.paludormirsousmii,
            palutpiun: palutpiun ?? this.palutpiun,
            palutpideux: palutpideux ?? this.palutpideux,
            palutpitrois: palutpitrois ?? this.palutpitrois,
            palutpiquatre: palutpiquatre ?? this.palutpiquatre,
            statuvaccorrect: statuvaccorrect ?? this.statuvaccorrect,
            analysemedrealise: analysemedrealise ?? this.analysemedrealise,
            recherchesignedanger: recherchesignedanger ?? this.recherchesignedanger,
            issusaccouchement: issusaccouchement ?? this.issusaccouchement,
            lieuaccouchementfs: lieuaccouchementfs ?? this.lieuaccouchementfs,
            sidispomedicamentnon: sidispomedicamentnon ?? this.sidispomedicamentnon,
            fullName: fullName ?? this.fullName,
            nomquartier: nomquartier ?? this.nomquartier,
            nomvillage: nomvillage ?? this.nomvillage,
            libcpecm: libcpecm ?? this.libcpecm,
        );

    factory PatientSuivi.fromJson(String str) => PatientSuivi.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory PatientSuivi.fromMap(Map<String, dynamic> json) => PatientSuivi(
        statutref: json["statutref"],
        rdvrespecte: json["rdvrespecte"],
        sirdvrespectenon: json["sirdvrespectenon"],
        recommandation: json["recommandation"],
        cpnavantdouzsa: json["cpnavantdouzsa"],
        grossesseconfirme: json["grossesseconfirme"],
        agegrossesse: json["agegrossesse"],
        sicpnavantdouzsaoui: json["sicpnavantdouzsaoui"],
        dispomedicament: json["dispomedicament"],
        sibonnepriseoui: json["sibonnepriseoui"],
        sidispomedicamentoui: json["sidispomedicamentoui"],
        sibonneprisenon: json["sibonneprisenon"],
        palumiidisponible: json["palumiidisponible"],
        paludormirsousmii: json["paludormirsousmii"],
        palutpiun: json["palutpiun"],
        palutpideux: json["palutpideux"],
        palutpitrois: json["palutpitrois"],
        palutpiquatre: json["palutpiquatre"],
        statuvaccorrect: json["statuvaccorrect"],
        analysemedrealise: json["analysemedrealise"],
        recherchesignedanger: json["recherchesignedanger"],
        issusaccouchement: json["issusaccouchement"],
        lieuaccouchementfs: json["lieuaccouchementfs"],
        sidispomedicamentnon: json["sidispomedicamentnon"],
        fullName: json["full_name"],
        nomquartier: json["nomquartier"],
        nomvillage: json["nomvillage"],
        libcpecm: json["libcpecm"],
    );

    Map<String, dynamic> toMap() => {
        "statutref": statutref,
        "rdvrespecte": rdvrespecte,
        "sirdvrespectenon": sirdvrespectenon,
        "recommandation": recommandation,
        "cpnavantdouzsa": cpnavantdouzsa,
        "grossesseconfirme": grossesseconfirme,
        "agegrossesse": agegrossesse,
        "sicpnavantdouzsaoui": sicpnavantdouzsaoui,
        "dispomedicament": dispomedicament,
        "sibonnepriseoui": sibonnepriseoui,
        "sidispomedicamentoui": sidispomedicamentoui,
        "sibonneprisenon": sibonneprisenon,
        "palumiidisponible": palumiidisponible,
        "paludormirsousmii": paludormirsousmii,
        "palutpiun": palutpiun,
        "palutpideux": palutpideux,
        "palutpitrois": palutpitrois,
        "palutpiquatre": palutpiquatre,
        "statuvaccorrect": statuvaccorrect,
        "analysemedrealise": analysemedrealise,
        "recherchesignedanger": recherchesignedanger,
        "issusaccouchement": issusaccouchement,
        "lieuaccouchementfs": lieuaccouchementfs,
        "sidispomedicamentnon": sidispomedicamentnon,
        "full_name": fullName,
        "nomquartier": nomquartier,
        "nomvillage": nomvillage,
        "libcpecm": libcpecm,
    };
}
