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
  List<GsheetsModel> get gsheets => throw _privateConstructorUsedError;
  int get pageIndex => throw _privateConstructorUsedError;

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
  $Res call({List<GsheetsModel> gsheets, int pageIndex});
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
    Object? gsheets = null,
    Object? pageIndex = null,
  }) {
    return _then(_value.copyWith(
      gsheets: null == gsheets
          ? _value.gsheets
          : gsheets // ignore: cast_nullable_to_non_nullable
              as List<GsheetsModel>,
      pageIndex: null == pageIndex
          ? _value.pageIndex
          : pageIndex // ignore: cast_nullable_to_non_nullable
              as int,
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
  $Res call({List<GsheetsModel> gsheets, int pageIndex});
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
    Object? gsheets = null,
    Object? pageIndex = null,
  }) {
    return _then(_$_TopPageState(
      gsheets: null == gsheets
          ? _value._gsheets
          : gsheets // ignore: cast_nullable_to_non_nullable
              as List<GsheetsModel>,
      pageIndex: null == pageIndex
          ? _value.pageIndex
          : pageIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_TopPageState implements _TopPageState {
  const _$_TopPageState(
      {final List<GsheetsModel> gsheets = const <GsheetsModel>[],
      this.pageIndex = 0})
      : _gsheets = gsheets;

  final List<GsheetsModel> _gsheets;
  @override
  @JsonKey()
  List<GsheetsModel> get gsheets {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_gsheets);
  }

  @override
  @JsonKey()
  final int pageIndex;

  @override
  String toString() {
    return 'TopPageState(gsheets: $gsheets, pageIndex: $pageIndex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TopPageState &&
            const DeepCollectionEquality().equals(other._gsheets, _gsheets) &&
            (identical(other.pageIndex, pageIndex) ||
                other.pageIndex == pageIndex));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_gsheets), pageIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TopPageStateCopyWith<_$_TopPageState> get copyWith =>
      __$$_TopPageStateCopyWithImpl<_$_TopPageState>(this, _$identity);
}

abstract class _TopPageState implements TopPageState {
  const factory _TopPageState(
      {final List<GsheetsModel> gsheets,
      final int pageIndex}) = _$_TopPageState;

  @override
  List<GsheetsModel> get gsheets;
  @override
  int get pageIndex;
  @override
  @JsonKey(ignore: true)
  _$$_TopPageStateCopyWith<_$_TopPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
