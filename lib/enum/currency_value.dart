import 'package:freezed_annotation/freezed_annotation.dart';

enum CurrencyValue {
  @JsonValue('JP')
  jpy,
  @JsonValue('USA')
  usd,
  @JsonValue('')
  non,
}

extension CurrencyValueExt on CurrencyValue {
  String get symbol {
    switch (this) {
      case CurrencyValue.jpy:
        return '¥';
      case CurrencyValue.usd:
        return r'$';
      case CurrencyValue.non:
        return '';
    }
  }
}

CurrencyValue toEnum(String value) {
  switch (value) {
    case 'JP':
      return CurrencyValue.jpy;
    case 'USD':
      return CurrencyValue.usd;
    default:
      return CurrencyValue.non;
  }
}
