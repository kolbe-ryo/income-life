// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gsheets_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GsheetsModel _$$_GsheetsModelFromJson(Map<String, dynamic> json) =>
    _$_GsheetsModel(
      market: $enumDecodeNullable(_$CurrencyValueEnumMap, json['market']) ??
          CurrencyValue.usd,
      ticker: json['ticker'] as String? ?? '',
      name: json['name'] as String? ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0,
      devidend: (json['devidend'] as num?)?.toDouble() ?? 0,
      isAddedPortfolio: json['isAddedPortfolio'] as bool? ?? false,
      totalStocks: json['totalStocks'] as int? ?? 0,
      exchangeRate: (json['exchangeRate'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$$_GsheetsModelToJson(_$_GsheetsModel instance) =>
    <String, dynamic>{
      'market': _$CurrencyValueEnumMap[instance.market]!,
      'ticker': instance.ticker,
      'name': instance.name,
      'price': instance.price,
      'devidend': instance.devidend,
      'isAddedPortfolio': instance.isAddedPortfolio,
      'totalStocks': instance.totalStocks,
      'exchangeRate': instance.exchangeRate,
    };

const _$CurrencyValueEnumMap = {
  CurrencyValue.usd: 'usd',
  CurrencyValue.jpy: 'jpy',
};
