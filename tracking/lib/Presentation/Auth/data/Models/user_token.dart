class User {
  final int id;
  final String name;
  final String email;
  final DateTime? emailVerifiedAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int? idVillageAscRc;
  final int idProfils;
  final int? idQuartierAscRc;
  final int idFsUser;

  User({
    required this.id,
    required this.name,
    required this.email,
    this.emailVerifiedAt,
    required this.createdAt,
    required this.updatedAt,
    this.idVillageAscRc,
    required this.idProfils,
    this.idQuartierAscRc,
    required this.idFsUser,
  });

  // Factory constructor to create User from JSON
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      emailVerifiedAt: json['email_verified_at'] != null ? DateTime.parse(json['email_verified_at']) : null,
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      idVillageAscRc: json['idvillageAscRc'],
      idProfils: json['idprofils'],
      idQuartierAscRc: json['idquartierAscRc'],
      idFsUser: json['idfsuser'],
    );
  }

  // Convert User object back to JSON (for storage)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'email_verified_at': emailVerifiedAt?.toIso8601String(),
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'idvillageAscRc': idVillageAscRc,
      'idprofils': idProfils,
      'idquartierAscRc': idQuartierAscRc,
      'idfsuser': idFsUser,
    };
  }
}

