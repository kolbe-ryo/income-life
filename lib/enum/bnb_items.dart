// Flutter imports:
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:income_life/generated/l10n.dart';

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
    final _context = GetIt.I<GlobalKey<NavigatorState>>().currentContext!;
    switch (this) {
      case BnbItems.income:
        return BottomNavigationBarItem(
          label: S.of(_context).income,
          icon: const Icon(Icons.attach_money),
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
