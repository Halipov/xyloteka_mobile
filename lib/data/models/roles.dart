import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'user_role.dart';

class Roles {
  int id;
  List<String> name;

  Roles({
    required this.id,
    required this.name,
  });

  Roles copyWith({
    int? id,
    List<String>? name,
  }) {
    return Roles(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  factory Roles.fromMap(Map<String, dynamic> map) {
    return Roles(
      id: map['id'],
      name: List<String>.from(map['name']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Roles.fromJson(String source) => Roles.fromMap(json.decode(source));

  @override
  String toString() => 'Roles(id: $id, name: $name)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Roles && other.id == id && listEquals(other.name, name);
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
