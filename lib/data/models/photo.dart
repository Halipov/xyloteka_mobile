import 'dart:convert';

import 'sample.dart';

class Photo {
  final int id;
  final Sample sampleId;
  final String photo;

  Photo({
    required this.id,
    required this.sampleId,
    required this.photo,
  });

  Photo copyWith({
    int? id,
    Sample? sampleId,
    String? photo,
  }) {
    return Photo(
      id: id ?? this.id,
      sampleId: sampleId ?? this.sampleId,
      photo: photo ?? this.photo,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'sampleId': sampleId.toMap(),
      'photo': photo,
    };
  }

  factory Photo.fromMap(Map<String, dynamic> map) {
    return Photo(
      id: map['id'],
      sampleId: Sample.fromMap(map['sampleId']),
      photo: map['photo'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Photo.fromJson(String source) => Photo.fromMap(json.decode(source));

  @override
  String toString() => 'Photo(id: $id, sampleId: $sampleId, photo: $photo)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Photo &&
        other.id == id &&
        other.sampleId == sampleId &&
        other.photo == photo;
  }

  @override
  int get hashCode => id.hashCode ^ sampleId.hashCode ^ photo.hashCode;
}
