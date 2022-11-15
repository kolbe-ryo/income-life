import 'package:flutter/material.dart';
import 'package:income_life/data/model/gsheets_model.dart';
import 'package:income_life/enum/currency_value.dart';
import 'package:income_life/enum/stock_information_attribute_enum.dart';

class StockInformationCard extends StatelessWidget {
  const StockInformationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        child: Row(
          children: const [
            _UnitInformation(StockInformationAttribute.name),
            _UnitInformation(StockInformationAttribute.price),
            _UnitInformation(StockInformationAttribute.devidend),
          ],
        ),
      ),
    );
  }
}

class _UnitInformation extends StatelessWidget {
  const _UnitInformation(this.attribute);

  final StockInformationAttribute attribute;

  @override
  Widget build(BuildContext context) {
    final info = const GsheetsModel(
      market: CurrencyValue.usd,
      ticker: 'TSLA',
      name: 'Tesla',
      price: 190.59,
      devidend: 0.0012,
    );
    return Container();
  }
}
