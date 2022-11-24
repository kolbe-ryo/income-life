// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:income_life/data/model/gsheets_model.dart';
import 'package:income_life/enum/added_condition_enum.dart';
import 'package:income_life/ui/common/app_colors.dart';
import 'package:income_life/ui/common/custom_text_field.dart';
import 'package:income_life/ui/search_stock_page/search_stock_page_state.dart';
import 'package:income_life/ui/search_stock_page/search_stock_page_view_model.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import '../common/constants.dart';
import '../common/stock_information_card.dart';
import '../global/stock_data_state.dart';

class SearchStockPage extends StatelessWidget {
  const SearchStockPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StateNotifierProvider<SearchStockPageViewModel, SearchStockPageState>(
      create: (context) => SearchStockPageViewModel(),
      builder: (context, _) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            elevation: 0,
            title: const Padding(
              padding: EdgeInsets.only(top: kPadding, bottom: kPadding / 2),
              child: CustomTextField(),
            ),
          ),
          body: GestureDetector(
            onTap: () {
              final currentScope = FocusScope.of(context);
              if (!currentScope.hasPrimaryFocus && currentScope.hasFocus) {
                FocusManager.instance.primaryFocus!.unfocus();
              }
            },
            child: const _ListView(),
          ),
          floatingActionButton: const _FloatingActionButton(),
        );
      },
    );
  }
}

class _ListView extends StatelessWidget {
  const _ListView();

  @override
  Widget build(BuildContext context) {
    final searchCondition = context.select((SearchStockPageState value) => value.condition);
    final selectState = context.select(
      (StockDataState value) => selectGsheets(
        state: value,
        condition: searchCondition,
      ),
    );
    return Padding(
      padding: const EdgeInsets.fromLTRB(kPadding, kPadding, kPadding, 0),
      child: ListView(
        children: selectState.map((model) {
          return Provider.value(
            value: model,
            child: const StockInformationCard(),
          );
        }).toList(),
      ),
    );
  }
}

class _FloatingActionButton extends StatelessWidget {
  const _FloatingActionButton();

  @override
  Widget build(BuildContext context) {
    final searchCondition = context.select((SearchStockPageState value) => value.condition);
    return FloatingActionButton(
      backgroundColor: searchCondition.color,
      onPressed: () => context.read<SearchStockPageViewModel>().switchCondition(),
      child: const FaIcon(
        FontAwesomeIcons.shuffle,
        color: AppColors.white,
      ),
    );
  }
}

List<GsheetsModel> selectGsheets({
  required StockDataState state,
  required AddedConditionEnum condition,
}) {
  switch (condition) {
    case AddedConditionEnum.isAdded:
      return state.portfolio;
    case AddedConditionEnum.notAdded:
      return state.notPortfolio;
    case AddedConditionEnum.all:
      return state.gsheets;
  }
}
