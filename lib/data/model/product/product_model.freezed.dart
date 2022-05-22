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
      String? organizer,
      int? exchangeNumber,
      required String? name,
      required String? genre,
      required String? desc,
      required int? stock,
      required int? price,
      String? picture1Name,
      String? picture1URL,
      String? picture2Name,
      String? picture2URL,
      String? picture3Name,
      String? picture3URL,
      @timestampkey required DateTime? expirationFrom,
      @timestampkey required DateTime? expirationTo,
      required bool? isPublished,
      @timestampkey DateTime? createdAt,
      @timestampkey DateTime? updatedAt,
      @timestampkey DateTime? deletedAt}) {
    return _Product(
      id: id,
      organizer: organizer,
      exchangeNumber: exchangeNumber,
      name: name,
      genre: genre,
      desc: desc,
      stock: stock,
      price: price,
      picture1Name: picture1Name,
      picture1URL: picture1URL,
      picture2Name: picture2Name,
      picture2URL: picture2URL,
      picture3Name: picture3Name,
      picture3URL: picture3URL,
      expirationFrom: expirationFrom,
      expirationTo: expirationTo,
      isPublished: isPublished,
      createdAt: createdAt,
      updatedAt: updatedAt,
      deletedAt: deletedAt,
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
  String? get organizer => throw _privateConstructorUsedError;
  int? get exchangeNumber => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get genre => throw _privateConstructorUsedError;
  String? get desc => throw _privateConstructorUsedError;
  int? get stock => throw _privateConstructorUsedError;
  int? get price => throw _privateConstructorUsedError;
  String? get picture1Name => throw _privateConstructorUsedError;
  String? get picture1URL => throw _privateConstructorUsedError;
  String? get picture2Name => throw _privateConstructorUsedError;
  String? get picture2URL => throw _privateConstructorUsedError;
  String? get picture3Name => throw _privateConstructorUsedError;
  String? get picture3URL => throw _privateConstructorUsedError;
  @timestampkey
  DateTime? get expirationFrom => throw _privateConstructorUsedError;
  @timestampkey
  DateTime? get expirationTo => throw _privateConstructorUsedError;
  bool? get isPublished => throw _privateConstructorUsedError;
  @timestampkey
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @timestampkey
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @timestampkey
  DateTime? get deletedAt => throw _privateConstructorUsedError;

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
      String? organizer,
      int? exchangeNumber,
      String? name,
      String? genre,
      String? desc,
      int? stock,
      int? price,
      String? picture1Name,
      String? picture1URL,
      String? picture2Name,
      String? picture2URL,
      String? picture3Name,
      String? picture3URL,
      @timestampkey DateTime? expirationFrom,
      @timestampkey DateTime? expirationTo,
      bool? isPublished,
      @timestampkey DateTime? createdAt,
      @timestampkey DateTime? updatedAt,
      @timestampkey DateTime? deletedAt});
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
    Object? organizer = freezed,
    Object? exchangeNumber = freezed,
    Object? name = freezed,
    Object? genre = freezed,
    Object? desc = freezed,
    Object? stock = freezed,
    Object? price = freezed,
    Object? picture1Name = freezed,
    Object? picture1URL = freezed,
    Object? picture2Name = freezed,
    Object? picture2URL = freezed,
    Object? picture3Name = freezed,
    Object? picture3URL = freezed,
    Object? expirationFrom = freezed,
    Object? expirationTo = freezed,
    Object? isPublished = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? deletedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      organizer: organizer == freezed
          ? _value.organizer
          : organizer // ignore: cast_nullable_to_non_nullable
              as String?,
      exchangeNumber: exchangeNumber == freezed
          ? _value.exchangeNumber
          : exchangeNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      genre: genre == freezed
          ? _value.genre
          : genre // ignore: cast_nullable_to_non_nullable
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
      picture1Name: picture1Name == freezed
          ? _value.picture1Name
          : picture1Name // ignore: cast_nullable_to_non_nullable
              as String?,
      picture1URL: picture1URL == freezed
          ? _value.picture1URL
          : picture1URL // ignore: cast_nullable_to_non_nullable
              as String?,
      picture2Name: picture2Name == freezed
          ? _value.picture2Name
          : picture2Name // ignore: cast_nullable_to_non_nullable
              as String?,
      picture2URL: picture2URL == freezed
          ? _value.picture2URL
          : picture2URL // ignore: cast_nullable_to_non_nullable
              as String?,
      picture3Name: picture3Name == freezed
          ? _value.picture3Name
          : picture3Name // ignore: cast_nullable_to_non_nullable
              as String?,
      picture3URL: picture3URL == freezed
          ? _value.picture3URL
          : picture3URL // ignore: cast_nullable_to_non_nullable
              as String?,
      expirationFrom: expirationFrom == freezed
          ? _value.expirationFrom
          : expirationFrom // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      expirationTo: expirationTo == freezed
          ? _value.expirationTo
          : expirationTo // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isPublished: isPublished == freezed
          ? _value.isPublished
          : isPublished // ignore: cast_nullable_to_non_nullable
              as bool?,
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
      String? organizer,
      int? exchangeNumber,
      String? name,
      String? genre,
      String? desc,
      int? stock,
      int? price,
      String? picture1Name,
      String? picture1URL,
      String? picture2Name,
      String? picture2URL,
      String? picture3Name,
      String? picture3URL,
      @timestampkey DateTime? expirationFrom,
      @timestampkey DateTime? expirationTo,
      bool? isPublished,
      @timestampkey DateTime? createdAt,
      @timestampkey DateTime? updatedAt,
      @timestampkey DateTime? deletedAt});
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
    Object? organizer = freezed,
    Object? exchangeNumber = freezed,
    Object? name = freezed,
    Object? genre = freezed,
    Object? desc = freezed,
    Object? stock = freezed,
    Object? price = freezed,
    Object? picture1Name = freezed,
    Object? picture1URL = freezed,
    Object? picture2Name = freezed,
    Object? picture2URL = freezed,
    Object? picture3Name = freezed,
    Object? picture3URL = freezed,
    Object? expirationFrom = freezed,
    Object? expirationTo = freezed,
    Object? isPublished = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? deletedAt = freezed,
  }) {
    return _then(_Product(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      organizer: organizer == freezed
          ? _value.organizer
          : organizer // ignore: cast_nullable_to_non_nullable
              as String?,
      exchangeNumber: exchangeNumber == freezed
          ? _value.exchangeNumber
          : exchangeNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      genre: genre == freezed
          ? _value.genre
          : genre // ignore: cast_nullable_to_non_nullable
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
      picture1Name: picture1Name == freezed
          ? _value.picture1Name
          : picture1Name // ignore: cast_nullable_to_non_nullable
              as String?,
      picture1URL: picture1URL == freezed
          ? _value.picture1URL
          : picture1URL // ignore: cast_nullable_to_non_nullable
              as String?,
      picture2Name: picture2Name == freezed
          ? _value.picture2Name
          : picture2Name // ignore: cast_nullable_to_non_nullable
              as String?,
      picture2URL: picture2URL == freezed
          ? _value.picture2URL
          : picture2URL // ignore: cast_nullable_to_non_nullable
              as String?,
      picture3Name: picture3Name == freezed
          ? _value.picture3Name
          : picture3Name // ignore: cast_nullable_to_non_nullable
              as String?,
      picture3URL: picture3URL == freezed
          ? _value.picture3URL
          : picture3URL // ignore: cast_nullable_to_non_nullable
              as String?,
      expirationFrom: expirationFrom == freezed
          ? _value.expirationFrom
          : expirationFrom // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      expirationTo: expirationTo == freezed
          ? _value.expirationTo
          : expirationTo // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isPublished: isPublished == freezed
          ? _value.isPublished
          : isPublished // ignore: cast_nullable_to_non_nullable
              as bool?,
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Product extends _Product {
  const _$_Product(
      {this.id,
      this.organizer,
      this.exchangeNumber,
      required this.name,
      required this.genre,
      required this.desc,
      required this.stock,
      required this.price,
      this.picture1Name,
      this.picture1URL,
      this.picture2Name,
      this.picture2URL,
      this.picture3Name,
      this.picture3URL,
      @timestampkey required this.expirationFrom,
      @timestampkey required this.expirationTo,
      required this.isPublished,
      @timestampkey this.createdAt,
      @timestampkey this.updatedAt,
      @timestampkey this.deletedAt})
      : super._();

  factory _$_Product.fromJson(Map<String, dynamic> json) =>
      _$$_ProductFromJson(json);

  @override
  final String? id;
  @override
  final String? organizer;
  @override
  final int? exchangeNumber;
  @override
  final String? name;
  @override
  final String? genre;
  @override
  final String? desc;
  @override
  final int? stock;
  @override
  final int? price;
  @override
  final String? picture1Name;
  @override
  final String? picture1URL;
  @override
  final String? picture2Name;
  @override
  final String? picture2URL;
  @override
  final String? picture3Name;
  @override
  final String? picture3URL;
  @override
  @timestampkey
  final DateTime? expirationFrom;
  @override
  @timestampkey
  final DateTime? expirationTo;
  @override
  final bool? isPublished;
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
  String toString() {
    return 'Product(id: $id, organizer: $organizer, exchangeNumber: $exchangeNumber, name: $name, genre: $genre, desc: $desc, stock: $stock, price: $price, picture1Name: $picture1Name, picture1URL: $picture1URL, picture2Name: $picture2Name, picture2URL: $picture2URL, picture3Name: $picture3Name, picture3URL: $picture3URL, expirationFrom: $expirationFrom, expirationTo: $expirationTo, isPublished: $isPublished, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Product &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.organizer, organizer) &&
            const DeepCollectionEquality()
                .equals(other.exchangeNumber, exchangeNumber) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.genre, genre) &&
            const DeepCollectionEquality().equals(other.desc, desc) &&
            const DeepCollectionEquality().equals(other.stock, stock) &&
            const DeepCollectionEquality().equals(other.price, price) &&
            const DeepCollectionEquality()
                .equals(other.picture1Name, picture1Name) &&
            const DeepCollectionEquality()
                .equals(other.picture1URL, picture1URL) &&
            const DeepCollectionEquality()
                .equals(other.picture2Name, picture2Name) &&
            const DeepCollectionEquality()
                .equals(other.picture2URL, picture2URL) &&
            const DeepCollectionEquality()
                .equals(other.picture3Name, picture3Name) &&
            const DeepCollectionEquality()
                .equals(other.picture3URL, picture3URL) &&
            const DeepCollectionEquality()
                .equals(other.expirationFrom, expirationFrom) &&
            const DeepCollectionEquality()
                .equals(other.expirationTo, expirationTo) &&
            const DeepCollectionEquality()
                .equals(other.isPublished, isPublished) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.updatedAt, updatedAt) &&
            const DeepCollectionEquality().equals(other.deletedAt, deletedAt));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        const DeepCollectionEquality().hash(id),
        const DeepCollectionEquality().hash(organizer),
        const DeepCollectionEquality().hash(exchangeNumber),
        const DeepCollectionEquality().hash(name),
        const DeepCollectionEquality().hash(genre),
        const DeepCollectionEquality().hash(desc),
        const DeepCollectionEquality().hash(stock),
        const DeepCollectionEquality().hash(price),
        const DeepCollectionEquality().hash(picture1Name),
        const DeepCollectionEquality().hash(picture1URL),
        const DeepCollectionEquality().hash(picture2Name),
        const DeepCollectionEquality().hash(picture2URL),
        const DeepCollectionEquality().hash(picture3Name),
        const DeepCollectionEquality().hash(picture3URL),
        const DeepCollectionEquality().hash(expirationFrom),
        const DeepCollectionEquality().hash(expirationTo),
        const DeepCollectionEquality().hash(isPublished),
        const DeepCollectionEquality().hash(createdAt),
        const DeepCollectionEquality().hash(updatedAt),
        const DeepCollectionEquality().hash(deletedAt)
      ]);

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
      String? organizer,
      int? exchangeNumber,
      required String? name,
      required String? genre,
      required String? desc,
      required int? stock,
      required int? price,
      String? picture1Name,
      String? picture1URL,
      String? picture2Name,
      String? picture2URL,
      String? picture3Name,
      String? picture3URL,
      @timestampkey required DateTime? expirationFrom,
      @timestampkey required DateTime? expirationTo,
      required bool? isPublished,
      @timestampkey DateTime? createdAt,
      @timestampkey DateTime? updatedAt,
      @timestampkey DateTime? deletedAt}) = _$_Product;
  const _Product._() : super._();

  factory _Product.fromJson(Map<String, dynamic> json) = _$_Product.fromJson;

  @override
  String? get id;
  @override
  String? get organizer;
  @override
  int? get exchangeNumber;
  @override
  String? get name;
  @override
  String? get genre;
  @override
  String? get desc;
  @override
  int? get stock;
  @override
  int? get price;
  @override
  String? get picture1Name;
  @override
  String? get picture1URL;
  @override
  String? get picture2Name;
  @override
  String? get picture2URL;
  @override
  String? get picture3Name;
  @override
  String? get picture3URL;
  @override
  @timestampkey
  DateTime? get expirationFrom;
  @override
  @timestampkey
  DateTime? get expirationTo;
  @override
  bool? get isPublished;
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
  @JsonKey(ignore: true)
  _$ProductCopyWith<_Product> get copyWith =>
      throw _privateConstructorUsedError;
}
