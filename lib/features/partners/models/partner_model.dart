import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class PartnerModel {
  final String partnertitle;
  final DateTime dateCreated;
  final int price;
  final String priceInWords;
  final String id;

  PartnerModel({
    required this.partnertitle,
    required this.dateCreated,
    required this.price,
    required this.priceInWords,
    required this.id,
  });

  PartnerModel copyWith({
    String? partnertitle,
    DateTime? dateCreated,
    int? price,
    String? priceInWords,
    String? id,
  }) {
    return PartnerModel(
      partnertitle: partnertitle ?? this.partnertitle,
      dateCreated: dateCreated ?? this.dateCreated,
      price: price ?? this.price,
      priceInWords: priceInWords ?? this.priceInWords,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'partnertitle': partnertitle,
      'dateCreated': dateCreated.millisecondsSinceEpoch,
      'price': price,
      'priceInWords': priceInWords,
      'id': id,
    };
  }

  factory PartnerModel.fromMap(Map<String, dynamic> map) {
    return PartnerModel(
      partnertitle: map['partnertitle'] as String,
      dateCreated:
          DateTime.fromMillisecondsSinceEpoch(map['dateCreated'] as int),
      price: map['price'] as int,
      priceInWords: map['priceInWords'] as String,
      id: map['id'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PartnerModel.fromJson(String source) =>
      PartnerModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PartnerModel(partnertitle: $partnertitle, dateCreated: $dateCreated, price: $price, priceInWords: $priceInWords, id: $id)';
  }

  @override
  bool operator ==(covariant PartnerModel other) {
    if (identical(this, other)) return true;

    return other.partnertitle == partnertitle &&
        other.dateCreated == dateCreated &&
        other.price == price &&
        other.priceInWords == priceInWords &&
        other.id == id;
  }

  @override
  int get hashCode {
    return partnertitle.hashCode ^
        dateCreated.hashCode ^
        price.hashCode ^
        priceInWords.hashCode ^
        id.hashCode;
  }
}
