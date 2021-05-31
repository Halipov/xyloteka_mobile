import 'dart:convert';

class Family {
  int? id;
  String? name;

  Family({
    this.id,
    this.name,
  });

  Family copyWith({
    int? id,
    String? name,
  }) {
    return Family(
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

  factory Family.fromMap(Map<String, dynamic> map) {
    return Family(
      id: map['id'],
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Family.fromJson(String source) => Family.fromMap(json.decode(source));

  @override
  String toString() => 'Family(id: $id, name: $name)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Family && other.id == id && other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
