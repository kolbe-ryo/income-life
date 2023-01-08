// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get_it/get_it.dart';

// Project imports:
import '../generated/l10n.dart';

enum CurrencyValue {
  usd,
  jpy,
}

extension CurrencyValueExt on CurrencyValue {
  String get value {
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
