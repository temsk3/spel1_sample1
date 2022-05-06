// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'bazaar_details_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$BazaarDetailsStateTearOff {
  const _$BazaarDetailsStateTearOff();

  _BazaarDetailsState call({Bazaar? bazaar}) {
    return _BazaarDetailsState(
      bazaar: bazaar,
    );
  }
}

/// @nodoc
const $BazaarDetailsState = _$BazaarDetailsStateTearOff();

/// @nodoc
mixin _$BazaarDetailsState {
  Bazaar? get bazaar => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BazaarDetailsStateCopyWith<BazaarDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BazaarDetailsStateCopyWith<$Res> {
  factory $BazaarDetailsStateCopyWith(
          BazaarDetailsState value, $Res Function(BazaarDetailsState) then) =
      _$BazaarDetailsStateCopyWithImpl<$Res>;
  $Res call({Bazaar? bazaar});

  $BazaarCopyWith<$Res>? get bazaar;
}

/// @nodoc
class _$BazaarDetailsStateCopyWithImpl<$Res>
    implements $BazaarDetailsStateCopyWith<$Res> {
  _$BazaarDetailsStateCopyWithImpl(this._value, this._then);

  final BazaarDetailsState _value;
  // ignore: unused_field
  final $Res Function(BazaarDetailsState) _then;

  @override
  $Res call({
    Object? bazaar = freezed,
  }) {
    return _then(_value.copyWith(
      bazaar: bazaar == freezed
          ? _value.bazaar
          : bazaar // ignore: cast_nullable_to_non_nullable
              as Bazaar?,
    ));
  }

  @override
  $BazaarCopyWith<$Res>? get bazaar {
    if (_value.bazaar == null) {
      return null;
    }

    return $BazaarCopyWith<$Res>(_value.bazaar!, (value) {
      return _then(_value.copyWith(bazaar: value));
    });
  }
}

/// @nodoc
abstract class _$BazaarDetailsStateCopyWith<$Res>
    implements $BazaarDetailsStateCopyWith<$Res> {
  factory _$BazaarDetailsStateCopyWith(
          _BazaarDetailsState value, $Res Function(_BazaarDetailsState) then) =
      __$BazaarDetailsStateCopyWithImpl<$Res>;
  @override
  $Res call({Bazaar? bazaar});

  @override
  $BazaarCopyWith<$Res>? get bazaar;
}

/// @nodoc
class __$BazaarDetailsStateCopyWithImpl<$Res>
    extends _$BazaarDetailsStateCopyWithImpl<$Res>
    implements _$BazaarDetailsStateCopyWith<$Res> {
  __$BazaarDetailsStateCopyWithImpl(
      _BazaarDetailsState _value, $Res Function(_BazaarDetailsState) _then)
      : super(_value, (v) => _then(v as _BazaarDetailsState));

  @override
  _BazaarDetailsState get _value => super._value as _BazaarDetailsState;

  @override
  $Res call({
    Object? bazaar = freezed,
  }) {
    return _then(_BazaarDetailsState(
      bazaar: bazaar == freezed
          ? _value.bazaar
          : bazaar // ignore: cast_nullable_to_non_nullable
              as Bazaar?,
    ));
  }
}

/// @nodoc

class _$_BazaarDetailsState implements _BazaarDetailsState {
  const _$_BazaarDetailsState({this.bazaar});

  @override
  final Bazaar? bazaar;

  @override
  String toString() {
    return 'BazaarDetailsState(bazaar: $bazaar)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BazaarDetailsState &&
            const DeepCollectionEquality().equals(other.bazaar, bazaar));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(bazaar));

  @JsonKey(ignore: true)
  @override
  _$BazaarDetailsStateCopyWith<_BazaarDetailsState> get copyWith =>
      __$BazaarDetailsStateCopyWithImpl<_BazaarDetailsState>(this, _$identity);
}

abstract class _BazaarDetailsState implements BazaarDetailsState {
  const factory _BazaarDetailsState({Bazaar? bazaar}) = _$_BazaarDetailsState;

  @override
  Bazaar? get bazaar;
  @override
  @JsonKey(ignore: true)
  _$BazaarDetailsStateCopyWith<_BazaarDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}
