import 'dart:convert';

class Names {
  final int id;
  final String nameTrade;
  Names({
    required this.id,
    required this.nameTrade,
  });

  Names copyWith({
    int? id,
    String? nameTrade,
  }) {
    return Names(
      id: id ?? this.id,
      nameTrade: nameTrade ?? this.nameTrade,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nameTrade': nameTrade,
    };
  }

  factory Names.fromMap(Map<String, dynamic> map) {
    return Names(
      id: map['id'],
      nameTrade: map['nameTrade'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Names.fromJson(String source) => Names.fromMap(json.decode(source));

  @override
  String toString() => 'Names(id: $id, nameTrade: $nameTrade)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Names && other.id == id && other.nameTrade == nameTrade;
  }

  @override
  int get hashCode => id.hashCode ^ nameTrade.hashCode;
}
