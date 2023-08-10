import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class EmailCredentialDTO {
  final String email;
  final String password;

  EmailCredentialDTO({required this.email, required this.password});
  EmailCredentialDTO.empty()
      : email = "",
        password = '';
}

class SignUpUserDTO {
  final String email;
  final String password;
  final String name;

  SignUpUserDTO(
      {required this.email, required this.password, required this.name});
  SignUpUserDTO.empty()
      : email = "",
        name = "",
        password = '';

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
      'name': name,
    };
  }

  factory SignUpUserDTO.fromMap(Map<String, dynamic> map) {
    return SignUpUserDTO(
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      name: map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory SignUpUserDTO.fromJson(String source) =>
      SignUpUserDTO.fromMap(json.decode(source) as Map<String, dynamic>);

  SignUpUserDTO copyWith({
    String? email,
    String? password,
    String? name,
  }) {
    return SignUpUserDTO(
      email: email ?? this.email,
      password: password ?? this.password,
      name: name ?? this.name,
    );
  }
}
