// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'gsheets_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GsheetsModel {
  CurrencyValue get market => throw _privateConstructorUsedError;
  String get ticker => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  double get devidend => throw _privateConstructorUsedError;
  bool get isAddedPortfolio => throw _privateConstructorUsedError;
  int get totalStocks => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GsheetsModelCopyWith<GsheetsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GsheetsModelCopyWith<$Res> {
  factory $GsheetsModelCopyWith(
          GsheetsModel value, $Res Function(GsheetsModel) then) =
      _$GsheetsModelCopyWithImpl<$Res, GsheetsModel>;
  @useResult
  $Res call(
      {CurrencyValue market,
      String ticker,
      String name,
      double price,
      double devidend,
      bool isAddedPortfolio,
      int totalStocks});
}

/// @nodoc
class _$GsheetsModelCopyWithImpl<$Res, $Val extends GsheetsModel>
    implements $GsheetsModelCopyWith<$Res> {
  _$GsheetsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? market = null,
    Object? ticker = null,
    Object? name = null,
    Object? price = null,
    Object? devidend = null,
    Object? isAddedPortfolio = null,
    Object? totalStocks = null,
  }) {
    return _then(_value.copyWith(
      market: null == market
          ? _value.market
          : market // ignore: cast_nullable_to_non_nullable
              as CurrencyValue,
      ticker: null == ticker
          ? _value.ticker
          : ticker // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      devidend: null == devidend
          ? _value.devidend
          : devidend // ignore: cast_nullable_to_non_nullable
              as double,
      isAddedPortfolio: null == isAddedPortfolio
          ? _value.isAddedPortfolio
          : isAddedPortfolio // ignore: cast_nullable_to_non_nullable
              as bool,
      totalStocks: null == totalStocks
          ? _value.totalStocks
          : totalStocks // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GsheetsModelCopyWith<$Res>
    implements $GsheetsModelCopyWith<$Res> {
  factory _$$_GsheetsModelCopyWith(
          _$_GsheetsModel value, $Res Function(_$_GsheetsModel) then) =
      __$$_GsheetsModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {CurrencyValue market,
      String ticker,
      String name,
      double price,
      double devidend,
      bool isAddedPortfolio,
      int totalStocks});
}

/// @nodoc
class __$$_GsheetsModelCopyWithImpl<$Res>
    extends _$GsheetsModelCopyWithImpl<$Res, _$_GsheetsModel>
    implements _$$_GsheetsModelCopyWith<$Res> {
  __$$_GsheetsModelCopyWithImpl(
      _$_GsheetsModel _value, $Res Function(_$_GsheetsModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? market = null,
    Object? ticker = null,
    Object? name = null,
    Object? price = null,
    Object? devidend = null,
    Object? isAddedPortfolio = null,
    Object? totalStocks = null,
  }) {
    return _then(_$_GsheetsModel(
      market: null == market
          ? _value.market
          : market // ignore: cast_nullable_to_non_nullable
              as CurrencyValue,
      ticker: null == ticker
          ? _value.ticker
          : ticker // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      devidend: null == devidend
          ? _value.devidend
          : devidend // ignore: cast_nullable_to_non_nullable
              as double,
      isAddedPortfolio: null == isAddedPortfolio
          ? _value.isAddedPortfolio
          : isAddedPortfolio // ignore: cast_nullable_to_non_nullable
              as bool,
      totalStocks: null == totalStocks
          ? _value.totalStocks
          : totalStocks // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_GsheetsModel extends _GsheetsModel {
  const _$_GsheetsModel(
      {this.market = CurrencyValue.non,
      this.ticker = '',
      this.name = '',
      this.price = 0,
      this.devidend = 0,
      this.isAddedPortfolio = false,
      this.totalStocks = 0})
      : super._();

  @override
  @JsonKey()
  final CurrencyValue market;
  @override
  @JsonKey()
  final String ticker;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final double price;
  @override
  @JsonKey()
  final double devidend;
  @override
  @JsonKey()
  final bool isAddedPortfolio;
  @override
  @JsonKey()
  final int totalStocks;

  @override
  String toString() {
    return 'GsheetsModel(market: $market, ticker: $ticker, name: $name, price: $price, devidend: $devidend, isAddedPortfolio: $isAddedPortfolio, totalStocks: $totalStocks)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GsheetsModel &&
            (identical(other.market, market) || other.market == market) &&
            (identical(other.ticker, ticker) || other.ticker == ticker) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.devidend, devidend) ||
                other.devidend == devidend) &&
            (identical(other.isAddedPortfolio, isAddedPortfolio) ||
                other.isAddedPortfolio == isAddedPortfolio) &&
            (identical(other.totalStocks, totalStocks) ||
                other.totalStocks == totalStocks));
  }

  @override
  int get hashCode => Object.hash(runtimeType, market, ticker, name, price,
      devidend, isAddedPortfolio, totalStocks);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GsheetsModelCopyWith<_$_GsheetsModel> get copyWith =>
      __$$_GsheetsModelCopyWithImpl<_$_GsheetsModel>(this, _$identity);
}

abstract class _GsheetsModel extends GsheetsModel {
  const factory _GsheetsModel(
      {final CurrencyValue market,
      final String ticker,
      final String name,
      final double price,
      final double devidend,
      final bool isAddedPortfolio,
      final int totalStocks}) = _$_GsheetsModel;
  const _GsheetsModel._() : super._();

  @override
  CurrencyValue get market;
  @override
  String get ticker;
  @override
  String get name;
  @override
  double get price;
  @override
  double get devidend;
  @override
  bool get isAddedPortfolio;
  @override
  int get totalStocks;
  @override
  @JsonKey(ignore: true)
  _$$_GsheetsModelCopyWith<_$_GsheetsModel> get copyWith =>
      throw _privateConstructorUsedError;
}
