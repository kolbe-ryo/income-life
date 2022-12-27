// Flutter imports:
import 'package:flutter/material.dart';
import 'package:income_life/data/model/gsheets_model.dart';
import 'package:income_life/ui/common/base_show_dialog.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import '../../enum/invest_information_enum.dart';
import '../../util/constants.dart';
import '../../util/text_formatter.dart';
import '../global/stock_data_state.dart';

class StockSummaryCard extends StatelessWidget {
  const StockSummaryCard(this.kind, {super.key});

  final InvestInfoEnum kind;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      child: InkWell(
        onTap: () async => _summaryInformation(context: context, kind: kind),
        child: Padding(
          padding: const EdgeInsets.all(kPadding / 2),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Change card inner layout whether stocks information or not
                if (kind != InvestInfoEnum.stocks) kind.icon,
                Column(
                  crossAxisAlignment:
                      kind != InvestInfoEnum.stocks ? CrossAxisAlignment.end : CrossAxisAlignment.center,
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
      ),
    );
  }

  String get _title {
    switch (kind) {
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
    switch (kind) {
      case InvestInfoEnum.income:
        return '¥ ${formatter.format(state.totalIncome.floor())}';
      case InvestInfoEnum.totalInvest:
        return '¥ ${formatter.format(state.totalAmount.floor())}';
      case InvestInfoEnum.stocks:
        return formatter.format(state.portfolioLength);
    }
  }

  Future<void> _summaryInformation({
    required BuildContext context,
    required InvestInfoEnum kind,
  }) async {
    final portfolio = context.read<StockDataState>().portfolio;
    await baseShowDialog(
      context: context,
      title: _title,
      isOnlyClose: true,
      widget: _SummaryCardInformationDialog(
        portfolio: portfolio,
        kind: kind,
      ),
    );
  }
}

class _SummaryCardInformationDialog extends StatelessWidget {
  const _SummaryCardInformationDialog({
    required this.portfolio,
    required this.kind,
  });

  final List<GsheetsModel> portfolio;
  final InvestInfoEnum kind;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, kPadding * 2, 0, 0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: _response,
        ),
      ),
    );
  }

  List<Widget> get _response {
    switch (kind) {
      case InvestInfoEnum.income:
        return portfolio
            .map(
              (e) => _ListContents(
                ticker: e.ticker,
                content: '¥ ${formatter.format(e.income)}',
              ),
            )
            .toList();
      case InvestInfoEnum.totalInvest:
        return portfolio
            .map(
              (e) => _ListContents(
                ticker: e.ticker,
                content: '¥ ${formatter.format(e.totalInvestment)}',
              ),
            )
            .toList();
      case InvestInfoEnum.stocks:
        return portfolio
            .map(
              (e) => _ListContents(
                ticker: e.ticker,
                content: '${e.totalStocks} stocks',
              ),
            )
            .toList();
    }
  }
}

class _ListContents extends StatelessWidget {
  const _ListContents({
    required this.ticker,
    required this.content,
  });

  final String ticker;
  final String content;

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: const TextStyle(
        fontSize: kFontSize,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  '$ticker:',
                ),
              ),
              Expanded(
                child: Text(content),
              ),
            ],
          ),
          const Divider(),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
