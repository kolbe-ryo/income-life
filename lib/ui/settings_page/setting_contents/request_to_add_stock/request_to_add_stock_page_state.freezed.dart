// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'request_to_add_stock_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RequestToAddStockPageState {
  String get requestTicker => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RequestToAddStockPageStateCopyWith<RequestToAddStockPageState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestToAddStockPageStateCopyWith<$Res> {
  factory $RequestToAddStockPageStateCopyWith(RequestToAddStockPageState value,
          $Res Function(RequestToAddStockPageState) then) =
      _$RequestToAddStockPageStateCopyWithImpl<$Res,
          RequestToAddStockPageState>;
  @useResult
  $Res call({String requestTicker});
}

/// @nodoc
class _$RequestToAddStockPageStateCopyWithImpl<$Res,
        $Val extends RequestToAddStockPageState>
    implements $RequestToAddStockPageStateCopyWith<$Res> {
  _$RequestToAddStockPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestTicker = null,
  }) {
    return _then(_value.copyWith(
      requestTicker: null == requestTicker
          ? _value.requestTicker
          : requestTicker // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RequestToAddStockPageStateCopyWith<$Res>
    implements $RequestToAddStockPageStateCopyWith<$Res> {
  factory _$$_RequestToAddStockPageStateCopyWith(
          _$_RequestToAddStockPageState value,
          $Res Function(_$_RequestToAddStockPageState) then) =
      __$$_RequestToAddStockPageStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String requestTicker});
}

/// @nodoc
class __$$_RequestToAddStockPageStateCopyWithImpl<$Res>
    extends _$RequestToAddStockPageStateCopyWithImpl<$Res,
        _$_RequestToAddStockPageState>
    implements _$$_RequestToAddStockPageStateCopyWith<$Res> {
  __$$_RequestToAddStockPageStateCopyWithImpl(
      _$_RequestToAddStockPageState _value,
      $Res Function(_$_RequestToAddStockPageState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestTicker = null,
  }) {
    return _then(_$_RequestToAddStockPageState(
      requestTicker: null == requestTicker
          ? _value.requestTicker
          : requestTicker // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_RequestToAddStockPageState implements _RequestToAddStockPageState {
  const _$_RequestToAddStockPageState({this.requestTicker = ''});

  @override
  @JsonKey()
  final String requestTicker;

  @override
  String toString() {
    return 'RequestToAddStockPageState(requestTicker: $requestTicker)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RequestToAddStockPageState &&
            (identical(other.requestTicker, requestTicker) ||
                other.requestTicker == requestTicker));
  }

  @override
  int get hashCode => Object.hash(runtimeType, requestTicker);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RequestToAddStockPageStateCopyWith<_$_RequestToAddStockPageState>
      get copyWith => __$$_RequestToAddStockPageStateCopyWithImpl<
          _$_RequestToAddStockPageState>(this, _$identity);
}

abstract class _RequestToAddStockPageState
    implements RequestToAddStockPageState {
  const factory _RequestToAddStockPageState({final String requestTicker}) =
      _$_RequestToAddStockPageState;

  @override
  String get requestTicker;
  @override
  @JsonKey(ignore: true)
  _$$_RequestToAddStockPageStateCopyWith<_$_RequestToAddStockPageState>
      get copyWith => throw _privateConstructorUsedError;
}
