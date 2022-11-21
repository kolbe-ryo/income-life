// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:income_life/ui/common/constants.dart';
import 'package:income_life/ui/income_page/income_heat_map.dart';
import 'package:income_life/ui/income_page/income_page_state.dart';
import 'package:income_life/ui/income_page/income_page_view_model.dart';

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
              children: const [
                IncomeHeatMap(),
              ],
            ),
          ),
        );
      },
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('next')),
    );
  }
}
