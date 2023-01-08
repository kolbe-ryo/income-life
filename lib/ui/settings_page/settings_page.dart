// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:income_life/generated/l10n.dart';
import 'package:provider/provider.dart';

// Project imports:
import '../../enum/color_index_enum.dart';
import '../../util/constants.dart';
import '../common/base_card.dart';
import '../common/base_show_dialog.dart';
import '../global/stock_data_manager.dart';
import '../top_page/top_page_state.dart';
import '../top_page/top_page_view_model.dart';
import 'setting_contents/base_web_view_page.dart';
import 'setting_contents/chart_theme_setting_page/chart_theme_setting_page.dart';
import 'setting_contents/request_to_add_stock/request_to_add_stock_page.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorTheme = context.select((TopPageState value) => value.colorTheme);
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(kPadding, kPadding, kPadding, 0),
        child: Column(
          children: [
            const SizedBox(height: kPadding),
            _CardTile(
              leadingIcon: FaIcon(
                FontAwesomeIcons.appStore,
                color: colorTheme.colors[0],
              ),
              title: S.of(context).aboutThisApp,
              trailingIcon: const FaIcon(FontAwesomeIcons.arrowRight),
              onTap: () => Navigator.push(
                context,
                BaseWebView.route(
                  title: S.of(context).aboutThisApp,
                  url: aboutAppUrl,
                ),
              ),
            ),
            _CardTile(
              leadingIcon: FaIcon(
                FontAwesomeIcons.palette,
                color: colorTheme.colors[1],
              ),
              title: S.of(context).themeSetting,
              trailingIcon: const FaIcon(FontAwesomeIcons.arrowRight),
              onTap: () => Navigator.push(
                context,
                ChartThemeSettingPage.route(),
              ),
            ),
            _CardTile(
              leadingIcon: FaIcon(
                FontAwesomeIcons.certificate,
                color: colorTheme.colors[2],
              ),
              title: S.of(context).licenses,
              trailingIcon: const FaIcon(FontAwesomeIcons.arrowRight),
              onTap: () => showLicensePage(context: context),
            ),
            _CardTile(
              leadingIcon: FaIcon(
                FontAwesomeIcons.envelope,
                color: colorTheme.colors[3],
              ),
              title: S.of(context).requestToAddStock,
              trailingIcon: const FaIcon(FontAwesomeIcons.arrowRight),
              onTap: () => Navigator.push(
                context,
                RequestToAddStockPage.route(),
              ),
            ),
            _CardTile(
              leadingIcon: FaIcon(
                FontAwesomeIcons.eraser,
                color: colorTheme.colors[4],
              ),
              title: S.of(context).reset,
              trailingIcon: const FaIcon(FontAwesomeIcons.arrowRight),
              onTap: () => _reset(context),
            ),
            _CardTile(
              leadingIcon: FaIcon(
                FontAwesomeIcons.yahoo,
                color: colorTheme.colors[5],
              ),
              title: S.of(context).yahooFinance,
              trailingIcon: const FaIcon(FontAwesomeIcons.arrowRight),
              onTap: () => Navigator.push(
                context,
                BaseWebView.route(
                  title: S.of(context).yahooFinance,
                  url: yahooFinanceUrl,
                  needAppBar: false,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _reset(BuildContext context) async {
    final stockDataManager = context.read<StockDataManager>();
    final bnbController = context.read<TopPageViewModel>();
    final isDelete = await baseShowDialog(
      context: context,
      title: S.of(context).checkResetAll,
      isSimpleDialog: true,
      widget: Padding(
        padding: const EdgeInsets.only(top: kPadding / 2),
        child: Text(S.of(context).checkCannotUndone),
      ),
    );
    if (isDelete ?? false) {
      stockDataManager.deleteAll();
      bnbController.switchBNB(0);
    }
  }
}

class _CardTile extends StatelessWidget {
  const _CardTile({
    required this.leadingIcon,
    required this.title,
    required this.trailingIcon,
    required this.onTap,
  });

  final FaIcon leadingIcon;
  final String title;
  final FaIcon trailingIcon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: CardElement(
        widget: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: ListTile(
            leading: leadingIcon,
            title: Text(
              title,
              style: const TextStyle(
                fontSize: kFontSize,
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: trailingIcon,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(kBorder),
            ),
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}
