import 'dart:convert';

class Names {
  int? id;
  String? tradeName;
  String? altName;
  Names({
    this.id,
    this.tradeName,
    this.altName,
  });

  Names copyWith({
    int? id,
    String? tradeName,
    String? altName,
  }) {
    return Names(
      id: id ?? this.id,
      tradeName: tradeName ?? this.tradeName,
      altName: altName ?? this.altName,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'tradeName': tradeName,
      'altName': altName,
    };
  }

  factory Names.fromMap(Map<String, dynamic> map) {
    return Names(
      id: map['id'],
      tradeName: map['tradeName'],
      altName: map['altName'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Names.fromJson(String source) => Names.fromMap(json.decode(source));

  @override
  String toString() =>
      'Names(id: $id, tradeName: $tradeName, altName: $altName)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Names &&
        other.id == id &&
        other.tradeName == tradeName &&
        other.altName == altName;
  }

  @override
  int get hashCode => id.hashCode ^ tradeName.hashCode ^ altName.hashCode;
}
