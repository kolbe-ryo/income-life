// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'top_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TopPageState {
  int get pageIndex => throw _privateConstructorUsedError;
  ColorIndexEnum get colorTheme => throw _privateConstructorUsedError;
  ChartThemeEnum get chartTheme => throw _privateConstructorUsedError;
  CurrencyValue get currencyValue => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TopPageStateCopyWith<TopPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TopPageStateCopyWith<$Res> {
  factory $TopPageStateCopyWith(
          TopPageState value, $Res Function(TopPageState) then) =
      _$TopPageStateCopyWithImpl<$Res, TopPageState>;
  @useResult
  $Res call(
      {int pageIndex,
      ColorIndexEnum colorTheme,
      ChartThemeEnum chartTheme,
      CurrencyValue currencyValue});
}

/// @nodoc
class _$TopPageStateCopyWithImpl<$Res, $Val extends TopPageState>
    implements $TopPageStateCopyWith<$Res> {
  _$TopPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageIndex = null,
    Object? colorTheme = null,
    Object? chartTheme = null,
    Object? currencyValue = null,
  }) {
    return _then(_value.copyWith(
      pageIndex: null == pageIndex
          ? _value.pageIndex
          : pageIndex // ignore: cast_nullable_to_non_nullable
              as int,
      colorTheme: null == colorTheme
          ? _value.colorTheme
          : colorTheme // ignore: cast_nullable_to_non_nullable
              as ColorIndexEnum,
      chartTheme: null == chartTheme
          ? _value.chartTheme
          : chartTheme // ignore: cast_nullable_to_non_nullable
              as ChartThemeEnum,
      currencyValue: null == currencyValue
          ? _value.currencyValue
          : currencyValue // ignore: cast_nullable_to_non_nullable
              as CurrencyValue,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TopPageStateCopyWith<$Res>
    implements $TopPageStateCopyWith<$Res> {
  factory _$$_TopPageStateCopyWith(
          _$_TopPageState value, $Res Function(_$_TopPageState) then) =
      __$$_TopPageStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int pageIndex,
      ColorIndexEnum colorTheme,
      ChartThemeEnum chartTheme,
      CurrencyValue currencyValue});
}

/// @nodoc
class __$$_TopPageStateCopyWithImpl<$Res>
    extends _$TopPageStateCopyWithImpl<$Res, _$_TopPageState>
    implements _$$_TopPageStateCopyWith<$Res> {
  __$$_TopPageStateCopyWithImpl(
      _$_TopPageState _value, $Res Function(_$_TopPageState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageIndex = null,
    Object? colorTheme = null,
    Object? chartTheme = null,
    Object? currencyValue = null,
  }) {
    return _then(_$_TopPageState(
      pageIndex: null == pageIndex
          ? _value.pageIndex
          : pageIndex // ignore: cast_nullable_to_non_nullable
              as int,
      colorTheme: null == colorTheme
          ? _value.colorTheme
          : colorTheme // ignore: cast_nullable_to_non_nullable
              as ColorIndexEnum,
      chartTheme: null == chartTheme
          ? _value.chartTheme
          : chartTheme // ignore: cast_nullable_to_non_nullable
              as ChartThemeEnum,
      currencyValue: null == currencyValue
          ? _value.currencyValue
          : currencyValue // ignore: cast_nullable_to_non_nullable
              as CurrencyValue,
    ));
  }
}

/// @nodoc

class _$_TopPageState implements _TopPageState {
  const _$_TopPageState(
      {this.pageIndex = 0,
      this.colorTheme = ColorIndexEnum.normal,
      this.chartTheme = ChartThemeEnum.heatMap,
      this.currencyValue = CurrencyValue.usd});

  @override
  @JsonKey()
  final int pageIndex;
  @override
  @JsonKey()
  final ColorIndexEnum colorTheme;
  @override
  @JsonKey()
  final ChartThemeEnum chartTheme;
  @override
  @JsonKey()
  final CurrencyValue currencyValue;

  @override
  String toString() {
    return 'TopPageState(pageIndex: $pageIndex, colorTheme: $colorTheme, chartTheme: $chartTheme, currencyValue: $currencyValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TopPageState &&
            (identical(other.pageIndex, pageIndex) ||
                other.pageIndex == pageIndex) &&
            (identical(other.colorTheme, colorTheme) ||
                other.colorTheme == colorTheme) &&
            (identical(other.chartTheme, chartTheme) ||
                other.chartTheme == chartTheme) &&
            (identical(other.currencyValue, currencyValue) ||
                other.currencyValue == currencyValue));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, pageIndex, colorTheme, chartTheme, currencyValue);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TopPageStateCopyWith<_$_TopPageState> get copyWith =>
      __$$_TopPageStateCopyWithImpl<_$_TopPageState>(this, _$identity);
}

abstract class _TopPageState implements TopPageState {
  const factory _TopPageState(
      {final int pageIndex,
      final ColorIndexEnum colorTheme,
      final ChartThemeEnum chartTheme,
      final CurrencyValue currencyValue}) = _$_TopPageState;

  @override
  int get pageIndex;
  @override
  ColorIndexEnum get colorTheme;
  @override
  ChartThemeEnum get chartTheme;
  @override
  CurrencyValue get currencyValue;
  @override
  @JsonKey(ignore: true)
  _$$_TopPageStateCopyWith<_$_TopPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
