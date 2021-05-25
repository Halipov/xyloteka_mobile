import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'botanic_description.dart';
import 'names.dart';
import 'photo.dart';
import 'sample_property.dart';

class User {
  final int id;
  final BotanicDescription botanicDescriprtion;
  final String place;
  final User whoCollect;
  final User whoDefine;
  final int isTrade;
  final DateTime collectDate;
  final Set<Photo> photos;
  final String description;
  final SampleProperty property;
  final Names names;

  User({
    required this.id,
    required this.botanicDescriprtion,
    required this.place,
    required this.whoCollect,
    required this.whoDefine,
    required this.isTrade,
    required this.collectDate,
    required this.photos,
    required this.description,
    required this.property,
    required this.names,
  });

  User copyWith({
    int? id,
    BotanicDescription? botanicDescriprtion,
    String? place,
    User? whoCollect,
    User? whoDefine,
    int? isTrade,
    DateTime? collectDate,
    Set<Photo>? photos,
    String? description,
    SampleProperty? property,
    Names? names,
  }) {
    return User(
      id: id ?? this.id,
      botanicDescriprtion: botanicDescriprtion ?? this.botanicDescriprtion,
      place: place ?? this.place,
      whoCollect: whoCollect ?? this.whoCollect,
      whoDefine: whoDefine ?? this.whoDefine,
      isTrade: isTrade ?? this.isTrade,
      collectDate: collectDate ?? this.collectDate,
      photos: photos ?? this.photos,
      description: description ?? this.description,
      property: property ?? this.property,
      names: names ?? this.names,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'botanicDescriprtion': botanicDescriprtion.toMap(),
      'place': place,
      'whoCollect': whoCollect.toMap(),
      'whoDefine': whoDefine.toMap(),
      'isTrade': isTrade,
      'collectDate': collectDate.millisecondsSinceEpoch,
      'photos': photos.map((x) => x.toMap()).toList(),
      'description': description,
      'property': property.toMap(),
      'names': names.toMap(),
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      botanicDescriprtion:
          BotanicDescription.fromMap(map['botanicDescriprtion']),
      place: map['place'],
      whoCollect: User.fromMap(map['whoCollect']),
      whoDefine: User.fromMap(map['whoDefine']),
      isTrade: map['isTrade'],
      collectDate: DateTime.parse(map['collectDate']),
      photos: Set<Photo>.from(map['photos']?.map((x) => Photo.fromMap(x))),
      description: map['description'],
      property: SampleProperty.fromMap(map['property']),
      names: Names.fromMap(map['names']),
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(id: $id, botanicDescriprtion: $botanicDescriprtion, place: $place, whoCollect: $whoCollect, whoDefine: $whoDefine, isTrade: $isTrade, collectDate: $collectDate, photos: $photos, description: $description, property: $property, names: $names)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User &&
        other.id == id &&
        other.botanicDescriprtion == botanicDescriprtion &&
        other.place == place &&
        other.whoCollect == whoCollect &&
        other.whoDefine == whoDefine &&
        other.isTrade == isTrade &&
        other.collectDate == collectDate &&
        setEquals(other.photos, photos) &&
        other.description == description &&
        other.property == property &&
        other.names == names;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        botanicDescriprtion.hashCode ^
        place.hashCode ^
        whoCollect.hashCode ^
        whoDefine.hashCode ^
        isTrade.hashCode ^
        collectDate.hashCode ^
        photos.hashCode ^
        description.hashCode ^
        property.hashCode ^
        names.hashCode;
  }
}
