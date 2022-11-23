// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import '../../data/model/gsheets_model.dart';

part 'stock_data_state.freezed.dart';

@freezed
class StockDataState with _$StockDataState {
  const factory StockDataState({
    @Default(<GsheetsModel>[]) List<GsheetsModel> gsheets,
  }) = _StockDataState;

  const StockDataState._();

  int get length => gsheets.length;

  int get portfolioLength => gsheets.where((e) => e.isAddedPortfolio).length;

  double get totalIncome => gsheets
      .where(
        (e) => e.isAddedPortfolio,
      )
      .map(
        (e) => e.income,
      )
      .toList()
      .reduce(
        (a, b) => a + b,
      );

  double get totalAmount => gsheets
      .where(
        (e) => e.isAddedPortfolio,
      )
      .map(
        (e) => e.totalInvestment,
      )
      .toList()
      .reduce(
        (a, b) => a + b,
      );

  List<GsheetsModel> get portfolio => gsheets
      .where(
        (e) => e.isAddedPortfolio,
      )
      .toList()
    ..sort(
      (a, b) => -a.income.compareTo(b.income),
    );

  List<GsheetsModel> get notPortfolio => gsheets
      .where(
        (e) => !e.isAddedPortfolio,
      )
      .toList();
}
