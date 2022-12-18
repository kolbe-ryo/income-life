// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:income_life/enum/color_index_enum.dart';

part 'top_page_state.freezed.dart';

@freezed
class TopPageState with _$TopPageState {
  const factory TopPageState({
    @Default(0) int pageIndex,
    @Default(ColorIndexEnum.normal) ColorIndexEnum colorIndex,
  }) = _TopPageState;
}
