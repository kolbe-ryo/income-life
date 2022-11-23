// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'heat_map_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HeatMapModel {
  int get mainAxisSize => throw _privateConstructorUsedError;
  int get crossAxisSize => throw _privateConstructorUsedError;
  Color get color => throw _privateConstructorUsedError;
  GsheetsModel get model => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HeatMapModelCopyWith<HeatMapModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HeatMapModelCopyWith<$Res> {
  factory $HeatMapModelCopyWith(
          HeatMapModel value, $Res Function(HeatMapModel) then) =
      _$HeatMapModelCopyWithImpl<$Res, HeatMapModel>;
  @useResult
  $Res call(
      {int mainAxisSize, int crossAxisSize, Color color, GsheetsModel model});

  $GsheetsModelCopyWith<$Res> get model;
}

/// @nodoc
class _$HeatMapModelCopyWithImpl<$Res, $Val extends HeatMapModel>
    implements $HeatMapModelCopyWith<$Res> {
  _$HeatMapModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mainAxisSize = null,
    Object? crossAxisSize = null,
    Object? color = null,
    Object? model = null,
  }) {
    return _then(_value.copyWith(
      mainAxisSize: null == mainAxisSize
          ? _value.mainAxisSize
          : mainAxisSize // ignore: cast_nullable_to_non_nullable
              as int,
      crossAxisSize: null == crossAxisSize
          ? _value.crossAxisSize
          : crossAxisSize // ignore: cast_nullable_to_non_nullable
              as int,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as GsheetsModel,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $GsheetsModelCopyWith<$Res> get model {
    return $GsheetsModelCopyWith<$Res>(_value.model, (value) {
      return _then(_value.copyWith(model: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_HeatMapModelCopyWith<$Res>
    implements $HeatMapModelCopyWith<$Res> {
  factory _$$_HeatMapModelCopyWith(
          _$_HeatMapModel value, $Res Function(_$_HeatMapModel) then) =
      __$$_HeatMapModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int mainAxisSize, int crossAxisSize, Color color, GsheetsModel model});

  @override
  $GsheetsModelCopyWith<$Res> get model;
}

/// @nodoc
class __$$_HeatMapModelCopyWithImpl<$Res>
    extends _$HeatMapModelCopyWithImpl<$Res, _$_HeatMapModel>
    implements _$$_HeatMapModelCopyWith<$Res> {
  __$$_HeatMapModelCopyWithImpl(
      _$_HeatMapModel _value, $Res Function(_$_HeatMapModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mainAxisSize = null,
    Object? crossAxisSize = null,
    Object? color = null,
    Object? model = null,
  }) {
    return _then(_$_HeatMapModel(
      mainAxisSize: null == mainAxisSize
          ? _value.mainAxisSize
          : mainAxisSize // ignore: cast_nullable_to_non_nullable
              as int,
      crossAxisSize: null == crossAxisSize
          ? _value.crossAxisSize
          : crossAxisSize // ignore: cast_nullable_to_non_nullable
              as int,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as GsheetsModel,
    ));
  }
}

/// @nodoc

class _$_HeatMapModel implements _HeatMapModel {
  const _$_HeatMapModel(
      {this.mainAxisSize = 0,
      this.crossAxisSize = 0,
      this.color = Colors.white,
      this.model = const GsheetsModel()});

  @override
  @JsonKey()
  final int mainAxisSize;
  @override
  @JsonKey()
  final int crossAxisSize;
  @override
  @JsonKey()
  final Color color;
  @override
  @JsonKey()
  final GsheetsModel model;

  @override
  String toString() {
    return 'HeatMapModel(mainAxisSize: $mainAxisSize, crossAxisSize: $crossAxisSize, color: $color, model: $model)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HeatMapModel &&
            (identical(other.mainAxisSize, mainAxisSize) ||
                other.mainAxisSize == mainAxisSize) &&
            (identical(other.crossAxisSize, crossAxisSize) ||
                other.crossAxisSize == crossAxisSize) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.model, model) || other.model == model));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, mainAxisSize, crossAxisSize, color, model);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HeatMapModelCopyWith<_$_HeatMapModel> get copyWith =>
      __$$_HeatMapModelCopyWithImpl<_$_HeatMapModel>(this, _$identity);
}

abstract class _HeatMapModel implements HeatMapModel {
  const factory _HeatMapModel(
      {final int mainAxisSize,
      final int crossAxisSize,
      final Color color,
      final GsheetsModel model}) = _$_HeatMapModel;

  @override
  int get mainAxisSize;
  @override
  int get crossAxisSize;
  @override
  Color get color;
  @override
  GsheetsModel get model;
  @override
  @JsonKey(ignore: true)
  _$$_HeatMapModelCopyWith<_$_HeatMapModel> get copyWith =>
      throw _privateConstructorUsedError;
}
