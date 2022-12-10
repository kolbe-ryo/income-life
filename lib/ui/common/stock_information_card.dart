// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:income_life/ui/common/custom_text_field.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import '../../data/model/gsheets_model.dart';
import '../../enum/stock_information_attribute_enum.dart';
import '../global/stock_data_manager.dart';
import 'app_colors.dart';
import 'base_card.dart';
import 'base_show_dialog.dart';
import 'constants.dart';

class StockInformationCard extends BaseCard {
  const StockInformationCard({super.key}) : super();

  @override
  Widget? innerTextWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: const [
        _UnitInformation(StockInformationAttribute.name),
        _UnitInformation(StockInformationAttribute.price),
        _UnitInformation(StockInformationAttribute.devidend),
      ],
    );
  }

  @override
  void Function()? onTap(BuildContext context) {
    return () async {
      final model = context.read<GsheetsModel>();
      final viewModel = context.read<StockDataManager>();
      void inputMethod(int stocks) => viewModel.inputNumverOfStock(stocks);
      final formKey = GlobalKey<FormState>();
      final isAdded = await baseShowDialog(
        context: context,
        title: 'Add Your Portfolio?',
        formKey: formKey,
        widget: MultiProvider(
          providers: [
            Provider.value(value: inputMethod),
            Provider.value(value: formKey),
          ],
          child: Padding(
            padding: const EdgeInsets.only(top: kPadding / 2, left: kPadding),
            child: DefaultTextStyle(
              style: const TextStyle(fontSize: kFontSize),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Text('Ticker :'),
                      Expanded(
                        child: Text(
                          model.ticker,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: kPadding / 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Text('Stocks :'),
                      Expanded(
                        child: DigitsTextField(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
      if (isAdded ?? false) {
        viewModel.addPortfolio(model);
      }
    };
  }
}

class _UnitInformation extends StatelessWidget {
  const _UnitInformation(this.attribute);

  final StockInformationAttribute attribute;

  @override
  Widget build(BuildContext context) {
    final mediaWidth = context.select((MediaQueryData value) => value.size.width);
    final model = context.watch<GsheetsModel>();
    return DefaultTextStyle(
      style: const TextStyle(
        fontSize: 22,
        overflow: TextOverflow.ellipsis,
      ),
      child: SizedBox(
        width: (mediaWidth - kPadding * 3) / 3,
        height: 64,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: _getWidgets(attribute: attribute, info: model),
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
            color: info.isAddedPortfolio ? AppColors.deepOrangeAccent : AppColors.teal,
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
              color: AppColors.grey,
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
              color: AppColors.grey,
              fontSize: 16,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(info.dividendRate),
          ),
        ];
    }
  }
}
