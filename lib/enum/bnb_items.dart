// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../ui/income_page/income_page.dart';
import '../ui/search_stock_page/search_stock_page.dart';
import '../ui/settings_page/settings_page.dart';

enum BnbItems {
  income,
  search,
  settings,
}

extension BnbItemsExt on BnbItems {
  Widget get page {
    switch (this) {
      case BnbItems.income:
        return const IncomePage();
      case BnbItems.search:
        return const SearchStockPage();
      case BnbItems.settings:
        return const SettingsPage();
    }
  }

  BottomNavigationBarItem get item {
    switch (this) {
      case BnbItems.income:
        return const BottomNavigationBarItem(
          label: 'Income',
          icon: Icon(Icons.attach_money),
        );
      case BnbItems.search:
        return const BottomNavigationBarItem(
          label: 'Search',
          icon: Icon(Icons.search),
        );
      case BnbItems.settings:
        return const BottomNavigationBarItem(
          label: 'Settings',
          icon: Icon(Icons.settings),
        );
    }
  }
}
