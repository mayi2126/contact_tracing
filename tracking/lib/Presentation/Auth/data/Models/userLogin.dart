
import 'dart:convert';

class UserLogin {
    
    final String email;
    final String pwd;

    UserLogin({
      
        required this.email,
        required this.pwd,
    });

    UserLogin copyWith({
        int? id,
        String? email,
        String? pwd,
    }) => 
        UserLogin(
           
            email: email ?? this.email,
            pwd: pwd ?? this.pwd,
        );

    factory UserLogin.fromJson(String str) => UserLogin.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory UserLogin.fromMap(Map<String, dynamic> json) => UserLogin(
        
        email: json["email"],
        pwd: json["pwd"],
    );

    Map<String, dynamic> toMap() => {
       
        "email": email,
        "pwd": pwd,
    };
}
