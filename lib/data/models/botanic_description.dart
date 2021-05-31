import 'dart:convert';

import 'classis.dart';
import 'division.dart';
import 'family.dart';
import 'genus.dart';
import 'ordo.dart';
import 'species.dart';

class BotanicDescription {
  int? id;
  Division? divisio;
  Classis? classis;
  Ordo? ordo;
  Family? family;
  Genus? genus;
  Species? species;

  BotanicDescription({
    this.id,
    this.divisio,
    this.classis,
    this.ordo,
    this.family,
    this.genus,
    this.species,
  });

  BotanicDescription copyWith({
    int? id,
    Division? divisio,
    Classis? classis,
    Ordo? ordo,
    Family? family,
    Genus? genus,
    Species? species,
  }) {
    return BotanicDescription(
      id: id ?? this.id,
      divisio: divisio ?? this.divisio,
      classis: classis ?? this.classis,
      ordo: ordo ?? this.ordo,
      family: family ?? this.family,
      genus: genus ?? this.genus,
      species: species ?? this.species,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'divisio': divisio?.toMap(),
      'classis': classis?.toMap(),
      'ordo': ordo?.toMap(),
      'family': family?.toMap(),
      'genus': genus?.toMap(),
      'species': species?.toMap(),
    };
  }

  factory BotanicDescription.fromMap(Map<String, dynamic> map) {
    return BotanicDescription(
      id: map['id'],
      divisio: Division.fromMap(map['divisio']),
      classis: Classis.fromMap(map['classis']),
      ordo: Ordo.fromMap(map['ordo']),
      family: Family.fromMap(map['family']),
      genus: Genus.fromMap(map['genus']),
      species: Species.fromMap(map['species']),
    );
  }

  String toJson() => json.encode(toMap());

  factory BotanicDescription.fromJson(String source) =>
      BotanicDescription.fromMap(json.decode(source));

  @override
  String toString() {
    return 'BotanicDescription(id: $id, divisio: $divisio, classis: $classis, ordo: $ordo, family: $family, genus: $genus, species: $species)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BotanicDescription &&
        other.id == id &&
        other.divisio == divisio &&
        other.classis == classis &&
        other.ordo == ordo &&
        other.family == family &&
        other.genus == genus &&
        other.species == species;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        divisio.hashCode ^
        classis.hashCode ^
        ordo.hashCode ^
        family.hashCode ^
        genus.hashCode ^
        species.hashCode;
  }
}
