// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Product _$$_ProductFromJson(Map<String, dynamic> json) => _$_Product(
      id: json['id'] as String?,
      exchangeNumber: json['exchangeNumber'] as int?,
      name: json['name'] as String?,
      desc: json['desc'] as String?,
      stock: json['stock'] as int?,
      price: json['price'] as int?,
      picture: json['picture'] as String?,
      expirationFrom: dateFromTimestampValue(json['expirationFrom']),
      expirationTo: dateFromTimestampValue(json['expirationTo']),
      createdAt: dateFromTimestampValue(json['createdAt']),
      updatedAt: dateFromTimestampValue(json['updatedAt']),
      deletedAt: dateFromTimestampValue(json['deletedAt']),
      isActive: json['isActive'] as bool?,
    );

Map<String, dynamic> _$$_ProductToJson(_$_Product instance) =>
    <String, dynamic>{
      'id': instance.id,
      'exchangeNumber': instance.exchangeNumber,
      'name': instance.name,
      'desc': instance.desc,
      'stock': instance.stock,
      'price': instance.price,
      'picture': instance.picture,
      'expirationFrom': timestampFromDateValue(instance.expirationFrom),
      'expirationTo': timestampFromDateValue(instance.expirationTo),
      'createdAt': timestampFromDateValue(instance.createdAt),
      'updatedAt': timestampFromDateValue(instance.updatedAt),
      'deletedAt': timestampFromDateValue(instance.deletedAt),
      'isActive': instance.isActive,
    };
