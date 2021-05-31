import 'dart:convert';

class Division {
  final int? id;
  final String? name;

  Division({
    this.id,
    this.name,
  });

  Division copyWith({
    int? id,
    String? name,
  }) {
    return Division(
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

  factory Division.fromMap(Map<String, dynamic> map) {
    return Division(
      id: map['id'],
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Division.fromJson(String source) =>
      Division.fromMap(json.decode(source));

  @override
  String toString() => 'Division(id: $id, name: $name)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Division && other.id == id && other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
