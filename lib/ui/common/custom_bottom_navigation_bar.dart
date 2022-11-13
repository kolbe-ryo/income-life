import 'package:flutter/material.dart';
import 'package:income_life/ui/top_page/top_page_state.dart';
import 'package:income_life/ui/top_page/top_page_view_model.dart';
import 'package:provider/provider.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: context.select((TopPageState value) => value.pageIndex),
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          label: 'Income', //TODO: localization
          icon: Icon(Icons.attach_money),
        ),
        BottomNavigationBarItem(
          label: 'Search', //TODO: localization
          icon: Icon(Icons.search),
        ),
        BottomNavigationBarItem(
          label: 'Settings', //TODO: localization
          icon: Icon(Icons.settings),
        )
      ],
      onTap: (int index) => context.read<TopPageViewModel>().switchBNB(index),
    );
  }
}
