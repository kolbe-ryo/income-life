// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'search_stock_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SearchStockPageState {
  AddedConditionEnum get condition => throw _privateConstructorUsedError;
  List<GsheetsModel> get searchedGsheets => throw _privateConstructorUsedError;
  bool get isSearching => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchStockPageStateCopyWith<SearchStockPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchStockPageStateCopyWith<$Res> {
  factory $SearchStockPageStateCopyWith(SearchStockPageState value,
          $Res Function(SearchStockPageState) then) =
      _$SearchStockPageStateCopyWithImpl<$Res, SearchStockPageState>;
  @useResult
  $Res call(
      {AddedConditionEnum condition,
      List<GsheetsModel> searchedGsheets,
      bool isSearching});
}

/// @nodoc
class _$SearchStockPageStateCopyWithImpl<$Res,
        $Val extends SearchStockPageState>
    implements $SearchStockPageStateCopyWith<$Res> {
  _$SearchStockPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? condition = null,
    Object? searchedGsheets = null,
    Object? isSearching = null,
  }) {
    return _then(_value.copyWith(
      condition: null == condition
          ? _value.condition
          : condition // ignore: cast_nullable_to_non_nullable
              as AddedConditionEnum,
      searchedGsheets: null == searchedGsheets
          ? _value.searchedGsheets
          : searchedGsheets // ignore: cast_nullable_to_non_nullable
              as List<GsheetsModel>,
      isSearching: null == isSearching
          ? _value.isSearching
          : isSearching // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SearchStockPageStateCopyWith<$Res>
    implements $SearchStockPageStateCopyWith<$Res> {
  factory _$$_SearchStockPageStateCopyWith(_$_SearchStockPageState value,
          $Res Function(_$_SearchStockPageState) then) =
      __$$_SearchStockPageStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AddedConditionEnum condition,
      List<GsheetsModel> searchedGsheets,
      bool isSearching});
}

/// @nodoc
class __$$_SearchStockPageStateCopyWithImpl<$Res>
    extends _$SearchStockPageStateCopyWithImpl<$Res, _$_SearchStockPageState>
    implements _$$_SearchStockPageStateCopyWith<$Res> {
  __$$_SearchStockPageStateCopyWithImpl(_$_SearchStockPageState _value,
      $Res Function(_$_SearchStockPageState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? condition = null,
    Object? searchedGsheets = null,
    Object? isSearching = null,
  }) {
    return _then(_$_SearchStockPageState(
      condition: null == condition
          ? _value.condition
          : condition // ignore: cast_nullable_to_non_nullable
              as AddedConditionEnum,
      searchedGsheets: null == searchedGsheets
          ? _value._searchedGsheets
          : searchedGsheets // ignore: cast_nullable_to_non_nullable
              as List<GsheetsModel>,
      isSearching: null == isSearching
          ? _value.isSearching
          : isSearching // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_SearchStockPageState extends _SearchStockPageState {
  const _$_SearchStockPageState(
      {this.condition = AddedConditionEnum.all,
      final List<GsheetsModel> searchedGsheets = const <GsheetsModel>[],
      this.isSearching = false})
      : _searchedGsheets = searchedGsheets,
        super._();

  @override
  @JsonKey()
  final AddedConditionEnum condition;
  final List<GsheetsModel> _searchedGsheets;
  @override
  @JsonKey()
  List<GsheetsModel> get searchedGsheets {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_searchedGsheets);
  }

  @override
  @JsonKey()
  final bool isSearching;

  @override
  String toString() {
    return 'SearchStockPageState(condition: $condition, searchedGsheets: $searchedGsheets, isSearching: $isSearching)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SearchStockPageState &&
            (identical(other.condition, condition) ||
                other.condition == condition) &&
            const DeepCollectionEquality()
                .equals(other._searchedGsheets, _searchedGsheets) &&
            (identical(other.isSearching, isSearching) ||
                other.isSearching == isSearching));
  }

  @override
  int get hashCode => Object.hash(runtimeType, condition,
      const DeepCollectionEquality().hash(_searchedGsheets), isSearching);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SearchStockPageStateCopyWith<_$_SearchStockPageState> get copyWith =>
      __$$_SearchStockPageStateCopyWithImpl<_$_SearchStockPageState>(
          this, _$identity);
}

abstract class _SearchStockPageState extends SearchStockPageState {
  const factory _SearchStockPageState(
      {final AddedConditionEnum condition,
      final List<GsheetsModel> searchedGsheets,
      final bool isSearching}) = _$_SearchStockPageState;
  const _SearchStockPageState._() : super._();

  @override
  AddedConditionEnum get condition;
  @override
  List<GsheetsModel> get searchedGsheets;
  @override
  bool get isSearching;
  @override
  @JsonKey(ignore: true)
  _$$_SearchStockPageStateCopyWith<_$_SearchStockPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
