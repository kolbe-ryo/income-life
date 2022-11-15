// Flutter imports:
import 'package:flutter/material.dart';
import 'package:income_life/ui/common/stock_information_card.dart';

class SearchStockPage extends StatelessWidget {
  const SearchStockPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        ListView(
          children: [
            StockInformationCard(),
          ],
        ),
      ]),
    );
  }
}
