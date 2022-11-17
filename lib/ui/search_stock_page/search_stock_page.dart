// Flutter imports:
import 'package:flutter/material.dart';
import 'package:income_life/ui/common/constants.dart';
import 'package:income_life/ui/common/stock_information_card.dart';
import 'package:provider/provider.dart';

class SearchStockPage extends StatelessWidget {
  const SearchStockPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider.value(
      value: MediaQuery.of(context),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kPadding),
          child: ListView(
            children: const [
              StockInformationCard(),
            ],
          ),
        ),
      ),
    );
  }
}
