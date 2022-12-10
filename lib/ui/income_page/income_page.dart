// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import '../../enum/invest_information_enum.dart';
import '../../util/text_formatter.dart';
import '../common/constants.dart';
import '../global/stock_data_state.dart';
import 'income_heat_map.dart';

class IncomePage extends StatelessWidget {
  const IncomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(kPadding, kPadding * 2, kPadding, 0),
        child: SingleChildScrollView(
          child: SizedBox(
            height:
                context.select((MediaQueryData value) => value.size.height) - kBottomNavigationBarHeight - kPadding * 2,
            child: Column(
              children: [
                const IncomeHeatMap(),
                const SizedBox(height: kPadding),
                Expanded(
                  child: Row(
                    children: const [
                      Expanded(
                        child: _InvestSummaryCard(InvestInfoEnum.income),
                      ),
                      SizedBox(width: kPadding / 2),
                      _InvestSummaryCard(InvestInfoEnum.stocks),
                    ],
                  ),
                ),
                const SizedBox(height: kPadding / 2),
                const Expanded(
                  child: _InvestSummaryCard(InvestInfoEnum.totalInvest),
                ),
                const SizedBox(height: kPadding / 2),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _InvestSummaryCard extends StatelessWidget {
  const _InvestSummaryCard(this.kinds);

  final InvestInfoEnum kinds;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(kPadding),
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
                      fontSize: 30,
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
