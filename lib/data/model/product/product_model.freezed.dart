// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'product_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Product _$ProductFromJson(Map<String, dynamic> json) {
  return _Product.fromJson(json);
}

/// @nodoc
class _$ProductTearOff {
  const _$ProductTearOff();

  _Product call(
      {String? id,
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
      required bool? isActive}) {
    return _Product(
      id: id,
      exchangeNumber: exchangeNumber,
      name: name,
      desc: desc,
      stock: stock,
      price: price,
      picture: picture,
      expirationFrom: expirationFrom,
      expirationTo: expirationTo,
      createdAt: createdAt,
      updatedAt: updatedAt,
      deletedAt: deletedAt,
      isActive: isActive,
    );
  }

  Product fromJson(Map<String, Object?> json) {
    return Product.fromJson(json);
  }
}

/// @nodoc
const $Product = _$ProductTearOff();

/// @nodoc
mixin _$Product {
  String? get id => throw _privateConstructorUsedError;
  int? get exchangeNumber => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get desc => throw _privateConstructorUsedError;
  int? get stock => throw _privateConstructorUsedError;
  int? get price => throw _privateConstructorUsedError;
  String? get picture => throw _privateConstructorUsedError;
  @timestampkey
  DateTime? get expirationFrom => throw _privateConstructorUsedError;
  @timestampkey
  DateTime? get expirationTo => throw _privateConstructorUsedError;
  @timestampkey
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @timestampkey
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @timestampkey
  DateTime? get deletedAt => throw _privateConstructorUsedError;
  bool? get isActive => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductCopyWith<Product> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductCopyWith<$Res> {
  factory $ProductCopyWith(Product value, $Res Function(Product) then) =
      _$ProductCopyWithImpl<$Res>;
  $Res call(
      {String? id,
      int? exchangeNumber,
      String? name,
      String? desc,
      int? stock,
      int? price,
      String? picture,
      @timestampkey DateTime? expirationFrom,
      @timestampkey DateTime? expirationTo,
      @timestampkey DateTime? createdAt,
      @timestampkey DateTime? updatedAt,
      @timestampkey DateTime? deletedAt,
      bool? isActive});
}

/// @nodoc
class _$ProductCopyWithImpl<$Res> implements $ProductCopyWith<$Res> {
  _$ProductCopyWithImpl(this._value, this._then);

  final Product _value;
  // ignore: unused_field
  final $Res Function(Product) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? exchangeNumber = freezed,
    Object? name = freezed,
    Object? desc = freezed,
    Object? stock = freezed,
    Object? price = freezed,
    Object? picture = freezed,
    Object? expirationFrom = freezed,
    Object? expirationTo = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? deletedAt = freezed,
    Object? isActive = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      exchangeNumber: exchangeNumber == freezed
          ? _value.exchangeNumber
          : exchangeNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      desc: desc == freezed
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String?,
      stock: stock == freezed
          ? _value.stock
          : stock // ignore: cast_nullable_to_non_nullable
              as int?,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
      picture: picture == freezed
          ? _value.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as String?,
      expirationFrom: expirationFrom == freezed
          ? _value.expirationFrom
          : expirationFrom // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      expirationTo: expirationTo == freezed
          ? _value.expirationTo
          : expirationTo // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deletedAt: deletedAt == freezed
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isActive: isActive == freezed
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
abstract class _$ProductCopyWith<$Res> implements $ProductCopyWith<$Res> {
  factory _$ProductCopyWith(_Product value, $Res Function(_Product) then) =
      __$ProductCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id,
      int? exchangeNumber,
      String? name,
      String? desc,
      int? stock,
      int? price,
      String? picture,
      @timestampkey DateTime? expirationFrom,
      @timestampkey DateTime? expirationTo,
      @timestampkey DateTime? createdAt,
      @timestampkey DateTime? updatedAt,
      @timestampkey DateTime? deletedAt,
      bool? isActive});
}

/// @nodoc
class __$ProductCopyWithImpl<$Res> extends _$ProductCopyWithImpl<$Res>
    implements _$ProductCopyWith<$Res> {
  __$ProductCopyWithImpl(_Product _value, $Res Function(_Product) _then)
      : super(_value, (v) => _then(v as _Product));

  @override
  _Product get _value => super._value as _Product;

  @override
  $Res call({
    Object? id = freezed,
    Object? exchangeNumber = freezed,
    Object? name = freezed,
    Object? desc = freezed,
    Object? stock = freezed,
    Object? price = freezed,
    Object? picture = freezed,
    Object? expirationFrom = freezed,
    Object? expirationTo = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? deletedAt = freezed,
    Object? isActive = freezed,
  }) {
    return _then(_Product(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      exchangeNumber: exchangeNumber == freezed
          ? _value.exchangeNumber
          : exchangeNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      desc: desc == freezed
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String?,
      stock: stock == freezed
          ? _value.stock
          : stock // ignore: cast_nullable_to_non_nullable
              as int?,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
      picture: picture == freezed
          ? _value.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as String?,
      expirationFrom: expirationFrom == freezed
          ? _value.expirationFrom
          : expirationFrom // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      expirationTo: expirationTo == freezed
          ? _value.expirationTo
          : expirationTo // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deletedAt: deletedAt == freezed
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isActive: isActive == freezed
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Product extends _Product {
  const _$_Product(
      {this.id,
      this.exchangeNumber,
      required this.name,
      required this.desc,
      required this.stock,
      required this.price,
      this.picture,
      @timestampkey required this.expirationFrom,
      @timestampkey required this.expirationTo,
      @timestampkey this.createdAt,
      @timestampkey this.updatedAt,
      @timestampkey this.deletedAt,
      required this.isActive})
      : super._();

  factory _$_Product.fromJson(Map<String, dynamic> json) =>
      _$$_ProductFromJson(json);

  @override
  final String? id;
  @override
  final int? exchangeNumber;
  @override
  final String? name;
  @override
  final String? desc;
  @override
  final int? stock;
  @override
  final int? price;
  @override
  final String? picture;
  @override
  @timestampkey
  final DateTime? expirationFrom;
  @override
  @timestampkey
  final DateTime? expirationTo;
  @override
  @timestampkey
  final DateTime? createdAt;
  @override
  @timestampkey
  final DateTime? updatedAt;
  @override
  @timestampkey
  final DateTime? deletedAt;
  @override
  final bool? isActive;

  @override
  String toString() {
    return 'Product(id: $id, exchangeNumber: $exchangeNumber, name: $name, desc: $desc, stock: $stock, price: $price, picture: $picture, expirationFrom: $expirationFrom, expirationTo: $expirationTo, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt, isActive: $isActive)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Product &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.exchangeNumber, exchangeNumber) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.desc, desc) &&
            const DeepCollectionEquality().equals(other.stock, stock) &&
            const DeepCollectionEquality().equals(other.price, price) &&
            const DeepCollectionEquality().equals(other.picture, picture) &&
            const DeepCollectionEquality()
                .equals(other.expirationFrom, expirationFrom) &&
            const DeepCollectionEquality()
                .equals(other.expirationTo, expirationTo) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.updatedAt, updatedAt) &&
            const DeepCollectionEquality().equals(other.deletedAt, deletedAt) &&
            const DeepCollectionEquality().equals(other.isActive, isActive));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(exchangeNumber),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(desc),
      const DeepCollectionEquality().hash(stock),
      const DeepCollectionEquality().hash(price),
      const DeepCollectionEquality().hash(picture),
      const DeepCollectionEquality().hash(expirationFrom),
      const DeepCollectionEquality().hash(expirationTo),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(updatedAt),
      const DeepCollectionEquality().hash(deletedAt),
      const DeepCollectionEquality().hash(isActive));

  @JsonKey(ignore: true)
  @override
  _$ProductCopyWith<_Product> get copyWith =>
      __$ProductCopyWithImpl<_Product>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProductToJson(this);
  }
}

abstract class _Product extends Product {
  const factory _Product(
      {String? id,
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
      required bool? isActive}) = _$_Product;
  const _Product._() : super._();

  factory _Product.fromJson(Map<String, dynamic> json) = _$_Product.fromJson;

  @override
  String? get id;
  @override
  int? get exchangeNumber;
  @override
  String? get name;
  @override
  String? get desc;
  @override
  int? get stock;
  @override
  int? get price;
  @override
  String? get picture;
  @override
  @timestampkey
  DateTime? get expirationFrom;
  @override
  @timestampkey
  DateTime? get expirationTo;
  @override
  @timestampkey
  DateTime? get createdAt;
  @override
  @timestampkey
  DateTime? get updatedAt;
  @override
  @timestampkey
  DateTime? get deletedAt;
  @override
  bool? get isActive;
  @override
  @JsonKey(ignore: true)
  _$ProductCopyWith<_Product> get copyWith =>
      throw _privateConstructorUsedError;
}
