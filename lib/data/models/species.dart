import 'dart:convert';

class Species {
  final int id;
  final String nameRus;
  final String nameLat;
  Species({
    required this.id,
    required this.nameRus,
    required this.nameLat,
  });

  Species copyWith({
    int? id,
    String? nameRus,
    String? nameLat,
  }) {
    return Species(
      id: id ?? this.id,
      nameRus: nameRus ?? this.nameRus,
      nameLat: nameLat ?? this.nameLat,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nameRus': nameRus,
      'nameLat': nameLat,
    };
  }

  factory Species.fromMap(Map<String, dynamic> map) {
    return Species(
      id: map['id'],
      nameRus: map['nameRus'],
      nameLat: map['nameLat'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Species.fromJson(String source) =>
      Species.fromMap(json.decode(source));

  @override
  String toString() => 'Species(id: $id, nameRus: $nameRus, nameLat: $nameLat)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Species &&
        other.id == id &&
        other.nameRus == nameRus &&
        other.nameLat == nameLat;
  }

  @override
  int get hashCode => id.hashCode ^ nameRus.hashCode ^ nameLat.hashCode;
}
