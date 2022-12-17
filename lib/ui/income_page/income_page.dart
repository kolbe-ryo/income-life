// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../../enum/invest_information_enum.dart';
import '../common/constants.dart';
import '../common/stock_summary_card.dart';
import 'income_heat_map.dart';

class IncomePage extends StatelessWidget {
  const IncomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(kPadding, kPadding * 2, kPadding, 0),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: SizedBox(
                height: constraints.maxHeight,
                child: Column(
                  children: [
                    const IncomeHeatMap(),
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
    );
  }
}
