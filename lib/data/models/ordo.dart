import 'dart:convert';

class Ordo {
  int? id;
  String? name;
  Ordo({
    this.id,
    this.name,
  });

  Ordo copyWith({
    int? id,
    String? name,
  }) {
    return Ordo(
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

  factory Ordo.fromMap(Map<String, dynamic> map) {
    return Ordo(
      id: map['id'],
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Ordo.fromJson(String source) => Ordo.fromMap(json.decode(source));

  @override
  String toString() => 'Ordo(id: $id, name: $name)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Ordo && other.id == id && other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
