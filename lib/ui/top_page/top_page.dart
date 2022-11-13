import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:income_life/ui/common/custom_bottom_navigation_bar.dart';
import 'package:income_life/ui/top_page/top_page_state.dart';
import 'package:income_life/ui/top_page/top_page_view_model.dart';

class TopPage extends StatelessWidget {
  const TopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StateNotifierProvider<TopPageViewModel, TopPageState>(
      create: (context) => TopPageViewModel(),
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Text(
                'test',
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          ),
        ),
        bottomNavigationBar: const CustomBottomNavigationBar(),
      ),
    );
  }
}
