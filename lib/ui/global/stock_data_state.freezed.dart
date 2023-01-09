// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'stock_data_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$StockDataState {
  List<GsheetsModel> get gsheets => throw _privateConstructorUsedError;
  int get currentAddingStocks => throw _privateConstructorUsedError;
  bool get isSuccessFetch => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StockDataStateCopyWith<StockDataState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StockDataStateCopyWith<$Res> {
  factory $StockDataStateCopyWith(
          StockDataState value, $Res Function(StockDataState) then) =
      _$StockDataStateCopyWithImpl<$Res, StockDataState>;
  @useResult
  $Res call(
      {List<GsheetsModel> gsheets,
      int currentAddingStocks,
      bool isSuccessFetch});
}

/// @nodoc
class _$StockDataStateCopyWithImpl<$Res, $Val extends StockDataState>
    implements $StockDataStateCopyWith<$Res> {
  _$StockDataStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gsheets = null,
    Object? currentAddingStocks = null,
    Object? isSuccessFetch = null,
  }) {
    return _then(_value.copyWith(
      gsheets: null == gsheets
          ? _value.gsheets
          : gsheets // ignore: cast_nullable_to_non_nullable
              as List<GsheetsModel>,
      currentAddingStocks: null == currentAddingStocks
          ? _value.currentAddingStocks
          : currentAddingStocks // ignore: cast_nullable_to_non_nullable
              as int,
      isSuccessFetch: null == isSuccessFetch
          ? _value.isSuccessFetch
          : isSuccessFetch // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StockDataStateCopyWith<$Res>
    implements $StockDataStateCopyWith<$Res> {
  factory _$$_StockDataStateCopyWith(
          _$_StockDataState value, $Res Function(_$_StockDataState) then) =
      __$$_StockDataStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<GsheetsModel> gsheets,
      int currentAddingStocks,
      bool isSuccessFetch});
}

/// @nodoc
class __$$_StockDataStateCopyWithImpl<$Res>
    extends _$StockDataStateCopyWithImpl<$Res, _$_StockDataState>
    implements _$$_StockDataStateCopyWith<$Res> {
  __$$_StockDataStateCopyWithImpl(
      _$_StockDataState _value, $Res Function(_$_StockDataState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gsheets = null,
    Object? currentAddingStocks = null,
    Object? isSuccessFetch = null,
  }) {
    return _then(_$_StockDataState(
      gsheets: null == gsheets
          ? _value._gsheets
          : gsheets // ignore: cast_nullable_to_non_nullable
              as List<GsheetsModel>,
      currentAddingStocks: null == currentAddingStocks
          ? _value.currentAddingStocks
          : currentAddingStocks // ignore: cast_nullable_to_non_nullable
              as int,
      isSuccessFetch: null == isSuccessFetch
          ? _value.isSuccessFetch
          : isSuccessFetch // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_StockDataState extends _StockDataState {
  const _$_StockDataState(
      {final List<GsheetsModel> gsheets = const <GsheetsModel>[],
      this.currentAddingStocks = 0,
      this.isSuccessFetch = false})
      : _gsheets = gsheets,
        super._();

  final List<GsheetsModel> _gsheets;
  @override
  @JsonKey()
  List<GsheetsModel> get gsheets {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_gsheets);
  }

  @override
  @JsonKey()
  final int currentAddingStocks;
  @override
  @JsonKey()
  final bool isSuccessFetch;

  @override
  String toString() {
    return 'StockDataState(gsheets: $gsheets, currentAddingStocks: $currentAddingStocks, isSuccessFetch: $isSuccessFetch)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StockDataState &&
            const DeepCollectionEquality().equals(other._gsheets, _gsheets) &&
            (identical(other.currentAddingStocks, currentAddingStocks) ||
                other.currentAddingStocks == currentAddingStocks) &&
            (identical(other.isSuccessFetch, isSuccessFetch) ||
                other.isSuccessFetch == isSuccessFetch));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_gsheets),
      currentAddingStocks,
      isSuccessFetch);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StockDataStateCopyWith<_$_StockDataState> get copyWith =>
      __$$_StockDataStateCopyWithImpl<_$_StockDataState>(this, _$identity);
}

abstract class _StockDataState extends StockDataState {
  const factory _StockDataState(
      {final List<GsheetsModel> gsheets,
      final int currentAddingStocks,
      final bool isSuccessFetch}) = _$_StockDataState;
  const _StockDataState._() : super._();

  @override
  List<GsheetsModel> get gsheets;
  @override
  int get currentAddingStocks;
  @override
  bool get isSuccessFetch;
  @override
  @JsonKey(ignore: true)
  _$$_StockDataStateCopyWith<_$_StockDataState> get copyWith =>
      throw _privateConstructorUsedError;
}
