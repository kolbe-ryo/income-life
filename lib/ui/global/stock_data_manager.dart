// Package imports:
import 'package:get_it/get_it.dart';
import 'package:income_life/enum/added_condition_enum.dart';
import 'package:state_notifier/state_notifier.dart';

// Project imports:
import '../../data/interface/gsheets_interface.dart';
import '../../data/model/gsheets_model.dart';
import '../../enum/currency_value.dart';
import '../../util/logger.dart';
import 'stock_data_state.dart';

class StockDataManager extends StateNotifier<StockDataState> with LocatorMixin {
  StockDataManager([super.state = const StockDataState()]);

  StockDataState get info => state;

  @override
  void initState() {
    super.initState();
    _fetchGsheets();
    _fetchFromLocal();
  }

  // fetch data from Gsheets and Local Repository
  Future<void> _fetchGsheets() async {
    // state = state.copyWith(
    //   gsheets: await GetIt.I<GsheetsInterface>().fetch(),
    // );
    // logger.info(state);
    state = state.copyWith(gsheets: _testModels);
  }

  // Switch stock isAddedPortfolio and Save local storage
  void addPortfolio(GsheetsModel model) {
    final addedItem = model.copyWith(
      isAddedPortfolio: true,
      totalStocks: model.totalStocks + state.currentAddingStocks,
    );
    state = state.copyWith(
      gsheets: state.gsheets
          .map(
            (item) => item.ticker == model.ticker ? addedItem : item,
          )
          .toList(),
    );
    _saveToLocal();
  }

  // Switch stock isAddedPortfolio and Save local storage
  void deletePortfolio(GsheetsModel model) {
    final addedItem = model.copyWith(
      isAddedPortfolio: false,
      totalStocks: 0,
    );
    state = state.copyWith(
      gsheets: state.gsheets
          .map(
            (item) => item.ticker == model.ticker ? addedItem : item,
          )
          .toList(),
    );
    _saveToLocal();
  }

  // Save to local storage
  void _fetchFromLocal() {}

  // Save to local storage
  void _saveToLocal() {
    // ローカル保存はtickerとstock数だけでOK？
  }

  void inputNumverOfStock(int stocks) => state = state.copyWith(currentAddingStocks: stocks);

  List<GsheetsModel> selectGsheets({
    required StockDataState state,
    required AddedConditionEnum condition,
  }) {
    switch (condition) {
      case AddedConditionEnum.isAdded:
        return state.portfolio;
      case AddedConditionEnum.notAdded:
        return state.notPortfolio;
      case AddedConditionEnum.all:
        return state.gsheets;
    }
  }
}

final _testModels = [
  const GsheetsModel(
    market: CurrencyValue.usd,
    ticker: 'TSLA',
    name: 'Tesla',
    price: 130.59,
    devidend: 0.0012,
    totalStocks: 20,
    exchangeRate: 141,
    isAddedPortfolio: false,
  ),
  const GsheetsModel(
    market: CurrencyValue.jpy,
    ticker: '4092T',
    name: '三菱重工',
    price: 4023,
    devidend: 0.024,
    totalStocks: 100,
    exchangeRate: 141,
    isAddedPortfolio: false,
  ),
  const GsheetsModel(
    market: CurrencyValue.usd,
    ticker: 'ARCC',
    name: 'AresCapitalCorp',
    price: 19.09,
    devidend: 0.105,
    totalStocks: 100,
    exchangeRate: 141,
    isAddedPortfolio: false,
  ),
  const GsheetsModel(
    market: CurrencyValue.usd,
    ticker: 'SPRD',
    name: 'HighDvidendIndex',
    price: 40.3,
    devidend: 0.0345,
    totalStocks: 15,
    exchangeRate: 141,
    isAddedPortfolio: false,
  ),
  const GsheetsModel(
    market: CurrencyValue.usd,
    ticker: 'CRWD',
    name: 'CrowdStrike',
    price: 120.43,
    devidend: 0.13,
    totalStocks: 10,
    exchangeRate: 141,
    isAddedPortfolio: false,
  ),
  const GsheetsModel(
    market: CurrencyValue.usd,
    ticker: 'GOOG',
    name: 'Google',
    price: 100.21,
    devidend: 0.0023,
    totalStocks: 10,
    exchangeRate: 141,
    isAddedPortfolio: false,
  ),
  const GsheetsModel(
    market: CurrencyValue.usd,
    ticker: 'AMZN',
    name: 'Amazon',
    price: 99.80,
    devidend: 0.053,
    totalStocks: 20,
    exchangeRate: 141,
    isAddedPortfolio: false,
  ),
];
