// Project imports:
import '../data/model/gsheets_model.dart';
import '../enum/currency_value.dart';

const double kPadding = 16;

const double kBorder = 10;

const double kFontSize = 16;

const double kCardHeight = 64;

const String aboutAppUrl =
    'https://peraichi.com/landing_pages/view/s8azs?_ga=2.234690526.1510206972.1657027608-546049198.1657027608';

const String yahooFinanceUrl = 'https://finance.yahoo.com/';

const testModels = [
  GsheetsModel(
    market: CurrencyValue.usd,
    ticker: 'TSLA',
    name: 'Tesla',
    price: 130.59,
    devidend: 0.0012,
    totalStocks: 20,
    exchangeRate: 141,
    isAddedPortfolio: false,
  ),
  GsheetsModel(
    market: CurrencyValue.jpy,
    ticker: '4092T',
    name: '三菱重工',
    price: 4023,
    devidend: 0.024,
    totalStocks: 100,
    exchangeRate: 141,
    isAddedPortfolio: false,
  ),
  GsheetsModel(
    market: CurrencyValue.usd,
    ticker: 'ARCC',
    name: 'AresCapitalCorp',
    price: 19.09,
    devidend: 0.105,
    totalStocks: 100,
    exchangeRate: 141,
    isAddedPortfolio: false,
  ),
  GsheetsModel(
    market: CurrencyValue.usd,
    ticker: 'SPRD',
    name: 'HighDvidendIndex',
    price: 40.3,
    devidend: 0.0345,
    totalStocks: 15,
    exchangeRate: 141,
    isAddedPortfolio: false,
  ),
  GsheetsModel(
    market: CurrencyValue.usd,
    ticker: 'CRWD',
    name: 'CrowdStrike',
    price: 120.43,
    devidend: 0.13,
    totalStocks: 10,
    exchangeRate: 141,
    isAddedPortfolio: false,
  ),
  GsheetsModel(
    market: CurrencyValue.usd,
    ticker: 'GOOG',
    name: 'Google',
    price: 100.21,
    devidend: 0.0023,
    totalStocks: 10,
    exchangeRate: 141,
    isAddedPortfolio: false,
  ),
  GsheetsModel(
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
