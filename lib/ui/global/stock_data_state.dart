// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import '../../data/model/gsheets_model.dart';

part 'stock_data_state.freezed.dart';

@freezed
class StockDataState with _$StockDataState {
  const factory StockDataState({
    @Default(<GsheetsModel>[]) List<GsheetsModel> gsheets,
    @Default(0) int currentAddingStocks,
    @Default(false) bool isCompleteFetch,
  }) = _StockDataState;

  const StockDataState._();

  int get length => gsheets.length;

  int get portfolioLength => gsheets.where((e) => e.isAddedPortfolio).length;

  double get totalIncomeUsd => gsheets
      .where(
        (e) => e.isAddedPortfolio,
      )
      .map(
        (e) => e.incomeUsd,
      )
      .toList()
      .reduce(
        (a, b) => a + b,
      );

  double get totalIncomeJpy => gsheets
      .where(
        (e) => e.isAddedPortfolio,
      )
      .map(
        (e) => e.incomeJpy,
      )
      .toList()
      .reduce(
        (a, b) => a + b,
      );

  double get totalAmountUsd => gsheets
      .where(
        (e) => e.isAddedPortfolio,
      )
      .map(
        (e) => e.totalInvestmentUsd,
      )
      .toList()
      .reduce(
        (a, b) => a + b,
      );

  double get totalAmountJpy => gsheets
      .where(
        (e) => e.isAddedPortfolio,
      )
      .map(
        (e) => e.totalInvestmentJpy,
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
      (a, b) => -a.incomeUsd.compareTo(b.incomeUsd),
    );

  List<GsheetsModel> get notPortfolio => gsheets
      .where(
        (e) => !e.isAddedPortfolio,
      )
      .toList();
}
