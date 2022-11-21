// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'income_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$IncomePageState {
  List<GsheetsModel> get sortedGsheets => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $IncomePageStateCopyWith<IncomePageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IncomePageStateCopyWith<$Res> {
  factory $IncomePageStateCopyWith(
          IncomePageState value, $Res Function(IncomePageState) then) =
      _$IncomePageStateCopyWithImpl<$Res, IncomePageState>;
  @useResult
  $Res call({List<GsheetsModel> sortedGsheets});
}

/// @nodoc
class _$IncomePageStateCopyWithImpl<$Res, $Val extends IncomePageState>
    implements $IncomePageStateCopyWith<$Res> {
  _$IncomePageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sortedGsheets = null,
  }) {
    return _then(_value.copyWith(
      sortedGsheets: null == sortedGsheets
          ? _value.sortedGsheets
          : sortedGsheets // ignore: cast_nullable_to_non_nullable
              as List<GsheetsModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_IncomePageStateCopyWith<$Res>
    implements $IncomePageStateCopyWith<$Res> {
  factory _$$_IncomePageStateCopyWith(
          _$_IncomePageState value, $Res Function(_$_IncomePageState) then) =
      __$$_IncomePageStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<GsheetsModel> sortedGsheets});
}

/// @nodoc
class __$$_IncomePageStateCopyWithImpl<$Res>
    extends _$IncomePageStateCopyWithImpl<$Res, _$_IncomePageState>
    implements _$$_IncomePageStateCopyWith<$Res> {
  __$$_IncomePageStateCopyWithImpl(
      _$_IncomePageState _value, $Res Function(_$_IncomePageState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sortedGsheets = null,
  }) {
    return _then(_$_IncomePageState(
      sortedGsheets: null == sortedGsheets
          ? _value._sortedGsheets
          : sortedGsheets // ignore: cast_nullable_to_non_nullable
              as List<GsheetsModel>,
    ));
  }
}

/// @nodoc

class _$_IncomePageState extends _IncomePageState {
  const _$_IncomePageState(
      {final List<GsheetsModel> sortedGsheets = const <GsheetsModel>[]})
      : _sortedGsheets = sortedGsheets,
        super._();

  final List<GsheetsModel> _sortedGsheets;
  @override
  @JsonKey()
  List<GsheetsModel> get sortedGsheets {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sortedGsheets);
  }

  @override
  String toString() {
    return 'IncomePageState(sortedGsheets: $sortedGsheets)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_IncomePageState &&
            const DeepCollectionEquality()
                .equals(other._sortedGsheets, _sortedGsheets));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_sortedGsheets));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_IncomePageStateCopyWith<_$_IncomePageState> get copyWith =>
      __$$_IncomePageStateCopyWithImpl<_$_IncomePageState>(this, _$identity);
}

abstract class _IncomePageState extends IncomePageState {
  const factory _IncomePageState({final List<GsheetsModel> sortedGsheets}) =
      _$_IncomePageState;
  const _IncomePageState._() : super._();

  @override
  List<GsheetsModel> get sortedGsheets;
  @override
  @JsonKey(ignore: true)
  _$$_IncomePageStateCopyWith<_$_IncomePageState> get copyWith =>
      throw _privateConstructorUsedError;
}
