import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

// // firestore から受け取った Timestamp型を DateTime型に変換するためにJsonKeyを作成 @timestamp DateTime
DateTime? dateFromTimestampValue(dynamic value) =>
    value != null ? (value as Timestamp).toDate() : null;

Timestamp? timestampFromDateValue(dynamic value) =>
    value is DateTime ? Timestamp.fromDate(value) : null;

const timestampkey = JsonKey(
  fromJson: dateFromTimestampValue,
  toJson: timestampFromDateValue,
);

//
@freezed
class Product with _$Product {
  const Product._();

  const factory Product({
    String? id,
    int? exchangeNumber,
    required String? name,
    required String? desc,
    required int? stock,
    required int? price,
    String? picture,
    @timestampkey required DateTime? expirationFrom,
    @timestampkey required DateTime? expirationTo,
    @timestampkey DateTime? createdAt,
    @timestampkey DateTime? updatedAt,
    @timestampkey DateTime? deletedAt,
    required bool? isActive,
  }) = _Product;

  factory Product.empty() => const Product(
        name: '',
        desc: '',
        stock: 0,
        price: 0,
        picture: '',
        expirationFrom: null,
        expirationTo: null,
        isActive: true,
      );

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}
