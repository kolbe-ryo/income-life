// Flutter imports:
import 'package:flutter/material.dart';
import 'package:income_life/enum/currency_value.dart';
import 'package:income_life/generated/l10n.dart';
import 'package:income_life/ui/top_page/top_page_state.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import '../../data/model/gsheets_model.dart';
import '../../enum/invest_information_enum.dart';
import '../../util/constants.dart';
import '../../util/text_formatter.dart';
import '../global/stock_data_state.dart';
import 'base_show_dialog.dart';

class StockSummaryCard extends StatelessWidget {
  const StockSummaryCard(this.kind, {super.key});

  final InvestInfoEnum kind;

  @override
  Widget build(BuildContext context) {
    final crossAlignment = kind != InvestInfoEnum.stocks ? CrossAxisAlignment.end : CrossAxisAlignment.center;
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
                  crossAxisAlignment: crossAlignment,
                  children: [
                    Text(
                      _title(context),
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

  String _title(BuildContext context) {
    switch (kind) {
      case InvestInfoEnum.income:
        return S.of(context).incomePerYear;
      case InvestInfoEnum.totalInvest:
        return S.of(context).totalInvestment;
      case InvestInfoEnum.stocks:
        return S.of(context).stocks;
    }
  }

  String _content(BuildContext context) {
    final state = context.select((StockDataState value) => value);
    if (state.portfolioLength == 0) {
      return '-';
    }
    final currency = context.select((TopPageState value) => value.currencyValue);
    var totalIncome = '';
    var totalAmount = '';
    if (currency == CurrencyValue.usd) {
      totalIncome = '${S.of(context).usd} ${formatter.format(state.totalIncomeUsd.floor())}';
      totalAmount = '${S.of(context).usd} ${formatter.format(state.totalAmountUsd.floor())}';
    } else {
      totalIncome = '${S.of(context).jpy} ${formatter.format(state.totalIncomeJpy.floor())}';
      totalAmount = '${S.of(context).jpy} ${formatter.format(state.totalAmountJpy.floor())}';
    }
    switch (kind) {
      case InvestInfoEnum.income:
        return totalIncome;
      case InvestInfoEnum.totalInvest:
        return totalAmount;
      case InvestInfoEnum.stocks:
        return formatter.format(state.portfolioLength);
    }
  }

  Future<void> _summaryInformation({
    required BuildContext context,
    required InvestInfoEnum kind,
  }) async {
    final portfolio = context.read<StockDataState>().portfolio;
    final currency = context.read<TopPageState>().currencyValue;
    await baseShowDialog(
      context: context,
      title: _title(context),
      isOnlyClose: true,
      widget: Provider.value(
        value: currency,
        child: _SummaryCardInformationDialog(
          portfolio: portfolio,
          kind: kind,
        ),
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
          children: _response(context),
        ),
      ),
    );
  }

  List<Widget> _response(BuildContext context) {
    final currency = context.read<CurrencyValue>();
    switch (kind) {
      case InvestInfoEnum.income:
        return portfolio
            .map(
              (e) => _ListContents(
                ticker: e.ticker,
                content: '${currency == CurrencyValue.usd ? r'$' : '¥'} ${formatter.format(
                  currency == CurrencyValue.usd ? e.incomeUsd : e.incomeJpy,
                )}',
              ),
            )
            .toList();
      case InvestInfoEnum.totalInvest:
        return portfolio
            .map(
              (e) => _ListContents(
                ticker: e.ticker,
                content: '${currency == CurrencyValue.usd ? r'$' : '¥'} ${formatter.format(
                  currency == CurrencyValue.usd ? e.totalInvestmentUsd : e.totalInvestmentJpy,
                )}',
              ),
            )
            .toList();
      case InvestInfoEnum.stocks:
        return portfolio
            .map(
              (e) => _ListContents(
                ticker: e.ticker,
                content: '${e.totalStocks} ${S.of(context).stocks}',
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
