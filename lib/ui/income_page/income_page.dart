// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:income_life/enum/invest_information_enum.dart';
import 'package:income_life/ui/common/constants.dart';
import 'package:income_life/ui/global/stock_data_manager.dart';
import 'package:income_life/ui/income_page/income_heat_map.dart';
import 'package:income_life/ui/income_page/income_page_state.dart';
import 'package:income_life/ui/income_page/income_page_view_model.dart';
import 'package:income_life/util/text_formatter.dart';
import 'package:provider/provider.dart';

class IncomePage extends StatelessWidget {
  const IncomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return StateNotifierProvider<IncomePageViewModel, IncomePageState>(
      create: (context) => IncomePageViewModel(),
      builder: (context, _) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.fromLTRB(kPadding, kPadding * 2, kPadding, 0),
            child: Column(
              children: [
                const IncomeHeatMap(),
                const SizedBox(height: kPadding),
                Row(
                  children: const [
                    Expanded(
                      child: _InvestSummaryCard(InvestInfoEnum.income),
                    ),
                    SizedBox(width: kPadding / 2),
                    _InvestSummaryCard(InvestInfoEnum.stocks),
                  ],
                ),
                const SizedBox(height: kPadding / 2),
                const _InvestSummaryCard(InvestInfoEnum.totalInvest),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _InvestSummaryCard extends StatelessWidget {
  const _InvestSummaryCard(this.kinds);

  final InvestInfoEnum kinds;

  @override
  Widget build(BuildContext context) {
    return Card(
      // color: model.color,
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(kPadding),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
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
        return 'Income';
      case InvestInfoEnum.totalInvest:
        return 'Total Investment';
      case InvestInfoEnum.stocks:
        return 'Stocks';
    }
  }

  String _content(BuildContext context) {
    final stockDataManager = context.read<StockDataManager>().info;
    switch (kinds) {
      case InvestInfoEnum.income:
        return '¥ ${formatter.format(stockDataManager.totalIncome.floor())}';
      case InvestInfoEnum.totalInvest:
        return '¥ ${formatter.format(stockDataManager.totalAmount.floor())}';
      case InvestInfoEnum.stocks:
        return formatter.format(stockDataManager.length);
    }
  }
}
