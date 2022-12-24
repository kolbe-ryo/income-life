// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import '../../enum/chart_theme_enum.dart';
import '../../enum/invest_information_enum.dart';
import '../../util/constants.dart';
import '../common/stock_summary_card.dart';
import '../top_page/top_page_state.dart';
import 'income_heat_map.dart';
import 'income_pie_chart.dart';

class IncomePage extends StatelessWidget {
  const IncomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final chartTheme = context.select((TopPageState value) => value.chartTheme);
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.fromLTRB(kPadding, 0, kPadding, 0),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: SizedBox(
                  height: constraints.maxHeight,
                  child: Column(
                    children: [
                      if (chartTheme == ChartThemeEnum.heatMap) const IncomeHeatMap(),
                      if (chartTheme == ChartThemeEnum.pieChart) const IncomePieChart(),
                      const SizedBox(height: kPadding / 2),
                      Expanded(
                        child: Row(
                          children: const [
                            Expanded(
                              child: StockSummaryCard(InvestInfoEnum.income),
                            ),
                            SizedBox(width: kPadding / 2),
                            StockSummaryCard(InvestInfoEnum.stocks),
                          ],
                        ),
                      ),
                      const SizedBox(height: kPadding / 2),
                      const Expanded(
                        child: StockSummaryCard(InvestInfoEnum.totalInvest),
                      ),
                      const SizedBox(height: kPadding / 2),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
