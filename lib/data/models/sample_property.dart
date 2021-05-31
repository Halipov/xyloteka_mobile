import 'dart:convert';

class SampleProperty {
  int? id;
  String? density;
  String? hardness;
  String? shrinkage;
  SampleProperty({
    this.id,
    this.density,
    this.hardness,
    this.shrinkage,
  });

  SampleProperty copyWith({
    int? id,
    String? density,
    String? hardness,
    String? shrinkage,
  }) {
    return SampleProperty(
      id: id ?? this.id,
      density: density ?? this.density,
      hardness: hardness ?? this.hardness,
      shrinkage: shrinkage ?? this.shrinkage,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'density': density,
      'hardness': hardness,
      'shrinkage': shrinkage,
    };
  }

  factory SampleProperty.fromMap(Map<String, dynamic> map) {
    return SampleProperty(
      id: map['id'],
      density: map['density'],
      hardness: map['hardness'],
      shrinkage: map['shrinkage'],
    );
  }

  String toJson() => json.encode(toMap());

  factory SampleProperty.fromJson(String source) =>
      SampleProperty.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SampleProperty(id: $id, density: $density, hardness: $hardness, shrinkage: $shrinkage)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SampleProperty &&
        other.id == id &&
        other.density == density &&
        other.hardness == hardness &&
        other.shrinkage == shrinkage;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        density.hashCode ^
        hardness.hashCode ^
        shrinkage.hashCode;
  }
}
