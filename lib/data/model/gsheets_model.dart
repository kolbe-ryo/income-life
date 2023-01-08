// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import '../../enum/currency_value.dart';

part 'gsheets_model.freezed.dart';
part 'gsheets_model.g.dart';

@freezed
class GsheetsModel with _$GsheetsModel {
  const factory GsheetsModel({
    @Default(CurrencyValue.usd) CurrencyValue market,
    @Default('') String ticker,
    @Default('') String name,
    @Default(0) double price,
    @Default(0) double devidend,
    @Default(false) bool isAddedPortfolio,
    @Default(0) int totalStocks,
    @Default(0) double exchangeRate,
  }) = _GsheetsModel;

  const GsheetsModel._();

  factory GsheetsModel.fromJson(Map<String, dynamic> json) => _$GsheetsModelFromJson(json);

  String get dividendRate => '${(devidend * 100).toStringAsFixed(2)}%';

  double get incomeUsd =>
      market == CurrencyValue.jpy ? totalStocks * price * devidend / exchangeRate : totalStocks * price * devidend;

  double get incomeJpy =>
      market == CurrencyValue.jpy ? totalStocks * price * devidend : totalStocks * price * devidend * exchangeRate;

  double get totalInvestmentUsd =>
      market == CurrencyValue.jpy ? totalStocks * price / exchangeRate : totalStocks * price;

  double get totalInvestmentJpy =>
      market == CurrencyValue.jpy ? totalStocks * price : totalStocks * price * exchangeRate;
}
