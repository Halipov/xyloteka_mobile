import 'dart:convert';

import 'sample.dart';
import 'status.dart';
import 'user.dart';

class TradeOffer {
  final int id;
  final User whoRequest;
  final Sample whatOffer;
  final Sample whatAsk;
  final String description;
  final Status status;

  TradeOffer({
    required this.id,
    required this.whoRequest,
    required this.whatOffer,
    required this.whatAsk,
    required this.description,
    required this.status,
  });

  TradeOffer copyWith({
    int? id,
    User? whoRequest,
    Sample? whatOffer,
    Sample? whatAsk,
    String? description,
    Status? status,
  }) {
    return TradeOffer(
      id: id ?? this.id,
      whoRequest: whoRequest ?? this.whoRequest,
      whatOffer: whatOffer ?? this.whatOffer,
      whatAsk: whatAsk ?? this.whatAsk,
      description: description ?? this.description,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'whoRequest': whoRequest.toMap(),
      'whatOffer': whatOffer.toMap(),
      'whatAsk': whatAsk.toMap(),
      'description': description,
      'status': status.toMap(),
    };
  }

  factory TradeOffer.fromMap(Map<String, dynamic> map) {
    return TradeOffer(
      id: map['id'],
      whoRequest: User.fromMap(map['whoRequest']),
      whatOffer: Sample.fromMap(map['whatOffer']),
      whatAsk: Sample.fromMap(map['whatAsk']),
      description: map['description'],
      status: Status.fromMap(map['status']),
    );
  }

  String toJson() => json.encode(toMap());

  factory TradeOffer.fromJson(String source) =>
      TradeOffer.fromMap(json.decode(source));

  @override
  String toString() {
    // ignore: lines_longer_than_80_chars
    return 'TradeOffer(id: $id, whoRequest: $whoRequest, whatOffer: $whatOffer, whatAsk: $whatAsk, description: $description, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TradeOffer &&
        other.id == id &&
        other.whoRequest == whoRequest &&
        other.whatOffer == whatOffer &&
        other.whatAsk == whatAsk &&
        other.description == description &&
        other.status == status;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        whoRequest.hashCode ^
        whatOffer.hashCode ^
        whatAsk.hashCode ^
        description.hashCode ^
        status.hashCode;
  }
}
