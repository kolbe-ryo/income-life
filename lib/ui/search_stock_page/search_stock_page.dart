// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import '../common/constants.dart';
import '../common/stock_information_card.dart';
import '../global/stock_data_manager.dart';
import '../global/stock_data_state.dart';

class SearchStockPage extends StatelessWidget {
  const SearchStockPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider.value(
      value: MediaQuery.of(context),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          title: const _TextField(),
        ),
        body: GestureDetector(
          onTap: () {
            final currentScope = FocusScope.of(context);
            if (!currentScope.hasPrimaryFocus && currentScope.hasFocus) {
              FocusManager.instance.primaryFocus!.unfocus();
            }
          },
          child: Padding(
            padding: const EdgeInsets.fromLTRB(kPadding, kPadding, kPadding, 0),
            child: ListView.builder(
              itemCount: context.select((StockDataState value) => value.gsheets.length),
              itemBuilder: (context, index) {
                return Provider.value(
                  value: index,
                  child: const StockInformationCard(),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _TextField extends StatelessWidget {
  const _TextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: kPadding, bottom: kPadding / 2),
      child: TextField(
        cursorColor: Colors.white24,
        cursorWidth: 1,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.white24),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.white60),
          ),
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.tealAccent,
          ),
        ),
        style: const TextStyle(
          color: Colors.white70,
          fontSize: 18,
        ),
      ),
    );
  }
}
