// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class LoginUserDTO {
  final String email;
  final String password;

  LoginUserDTO({required this.email, required this.password});
  LoginUserDTO.empty()
      : email = "",
        password = '';

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
    };
  }

  factory LoginUserDTO.fromMap(Map<String, dynamic> map) {
    return LoginUserDTO(
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginUserDTO.fromJson(String source) =>
      LoginUserDTO.fromMap(json.decode(source) as Map<String, dynamic>);

  LoginUserDTO copyWith({
    String? email,
    String? password,
  }) {
    return LoginUserDTO(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  @override
  String toString() => 'EmailCredentialDTO(email: $email, password: $password)';
}
