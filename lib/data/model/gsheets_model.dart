// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import '../../enum/currency_value.dart';

part 'gsheets_model.freezed.dart';

@freezed
class GsheetsModel with _$GsheetsModel {
  const factory GsheetsModel({
    @Default(CurrencyValue.non) CurrencyValue market,
    @Default('') String ticker,
    @Default('') String name,
    @Default(0) double price,
    @Default(0) double devidend,
    @Default(false) bool isAddedPortfolio,
    @Default(0) int totalStocks,
    @Default(0) double exchangeRate,
  }) = _GsheetsModel;

  const GsheetsModel._();

  String get dividendRate => '${(devidend * 100).toStringAsFixed(2)}%';

  double get income =>
      market == CurrencyValue.jpy ? totalStocks * price * devidend : totalStocks * price * devidend * exchangeRate;

  double get totalInvestment => market == CurrencyValue.jpy ? totalStocks * price : totalStocks * price * exchangeRate;
}
