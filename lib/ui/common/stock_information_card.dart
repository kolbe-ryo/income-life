import 'package:flutter/material.dart';
import 'package:income_life/data/model/gsheets_model.dart';
import 'package:income_life/enum/currency_value.dart';
import 'package:income_life/enum/stock_information_attribute_enum.dart';
import 'package:income_life/ui/common/constants.dart';
import 'package:provider/provider.dart';

class StockInformationCard extends StatelessWidget {
  const StockInformationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Card(
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: () => null,
          child: Padding(
            padding: const EdgeInsets.all(kPadding / 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                _UnitInformation(StockInformationAttribute.name),
                _UnitInformation(StockInformationAttribute.price),
                _UnitInformation(StockInformationAttribute.devidend),
              ],
            ),
          ),
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
    const info = GsheetsModel(
      market: CurrencyValue.usd,
      ticker: 'TSLA',
      name: 'Tesla',
      price: 190.59,
      devidend: 0.0012,
    );

    final mediaWidth = context.select((MediaQueryData value) => value.size.width);

    return DefaultTextStyle(
      style: const TextStyle(
        fontSize: 22,
        overflow: TextOverflow.ellipsis,
      ),
      child: SizedBox(
        width: (mediaWidth - kPadding * 3) / 3,
        height: 58,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: _getWidgets(attribute: attribute, info: info),
        ),
      ),
    );
  }

  List<Widget> _getWidgets({
    required StockInformationAttribute attribute,
    required GsheetsModel info,
  }) {
    switch (attribute) {
      case StockInformationAttribute.name:
        return [
          Container(
            color: const Color.fromARGB(255, 167, 203, 125),
            padding: const EdgeInsets.all(2),
            child: Text(
              info.ticker,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(info.name),
          ),
        ];
      case StockInformationAttribute.price:
        return [
          const Text(
            'Price',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 16,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text('${info.price}'),
          ),
        ];
      case StockInformationAttribute.devidend:
        return [
          const Text(
            'Devidend',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 16,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text('${info.devidend * 100}%'),
          ),
        ];
    }
  }
}
