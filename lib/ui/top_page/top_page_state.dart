import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:income_life/data/model/gsheets_model.dart';
part 'top_page_state.freezed.dart';

@freezed
class TopPageState with _$TopPageState {
  const factory TopPageState({
    @Default(<GsheetsModel>[]) List<GsheetsModel> gsheets,
    @Default(0) int pageIndex,
  }) = _TopPageState;
}
