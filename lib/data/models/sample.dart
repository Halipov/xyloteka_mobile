import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'botanic_description.dart';
import 'names.dart';
import 'photo.dart';
import 'sample_property.dart';
import 'user.dart';

class Sample {
  int? id;
  BotanicDescription? botanicDescription;
  String? place;
  User? whoCollect;
  User? whoDefine;
  bool? trade;
  DateTime? collectDate;
  Set<Photo>? photos;
  String? description;
  SampleProperty? properties;
  Names? names;
  Sample({
    this.id,
    this.botanicDescription,
    this.place,
    this.whoCollect,
    this.whoDefine,
    this.trade,
    this.collectDate,
    this.photos,
    this.description,
    this.properties,
    this.names,
  });

  Sample copyWith({
    int? id,
    BotanicDescription? botanicDescription,
    String? place,
    User? whoCollect,
    User? whoDefine,
    bool? trade,
    DateTime? collectDate,
    Set<Photo>? photos,
    String? description,
    SampleProperty? properties,
    Names? names,
  }) {
    return Sample(
      id: id ?? this.id,
      botanicDescription: botanicDescription ?? this.botanicDescription,
      place: place ?? this.place,
      whoCollect: whoCollect ?? this.whoCollect,
      whoDefine: whoDefine ?? this.whoDefine,
      trade: trade ?? this.trade,
      collectDate: collectDate ?? this.collectDate,
      photos: photos ?? this.photos,
      description: description ?? this.description,
      properties: properties ?? this.properties,
      names: names ?? this.names,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'botanicDescription': botanicDescription?.toMap(),
      'place': place,
      'whoCollect': whoCollect?.toMap(),
      'whoDefine': whoDefine?.toMap(),
      'trade': trade,
      'collectDate': collectDate?.millisecondsSinceEpoch,
      'photos': photos?.map((x) => x.toMap()).toList(),
      'description': description,
      'property': properties?.toMap(),
      'names': names?.toMap(),
    };
  }

  factory Sample.fromMap(Map<String, dynamic> map) {
    return Sample(
      id: map['id'],
      botanicDescription: BotanicDescription.fromMap(map['botanicDescription']),
      place: map['place'],
      whoCollect: User.fromMap(map['whoCollect'] ?? {'whoCollect': ''}),
      whoDefine: User.fromMap(map['whoDefine'] ?? {'whoDefine': ''}),
      trade: map['trade'],
      collectDate: DateTime.tryParse(map['collectDate'] ?? '2020-02-02'),
      photos:
          Set<Photo>.from(map['photos']?.map((x) => Photo.fromMap(x)) ?? []),
      description: map['description'],
      properties: SampleProperty.fromMap(map['property']),
      names: Names.fromMap(map['names']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Sample.fromJson(String source) => Sample.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Example(id: $id, botanicDescription: $botanicDescription, place: $place, whoCollect: $whoCollect, whoDefine: $whoDefine, trade: $trade, collectDate: $collectDate, photos: $photos, description: $description, properties: $properties, names: $names)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Sample &&
        other.id == id &&
        other.botanicDescription == botanicDescription &&
        other.place == place &&
        other.whoCollect == whoCollect &&
        other.whoDefine == whoDefine &&
        other.trade == trade &&
        other.collectDate == collectDate &&
        setEquals(other.photos, photos) &&
        other.description == description &&
        other.properties == properties &&
        other.names == names;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        botanicDescription.hashCode ^
        place.hashCode ^
        whoCollect.hashCode ^
        whoDefine.hashCode ^
        trade.hashCode ^
        collectDate.hashCode ^
        photos.hashCode ^
        description.hashCode ^
        properties.hashCode ^
        names.hashCode;
  }
}
