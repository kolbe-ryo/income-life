import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:income_life/generated/l10n.dart';

enum CurrencyValue {
  usd,
  jpy,
}

extension CurrencyValueExt on CurrencyValue {
  String get symbol {
    final _context = GetIt.I<GlobalKey<NavigatorState>>().currentContext!;
    switch (this) {
      case CurrencyValue.usd:
        return S.of(_context).usd;
      case CurrencyValue.jpy:
        return S.of(_context).jpy;
    }
  }
}

CurrencyValue? toEnum(String value) {
  switch (value) {
    case 'USD':
      return CurrencyValue.usd;
    case 'JPY':
      return CurrencyValue.jpy;
  }
}
