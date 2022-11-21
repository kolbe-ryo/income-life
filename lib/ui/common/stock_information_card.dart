// Flutter imports:
import 'package:flutter/material.dart';
import 'package:income_life/ui/common/app_colors.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import '../../data/model/gsheets_model.dart';
import '../../enum/stock_information_attribute_enum.dart';
import 'base_show_dialog.dart';
import 'constants.dart';
import '../global/stock_data_manager.dart';
import '../global/stock_data_state.dart';

class StockInformationCard extends StatelessWidget {
  const StockInformationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Card(
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kBorder),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(kBorder),
          onTap: () async {
            final index = context.read<int>();
            final ticker = context.read<StockDataState>().gsheets[index].ticker;
            final viewModel = context.read<StockDataManager>();
            final isAdded = await baseShowDialog(
              context: context,
              title: 'ポートフォリオに追加しますか',
              widget: Text(ticker),
            );
            if (isAdded ?? false) {
              viewModel.addPortfolio(index);
            }
            return;
          },
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
    final mediaWidth = context.select((MediaQueryData value) => value.size.width);
    final index = context.watch<int>();
    final gsheetsModel = context.select((StockDataState value) => value.gsheets[index]);
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
          children: _getWidgets(attribute: attribute, info: gsheetsModel),
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
            color: AppColors.teal,
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
