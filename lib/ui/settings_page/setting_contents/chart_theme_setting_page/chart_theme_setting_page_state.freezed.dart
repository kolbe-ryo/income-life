// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'chart_theme_setting_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ChartThemeSettingPageState {
  ColorIndexEnum get colorTheme => throw _privateConstructorUsedError;
  ChartThemeEnum get chartTheme => throw _privateConstructorUsedError;
  CurrencyValue get currencyValue => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChartThemeSettingPageStateCopyWith<ChartThemeSettingPageState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChartThemeSettingPageStateCopyWith<$Res> {
  factory $ChartThemeSettingPageStateCopyWith(ChartThemeSettingPageState value,
          $Res Function(ChartThemeSettingPageState) then) =
      _$ChartThemeSettingPageStateCopyWithImpl<$Res,
          ChartThemeSettingPageState>;
  @useResult
  $Res call(
      {ColorIndexEnum colorTheme,
      ChartThemeEnum chartTheme,
      CurrencyValue currencyValue});
}

/// @nodoc
class _$ChartThemeSettingPageStateCopyWithImpl<$Res,
        $Val extends ChartThemeSettingPageState>
    implements $ChartThemeSettingPageStateCopyWith<$Res> {
  _$ChartThemeSettingPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? colorTheme = null,
    Object? chartTheme = null,
    Object? currencyValue = null,
  }) {
    return _then(_value.copyWith(
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
abstract class _$$_ChartThemeSettingPageStateCopyWith<$Res>
    implements $ChartThemeSettingPageStateCopyWith<$Res> {
  factory _$$_ChartThemeSettingPageStateCopyWith(
          _$_ChartThemeSettingPageState value,
          $Res Function(_$_ChartThemeSettingPageState) then) =
      __$$_ChartThemeSettingPageStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ColorIndexEnum colorTheme,
      ChartThemeEnum chartTheme,
      CurrencyValue currencyValue});
}

/// @nodoc
class __$$_ChartThemeSettingPageStateCopyWithImpl<$Res>
    extends _$ChartThemeSettingPageStateCopyWithImpl<$Res,
        _$_ChartThemeSettingPageState>
    implements _$$_ChartThemeSettingPageStateCopyWith<$Res> {
  __$$_ChartThemeSettingPageStateCopyWithImpl(
      _$_ChartThemeSettingPageState _value,
      $Res Function(_$_ChartThemeSettingPageState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? colorTheme = null,
    Object? chartTheme = null,
    Object? currencyValue = null,
  }) {
    return _then(_$_ChartThemeSettingPageState(
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

class _$_ChartThemeSettingPageState implements _ChartThemeSettingPageState {
  const _$_ChartThemeSettingPageState(
      {this.colorTheme = ColorIndexEnum.normal,
      this.chartTheme = ChartThemeEnum.heatMap,
      this.currencyValue = CurrencyValue.usd});

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
    return 'ChartThemeSettingPageState(colorTheme: $colorTheme, chartTheme: $chartTheme, currencyValue: $currencyValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChartThemeSettingPageState &&
            (identical(other.colorTheme, colorTheme) ||
                other.colorTheme == colorTheme) &&
            (identical(other.chartTheme, chartTheme) ||
                other.chartTheme == chartTheme) &&
            (identical(other.currencyValue, currencyValue) ||
                other.currencyValue == currencyValue));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, colorTheme, chartTheme, currencyValue);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChartThemeSettingPageStateCopyWith<_$_ChartThemeSettingPageState>
      get copyWith => __$$_ChartThemeSettingPageStateCopyWithImpl<
          _$_ChartThemeSettingPageState>(this, _$identity);
}

abstract class _ChartThemeSettingPageState
    implements ChartThemeSettingPageState {
  const factory _ChartThemeSettingPageState(
      {final ColorIndexEnum colorTheme,
      final ChartThemeEnum chartTheme,
      final CurrencyValue currencyValue}) = _$_ChartThemeSettingPageState;

  @override
  ColorIndexEnum get colorTheme;
  @override
  ChartThemeEnum get chartTheme;
  @override
  CurrencyValue get currencyValue;
  @override
  @JsonKey(ignore: true)
  _$$_ChartThemeSettingPageStateCopyWith<_$_ChartThemeSettingPageState>
      get copyWith => throw _privateConstructorUsedError;
}
