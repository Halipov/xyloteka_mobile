import 'dart:convert';

class Genus {
  int? id;
  String? name;
  Genus({
    this.id,
    this.name,
  });

  Genus copyWith({
    int? id,
    String? name,
  }) {
    return Genus(
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

  factory Genus.fromMap(Map<String, dynamic> map) {
    return Genus(
      id: map['id'],
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Genus.fromJson(String source) => Genus.fromMap(json.decode(source));

  @override
  String toString() => 'Genus(id: $id, name: $name)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Genus && other.id == id && other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
