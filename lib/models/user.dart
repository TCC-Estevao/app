// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'financialAccount.dart';

class User {
  final String id;
  final String name;
  final String email;
  final String password;
  final bool isAdmin;
  int? spendingLimit;
  List<FinancialAccount> financialAccount;
  List<dynamic> category;
  String accessToken;

  User({
    List<dynamic>? category,
    List<FinancialAccount>? financialAccount,
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.isAdmin,
    this.spendingLimit = -1,
    required this.accessToken,
  })  : category = category ?? [],
        financialAccount = financialAccount ?? [];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      "password": password,
      'isAdmin': isAdmin,
      'spendingLimit': spendingLimit,
      'financialAccount': financialAccount,
      'category': category,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] ?? '',
      name: map["name"] ?? '',
      email: map["email"] ?? '',
      password: map['password'] ?? '',
      isAdmin: map['isAdmin'],
      accessToken: map['access_token'],
      spendingLimit: map['spendingLimit'],
      category: (map['category'] != null)
          ? List<Map<String, dynamic>>.from(
              map['category']?.map((x) => Map<String, dynamic>.from(x)))
          : [],
      financialAccount: (map['financialAccount'] != null)
          ? List<FinancialAccount>.from(
              map['financialAccount']?.map((x) => Map<String, dynamic>.from(x)))
          : [],
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  User copyWith({
    String? id,
    String? name,
    String? email,
    String? password,
    bool? isAdmin,
    int? spendingLimit,
    List<FinancialAccount>? financialAccount,
    List<dynamic>? category,
    String? access_token,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      isAdmin: isAdmin ?? this.isAdmin,
      spendingLimit: spendingLimit ?? this.spendingLimit,
      financialAccount: financialAccount ?? this.financialAccount,
      category: category ?? this.category,
      accessToken: access_token ?? this.accessToken,
    );
  }
}
