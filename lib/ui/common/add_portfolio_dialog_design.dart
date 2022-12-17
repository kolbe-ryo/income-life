// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../../data/model/gsheets_model.dart';
import '../../util/constants.dart';
import 'custom_text_field.dart';

class AddPortfolioDialogDesign extends StatelessWidget {
  const AddPortfolioDialogDesign(this.model, {super.key});

  final GsheetsModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: kPadding / 2, left: kPadding),
      child: DefaultTextStyle(
        style: const TextStyle(fontSize: kFontSize),
        child: Column(
          children: [
            const SizedBox(height: kPadding / 2),
            Row(
              children: [
                const Text('Ticker :'),
                Expanded(
                  child: Text(
                    model.ticker,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            if (model.isAddedPortfolio)
              Padding(
                padding: const EdgeInsets.only(top: kPadding / 2),
                child: Row(
                  children: [
                    const Text('Total :'),
                    Expanded(
                      child: Text(
                        model.totalStocks.toString(),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Text('Adding :'),
                Expanded(
                  child: DigitsTextField(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
