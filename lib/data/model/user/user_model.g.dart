// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      id: json['id'] as String?,
      displayName: json['displayName'] as String?,
      email: json['email'] as String?,
      customerId: json['customerId'] as String?,
      accountId: json['accountId'] as String?,
      sourceId: json['sourceId'] as String?,
      status: $enumDecodeNullable(_$StatusEnumMap, json['status']),
      chargesEnabled: json['chargesEnabled'] as bool?,
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'id': instance.id,
      'displayName': instance.displayName,
      'email': instance.email,
      'customerId': instance.customerId,
      'accountId': instance.accountId,
      'sourceId': instance.sourceId,
      'status': _$StatusEnumMap[instance.status],
      'chargesEnabled': instance.chargesEnabled,
    };

const _$StatusEnumMap = {
  Status.unverified: 'unverified',
  Status.verified: 'verified',
  Status.unknown: 'unknown',
};
