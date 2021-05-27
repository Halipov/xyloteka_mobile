import 'dart:convert';

import 'package:flutter/foundation.dart';

class LoginRequest {
  String username;
  String password;

  LoginRequest({
    required this.username,
    required this.password,
  });

  LoginRequest copyWith({
    String? username,
    String? password,
  }) {
    return LoginRequest(
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'password': password,
    };
  }

  factory LoginRequest.fromMap(Map<String, dynamic> map) {
    return LoginRequest(
      username: map['username'],
      password: map['password'],
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginRequest.fromJson(String source) =>
      LoginRequest.fromMap(json.decode(source));

  @override
  String toString() => 'LoginRequest(username: $username, password: $password)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LoginRequest &&
        other.username == username &&
        other.password == password;
  }

  @override
  int get hashCode => username.hashCode ^ password.hashCode;
}

class SignUpRequest {
  String username;
  String email;
  String password;

  SignUpRequest({
    required this.username,
    required this.email,
    required this.password,
  });

  SignUpRequest copyWith({
    String? username,
    String? email,
    String? password,
  }) {
    return SignUpRequest(
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'email': email,
      'password': password,
    };
  }

  factory SignUpRequest.fromMap(Map<String, dynamic> map) {
    return SignUpRequest(
      username: map['username'],
      email: map['email'],
      password: map['password'],
    );
  }

  String toJson() => json.encode(toMap());

  factory SignUpRequest.fromJson(String source) =>
      SignUpRequest.fromMap(json.decode(source));

  @override
  String toString() =>
      'SignUpRequest(username: $username, email: $email, password: $password)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SignUpRequest &&
        other.username == username &&
        other.email == email &&
        other.password == password;
  }

  @override
  int get hashCode => username.hashCode ^ email.hashCode ^ password.hashCode;
}

class LoginResponse {
  final int id;
  final String username;
  final String email;
  final List<String> roles;
  final String tokenType;
  final String accessToken;

  LoginResponse({
    required this.id,
    required this.username,
    required this.email,
    required this.roles,
    required this.tokenType,
    required this.accessToken,
  });

  LoginResponse copyWith({
    int? id,
    String? username,
    String? email,
    List<String>? roles,
    String? tokenType,
    String? accessToken,
  }) {
    return LoginResponse(
      id: id ?? this.id,
      username: username ?? this.username,
      email: email ?? this.email,
      roles: roles ?? this.roles,
      tokenType: tokenType ?? this.tokenType,
      accessToken: accessToken ?? this.accessToken,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'roles': roles,
      'tokenType': tokenType,
      'accessToken': accessToken,
    };
  }

  factory LoginResponse.fromMap(Map<String, dynamic> map) {
    return LoginResponse(
      id: map['id']?.toInt(),
      username: map['username'],
      email: map['email'],
      roles: List<String>.from(map['roles']),
      tokenType: map['tokenType'],
      accessToken: map['accessToken'],
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginResponse.fromJson(String source) =>
      LoginResponse.fromMap(json.decode(source));

  @override
  String toString() {
    return 'LoginResponse(id: $id, username: $username, email: $email, roles: $roles, tokenType: $tokenType, accessToken: $accessToken)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LoginResponse &&
        other.id == id &&
        other.username == username &&
        other.email == email &&
        listEquals(other.roles, roles) &&
        other.tokenType == tokenType &&
        other.accessToken == accessToken;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        username.hashCode ^
        email.hashCode ^
        roles.hashCode ^
        tokenType.hashCode ^
        accessToken.hashCode;
  }
}
