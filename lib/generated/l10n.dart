// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Ticker:`
  String get tickerName {
    return Intl.message(
      'Ticker:',
      name: 'tickerName',
      desc: '',
      args: [],
    );
  }

  /// `Total:`
  String get totalStocks {
    return Intl.message(
      'Total:',
      name: 'totalStocks',
      desc: '',
      args: [],
    );
  }

  /// `Adding:`
  String get adding {
    return Intl.message(
      'Adding:',
      name: 'adding',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get ok {
    return Intl.message(
      'OK',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Close`
  String get close {
    return Intl.message(
      'Close',
      name: 'close',
      desc: '',
      args: [],
    );
  }

  /// `Ex）10`
  String get example {
    return Intl.message(
      'Ex）10',
      name: 'example',
      desc: '',
      args: [],
    );
  }

  /// `Please enter some text`
  String get alertTextNotEmpty {
    return Intl.message(
      'Please enter some text',
      name: 'alertTextNotEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Please enter 1 or more`
  String get alertTextNoQuantity {
    return Intl.message(
      'Please enter 1 or more',
      name: 'alertTextNoQuantity',
      desc: '',
      args: [],
    );
  }

  /// `Add Your Portfolio?`
  String get checkAdding {
    return Intl.message(
      'Add Your Portfolio?',
      name: 'checkAdding',
      desc: '',
      args: [],
    );
  }

  /// `Price`
  String get price {
    return Intl.message(
      'Price',
      name: 'price',
      desc: '',
      args: [],
    );
  }

  /// `Devidend`
  String get devidend {
    return Intl.message(
      'Devidend',
      name: 'devidend',
      desc: '',
      args: [],
    );
  }

  /// `Income`
  String get income {
    return Intl.message(
      'Income',
      name: 'income',
      desc: '',
      args: [],
    );
  }

  /// `Income per year`
  String get incomePerYear {
    return Intl.message(
      'Income per year',
      name: 'incomePerYear',
      desc: '',
      args: [],
    );
  }

  /// `Total Investment`
  String get totalInvestment {
    return Intl.message(
      'Total Investment',
      name: 'totalInvestment',
      desc: '',
      args: [],
    );
  }

  /// `Stocks`
  String get stocks {
    return Intl.message(
      'Stocks',
      name: 'stocks',
      desc: '',
      args: [],
    );
  }

  /// `No Data`
  String get noData {
    return Intl.message(
      'No Data',
      name: 'noData',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to delete?`
  String get checkDelete {
    return Intl.message(
      'Do you want to delete?',
      name: 'checkDelete',
      desc: '',
      args: [],
    );
  }

  /// `Complete to delete`
  String get completeDelete {
    return Intl.message(
      'Complete to delete',
      name: 'completeDelete',
      desc: '',
      args: [],
    );
  }

  /// `This operation cannot be undone`
  String get checkCannotUndone {
    return Intl.message(
      'This operation cannot be undone',
      name: 'checkCannotUndone',
      desc: '',
      args: [],
    );
  }

  /// `Others`
  String get others {
    return Intl.message(
      'Others',
      name: 'others',
      desc: '',
      args: [],
    );
  }

  /// `Theme Setting`
  String get themeSetting {
    return Intl.message(
      'Theme Setting',
      name: 'themeSetting',
      desc: '',
      args: [],
    );
  }

  /// `Color Theme`
  String get colorTheme {
    return Intl.message(
      'Color Theme',
      name: 'colorTheme',
      desc: '',
      args: [],
    );
  }

  /// `Chart Theme`
  String get chartTheme {
    return Intl.message(
      'Chart Theme',
      name: 'chartTheme',
      desc: '',
      args: [],
    );
  }

  /// `Request`
  String get request {
    return Intl.message(
      'Request',
      name: 'request',
      desc: '',
      args: [],
    );
  }

  /// `Request Ticker`
  String get requestTicker {
    return Intl.message(
      'Request Ticker',
      name: 'requestTicker',
      desc: '',
      args: [],
    );
  }

  /// `Please input the ticker you want to add and push send button.\nSome tickers cannot be added`
  String get descriptionForRequest {
    return Intl.message(
      'Please input the ticker you want to add and push send button.\nSome tickers cannot be added',
      name: 'descriptionForRequest',
      desc: '',
      args: [],
    );
  }

  /// `Complete`
  String get complete {
    return Intl.message(
      'Complete',
      name: 'complete',
      desc: '',
      args: [],
    );
  }

  /// `Failed to send. Try again later`
  String get tryAgain {
    return Intl.message(
      'Failed to send. Try again later',
      name: 'tryAgain',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get send {
    return Intl.message(
      'Send',
      name: 'send',
      desc: '',
      args: [],
    );
  }

  /// `About This App`
  String get aboutThisApp {
    return Intl.message(
      'About This App',
      name: 'aboutThisApp',
      desc: '',
      args: [],
    );
  }

  /// `Licenses`
  String get licenses {
    return Intl.message(
      'Licenses',
      name: 'licenses',
      desc: '',
      args: [],
    );
  }

  /// `Request to add stock`
  String get requestToAddStock {
    return Intl.message(
      'Request to add stock',
      name: 'requestToAddStock',
      desc: '',
      args: [],
    );
  }

  /// `Reset`
  String get reset {
    return Intl.message(
      'Reset',
      name: 'reset',
      desc: '',
      args: [],
    );
  }

  /// `Yahoo Finance`
  String get yahooFinance {
    return Intl.message(
      'Yahoo Finance',
      name: 'yahooFinance',
      desc: '',
      args: [],
    );
  }

  /// `Reset All Your Portfolio?`
  String get checkResetAll {
    return Intl.message(
      'Reset All Your Portfolio?',
      name: 'checkResetAll',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `¥`
  String get jpy {
    return Intl.message(
      '¥',
      name: 'jpy',
      desc: '',
      args: [],
    );
  }

  /// `$`
  String get usd {
    return Intl.message(
      '\$',
      name: 'usd',
      desc: '',
      args: [],
    );
  }

  /// `Currency`
  String get currency {
    return Intl.message(
      'Currency',
      name: 'currency',
      desc: '',
      args: [],
    );
  }

  /// `ex) XOM`
  String get requestPlaceholder {
    return Intl.message(
      'ex) XOM',
      name: 'requestPlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `Complete to add`
  String get completeAddition {
    return Intl.message(
      'Complete to add',
      name: 'completeAddition',
      desc: '',
      args: [],
    );
  }

  /// `Normal`
  String get normal {
    return Intl.message(
      'Normal',
      name: 'normal',
      desc: '',
      args: [],
    );
  }

  /// `Souring`
  String get souring {
    return Intl.message(
      'Souring',
      name: 'souring',
      desc: '',
      args: [],
    );
  }

  /// `Crach`
  String get crach {
    return Intl.message(
      'Crach',
      name: 'crach',
      desc: '',
      args: [],
    );
  }

  /// `Heat Map`
  String get heatMap {
    return Intl.message(
      'Heat Map',
      name: 'heatMap',
      desc: '',
      args: [],
    );
  }

  /// `Pie Chart`
  String get pieChart {
    return Intl.message(
      'Pie Chart',
      name: 'pieChart',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ja'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
