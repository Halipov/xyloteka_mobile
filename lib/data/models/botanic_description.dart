import 'dart:convert';

import 'classis.dart';
import 'division.dart';
import 'family.dart';
import 'genus.dart';
import 'ordo.dart';
import 'species.dart';

class BotanicDescription {
  final int id;
  final Division divisio;
  final Classis classis;
  final Ordo ordo;
  final Family familiy;
  final Genus genus;
  final Species species;

  BotanicDescription({
    required this.id,
    required this.divisio,
    required this.classis,
    required this.ordo,
    required this.familiy,
    required this.genus,
    required this.species,
  });

  BotanicDescription copyWith({
    int? id,
    Division? divisio,
    Classis? classis,
    Ordo? ordo,
    Family? familiy,
    Genus? genus,
    Species? species,
  }) {
    return BotanicDescription(
      id: id ?? this.id,
      divisio: divisio ?? this.divisio,
      classis: classis ?? this.classis,
      ordo: ordo ?? this.ordo,
      familiy: familiy ?? this.familiy,
      genus: genus ?? this.genus,
      species: species ?? this.species,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'divisio': divisio.toMap(),
      'classis': classis.toMap(),
      'ordo': ordo.toMap(),
      'familiy': familiy.toMap(),
      'genus': genus.toMap(),
      'species': species.toMap(),
    };
  }

  factory BotanicDescription.fromMap(Map<String, dynamic> map) {
    return BotanicDescription(
      id: map['id'],
      divisio: Division.fromMap(map['divisio']),
      classis: Classis.fromMap(map['classis']),
      ordo: Ordo.fromMap(map['ordo']),
      familiy: Family.fromMap(map['familiy']),
      genus: Genus.fromMap(map['genus']),
      species: Species.fromMap(map['species']),
    );
  }

  String toJson() => json.encode(toMap());

  factory BotanicDescription.fromJson(String source) =>
      BotanicDescription.fromMap(json.decode(source));

  @override
  String toString() {
    // ignore: lines_longer_than_80_chars
    return 'BotanicDescription(id: $id, divisio: $divisio, classis: $classis, ordo: $ordo, familiy: $familiy, genus: $genus, species: $species)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BotanicDescription &&
        other.id == id &&
        other.divisio == divisio &&
        other.classis == classis &&
        other.ordo == ordo &&
        other.familiy == familiy &&
        other.genus == genus &&
        other.species == species;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        divisio.hashCode ^
        classis.hashCode ^
        ordo.hashCode ^
        familiy.hashCode ^
        genus.hashCode ^
        species.hashCode;
  }
}
