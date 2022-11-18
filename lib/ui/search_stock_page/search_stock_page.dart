// Flutter imports:
import 'package:flutter/material.dart';
import 'package:income_life/ui/common/constants.dart';
import 'package:income_life/ui/common/stock_information_card.dart';
import 'package:provider/provider.dart';

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
            child: ListView(
              children: const [
                StockInformationCard(),
                StockInformationCard(),
              ],
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
