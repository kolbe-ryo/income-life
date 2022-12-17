// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import '../../enum/invest_information_enum.dart';
import '../../util/constants.dart';
import '../../util/text_formatter.dart';
import '../global/stock_data_state.dart';

class StockSummaryCard extends StatelessWidget {
  const StockSummaryCard(this.kinds, {super.key});

  final InvestInfoEnum kinds;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(kPadding / 2),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Change card inner layout whether stocks information or not
              if (kinds != InvestInfoEnum.stocks) kinds.icon,
              Column(
                crossAxisAlignment: kinds != InvestInfoEnum.stocks ? CrossAxisAlignment.end : CrossAxisAlignment.center,
                children: [
                  Text(
                    _title,
                    style: const TextStyle(
                      fontSize: kFontSize,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const SizedBox(height: kPadding / 2),
                  Text(
                    _content(context),
                    style: const TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  String get _title {
    switch (kinds) {
      case InvestInfoEnum.income:
        return 'Income / y';
      case InvestInfoEnum.totalInvest:
        return 'Total Investment';
      case InvestInfoEnum.stocks:
        return 'Stocks';
    }
  }

  String _content(BuildContext context) {
    final state = context.select((StockDataState value) => value);
    if (state.portfolioLength == 0) {
      return '-';
    }
    switch (kinds) {
      case InvestInfoEnum.income:
        return '¥ ${formatter.format(state.totalIncome.floor())}';
      case InvestInfoEnum.totalInvest:
        return '¥ ${formatter.format(state.totalAmount.floor())}';
      case InvestInfoEnum.stocks:
        return formatter.format(state.portfolioLength);
    }
  }
}
