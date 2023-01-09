// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:income_life/generated/l10n.dart';
import 'package:income_life/ui/common/notification_toast.dart';
import 'package:provider/provider.dart';

// Project imports:
import '../../enum/added_condition_enum.dart';
import '../../util/constants.dart';
import '../common/app_colors.dart';
import '../common/custom_text_field.dart';
import '../common/stock_information_card.dart';
import '../global/stock_data_manager.dart';
import '../global/stock_data_state.dart';
import 'search_stock_page_state.dart';
import 'search_stock_page_view_model.dart';

class SearchStockPage extends StatelessWidget {
  const SearchStockPage({super.key});

  @override
  Widget build(BuildContext context) {
    final stockDataManager = context.read<StockDataManager>();
    final messageIntl = S.of(context);
    return StateNotifierProvider<SearchStockPageViewModel, SearchStockPageState>(
      create: (context) => SearchStockPageViewModel(),
      builder: (context, _) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              elevation: 0,
              title: const Padding(
                padding: EdgeInsets.only(top: kPadding, bottom: kPadding / 2),
                child: CustomTextField(),
              ),
            ),
            body: Visibility(
              visible: context.select(
                (StockDataState value) => value.isSuccessFetch,
              ),
              replacement: Center(
                child: ElevatedButton(
                  onPressed: () async {
                    await NotificationToast.showToast(
                      context: context,
                      message: messageIntl.refreshing,
                    );
                    final isSuccess = await stockDataManager.reload();
                    if (isSuccess ?? false) {
                      await NotificationToast.showToast(
                        context: context,
                        message: messageIntl.successRefresh,
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.teal,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(kBorder),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const FaIcon(FontAwesomeIcons.arrowsRotate),
                      const SizedBox(width: kPadding),
                      Text(
                        S.of(context).refresh,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              child: GestureDetector(
                onTap: () {
                  final currentScope = FocusScope.of(context);
                  if (!currentScope.hasPrimaryFocus && currentScope.hasFocus) {
                    FocusManager.instance.primaryFocus!.unfocus();
                  }
                },
                child: const _ListView(),
              ),
            ),
            floatingActionButton: const _FloatingActionButton(),
          ),
        );
      },
    );
  }
}

class _ListView extends StatelessWidget {
  const _ListView();

  @override
  Widget build(BuildContext context) {
    // Change display stock by FAB condition
    final viewModel1 = context.read<StockDataManager>();
    final viewModel2 = context.read<SearchStockPageViewModel>();
    final condition = context.select(
      (SearchStockPageState value) => value.condition,
    );
    final isSearching = context.select(
      (SearchStockPageState value) => value.isSearching,
    );
    final searchedModels = !isSearching
        ? context.select(
            (StockDataState value) => viewModel1.selectGsheets(
              state: value,
              condition: condition,
            ),
          )
        : context.select(
            (SearchStockPageState value) => viewModel2.selectGsheets(
              state: value,
            ),
          );
    return Padding(
      padding: const EdgeInsets.fromLTRB(kPadding, kPadding, kPadding, 0),
      child: ListView(
        children: searchedModels.map((model) {
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
    final searchCondition = context.select(
      (SearchStockPageState value) => value.condition,
    );
    return FloatingActionButton(
      backgroundColor: searchCondition.color,
      onPressed: () {
        return context.read<SearchStockPageViewModel>().switchCondition();
      },
      child: const FaIcon(
        FontAwesomeIcons.toggleOn,
        color: AppColors.white,
      ),
    );
  }
}
