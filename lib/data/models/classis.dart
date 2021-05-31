import 'dart:convert';

class Classis {
  int? id;
  String? name;

  Classis({
    this.id,
    this.name,
  });

  Classis copyWith({
    int? id,
    String? name,
  }) {
    return Classis(
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

  factory Classis.fromMap(Map<String, dynamic> map) {
    return Classis(
      id: map['id'],
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Classis.fromJson(String source) =>
      Classis.fromMap(json.decode(source));

  @override
  String toString() => 'Classis(id: $id, name: $name)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Classis && other.id == id && other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
