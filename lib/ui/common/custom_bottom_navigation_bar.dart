// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import '../../enum/bnb_items.dart';
import '../top_page/top_page_state.dart';
import '../top_page/top_page_view_model.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FutureBuilder(
          future: context.read<TopPageViewModel>().admobBanner,
          builder: (context, AsyncSnapshot<Widget> snapshot) {
            if (snapshot.hasData) {
              return snapshot.data!;
            } else if (snapshot.hasError) {
              // Something to do
            }
            return const CircularProgressIndicator();
          },
        ),
        BottomNavigationBar(
          currentIndex: context.select((TopPageState value) => value.pageIndex),
          items: BnbItems.values.map((bnb) => bnb.item).toList(),
          onTap: (int index) {
            final viewModel = context.read<TopPageViewModel>();
            if (index == context.read<TopPageState>().pageIndex) {
              final mapKey = BnbItems.values[context.read<TopPageState>().pageIndex];
              viewModel.navigatorKeys[mapKey]?.currentState?.popUntil((route) => route.isFirst);
            }
            viewModel.switchBNB(index);
          },
        ),
      ],
    );
  }
}
