import 'dart:convert';

class UserToken {
    final String? jwt;

    UserToken({
        this.jwt,
    });

    UserToken copyWith({
        String? jwt,
    }) => 
        UserToken(
            jwt: jwt ?? this.jwt,
        );

    factory UserToken.fromJson(String str) => UserToken.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory UserToken.fromMap(Map<String, dynamic> json) => UserToken(
        jwt: json["jwt"],
    );

    Map<String, dynamic> toMap() => {
        "jwt": jwt,
    };
}
