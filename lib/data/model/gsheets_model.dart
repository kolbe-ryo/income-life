import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:income_life/enum/currency_value.dart';

part 'gsheets_model.freezed.dart';

@freezed
class GsheetsModel with _$GsheetsModel {
  const factory GsheetsModel({
    @Default(CurrencyValue.non) CurrencyValue market,
    @Default('') String ticker,
    @Default('') String name,
    @Default(0) double price,
    @Default(0) double devidend,
  }) = _GsheetsModel;
}
