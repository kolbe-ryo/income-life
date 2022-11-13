// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:income_life/enum/bnb_items.dart';
import 'package:provider/provider.dart';

// Project imports:
import '../common/custom_bottom_navigation_bar.dart';
import 'top_page_state.dart';
import 'top_page_view_model.dart';

class TopPage extends StatelessWidget {
  const TopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StateNotifierProvider<TopPageViewModel, TopPageState>(
      create: (_) => TopPageViewModel(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            body: Stack(
              children: _mainContents(context),
            ),
            bottomNavigationBar: const CustomBottomNavigationBar(),
          );
        },
      ),
    );
  }

  List<Widget> _mainContents(BuildContext context) {
    final pageIndex = context.select((TopPageState value) => value.pageIndex);
    final navigatorKeys = context.watch<TopPageViewModel>().navigatorKeys;
    return BnbItems.values.map(
      (bnb) {
        return Offstage(
          offstage: pageIndex != bnb.index,
          child: Navigator(
            key: navigatorKeys[bnb],
            onGenerateRoute: (_) {
              return MaterialPageRoute<Widget>(
                builder: (_) => bnb.page,
              );
            },
          ),
        );
      },
    ).toList();
  }
}