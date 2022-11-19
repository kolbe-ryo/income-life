// Package imports:
import 'package:get_it/get_it.dart';
import 'package:state_notifier/state_notifier.dart';

// Project imports:
import '../../data/interface/gsheets_interface.dart';
import '../../data/model/gsheets_model.dart';
import '../../enum/currency_value.dart';
import 'stock_data_state.dart';

class StockDataManager extends StateNotifier<StockDataState> with LocatorMixin {
  StockDataManager([StockDataState state = const StockDataState()]) : super(state);

  StockDataState get info => state;

  @override
  void initState() {
    _fetchGsheets();
    _fetchFromLocal();
  }

  // fetch data from Gsheets and Local Repository
  Future<void> _fetchGsheets() async {
    // state = state.copyWith(gsheets: await GetIt.I<GsheetsInterface>().fetch());
    state = state.copyWith(gsheets: _testModels);
  }

  // Switch stock isAddedPortfolio and Save local storage
  void addPortfolio(int index) {
    final addedItem = state.gsheets[index].copyWith(isAddedPortfolio: true);
    final ticker = state.gsheets[index].ticker;
    state = state.copyWith(
      gsheets: state.gsheets
          .map(
            (item) => item.ticker == ticker ? addedItem : item,
          )
          .toList(),
    );
    _saveToLocal();
  }

  // Save to local storage
  void _fetchFromLocal() {}

  // Save to local storage
  void _saveToLocal() {}
}

final _testModels = [
  const GsheetsModel(
    market: CurrencyValue.usd,
    ticker: 'TSLA',
    name: 'Tesla',
    price: 190.59,
    devidend: 0.0012,
  ),
  const GsheetsModel(
    market: CurrencyValue.jpy,
    ticker: '4092T',
    name: '三菱重工',
    price: 4023,
    devidend: 0.014,
  ),
  const GsheetsModel(
    market: CurrencyValue.usd,
    ticker: 'ARCC',
    name: 'AresCapitalCorp',
    price: 19.09,
    devidend: 0.105,
  ),
  const GsheetsModel(
    market: CurrencyValue.usd,
    ticker: 'SPRD',
    name: 'HighDvidendIndex',
    price: 204.3,
    devidend: 0.0345,
  ),
  const GsheetsModel(
    market: CurrencyValue.usd,
    ticker: 'CRWD',
    name: 'CrowdStrike',
    price: 160.43,
    devidend: 0.0043,
  ),
  const GsheetsModel(
    market: CurrencyValue.usd,
    ticker: 'GOOG',
    name: 'Google',
    price: 100.21,
    devidend: 0.0023,
  ),
];
