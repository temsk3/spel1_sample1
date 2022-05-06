// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'bazaar_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$BazaarStateTearOff {
  const _$BazaarStateTearOff();

  _BazaarState call({List<Bazaar> bazaarList = const <Bazaar>[]}) {
    return _BazaarState(
      bazaarList: bazaarList,
    );
  }
}

/// @nodoc
const $BazaarState = _$BazaarStateTearOff();

/// @nodoc
mixin _$BazaarState {
  List<Bazaar> get bazaarList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BazaarStateCopyWith<BazaarState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BazaarStateCopyWith<$Res> {
  factory $BazaarStateCopyWith(
          BazaarState value, $Res Function(BazaarState) then) =
      _$BazaarStateCopyWithImpl<$Res>;
  $Res call({List<Bazaar> bazaarList});
}

/// @nodoc
class _$BazaarStateCopyWithImpl<$Res> implements $BazaarStateCopyWith<$Res> {
  _$BazaarStateCopyWithImpl(this._value, this._then);

  final BazaarState _value;
  // ignore: unused_field
  final $Res Function(BazaarState) _then;

  @override
  $Res call({
    Object? bazaarList = freezed,
  }) {
    return _then(_value.copyWith(
      bazaarList: bazaarList == freezed
          ? _value.bazaarList
          : bazaarList // ignore: cast_nullable_to_non_nullable
              as List<Bazaar>,
    ));
  }
}

/// @nodoc
abstract class _$BazaarStateCopyWith<$Res>
    implements $BazaarStateCopyWith<$Res> {
  factory _$BazaarStateCopyWith(
          _BazaarState value, $Res Function(_BazaarState) then) =
      __$BazaarStateCopyWithImpl<$Res>;
  @override
  $Res call({List<Bazaar> bazaarList});
}

/// @nodoc
class __$BazaarStateCopyWithImpl<$Res> extends _$BazaarStateCopyWithImpl<$Res>
    implements _$BazaarStateCopyWith<$Res> {
  __$BazaarStateCopyWithImpl(
      _BazaarState _value, $Res Function(_BazaarState) _then)
      : super(_value, (v) => _then(v as _BazaarState));

  @override
  _BazaarState get _value => super._value as _BazaarState;

  @override
  $Res call({
    Object? bazaarList = freezed,
  }) {
    return _then(_BazaarState(
      bazaarList: bazaarList == freezed
          ? _value.bazaarList
          : bazaarList // ignore: cast_nullable_to_non_nullable
              as List<Bazaar>,
    ));
  }
}

/// @nodoc

class _$_BazaarState implements _BazaarState {
  const _$_BazaarState({this.bazaarList = const <Bazaar>[]});

  @JsonKey()
  @override
  final List<Bazaar> bazaarList;

  @override
  String toString() {
    return 'BazaarState(bazaarList: $bazaarList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BazaarState &&
            const DeepCollectionEquality()
                .equals(other.bazaarList, bazaarList));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(bazaarList));

  @JsonKey(ignore: true)
  @override
  _$BazaarStateCopyWith<_BazaarState> get copyWith =>
      __$BazaarStateCopyWithImpl<_BazaarState>(this, _$identity);
}

abstract class _BazaarState implements BazaarState {
  const factory _BazaarState({List<Bazaar> bazaarList}) = _$_BazaarState;

  @override
  List<Bazaar> get bazaarList;
  @override
  @JsonKey(ignore: true)
  _$BazaarStateCopyWith<_BazaarState> get copyWith =>
      throw _privateConstructorUsedError;
}
