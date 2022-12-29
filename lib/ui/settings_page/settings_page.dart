// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

// Project imports:
import '../../util/constants.dart';
import '../common/base_card.dart';
import '../common/base_show_dialog.dart';
import '../global/stock_data_manager.dart';
import '../top_page/top_page_view_model.dart';
import 'setting_contents/base_web_view_page.dart';
import 'setting_contents/chart_theme_setting_page/chart_theme_setting_page.dart';
import 'setting_contents/request_to_add_stock/request_to_add_stock_page.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(kPadding, kPadding, kPadding, 0),
        child: Column(
          children: [
            const SizedBox(height: kPadding),
            _CardTile(
              leadingIcon: const FaIcon(FontAwesomeIcons.appStore),
              title: 'About This App',
              trailingIcon: const FaIcon(FontAwesomeIcons.arrowRight),
              onTap: () => Navigator.push(
                context,
                BaseWebView.route(
                  title: 'About This App',
                  url: aboutAppUrl,
                ),
              ),
            ),
            _CardTile(
              leadingIcon: const FaIcon(FontAwesomeIcons.palette),
              title: 'Chart Theme',
              trailingIcon: const FaIcon(FontAwesomeIcons.arrowRight),
              onTap: () => Navigator.push(
                context,
                ChartThemeSettingPage.route(),
              ),
            ),
            _CardTile(
              leadingIcon: const FaIcon(FontAwesomeIcons.certificate),
              title: 'Licenses',
              trailingIcon: const FaIcon(FontAwesomeIcons.arrowRight),
              onTap: () => showLicensePage(context: context),
            ),
            _CardTile(
              leadingIcon: const FaIcon(FontAwesomeIcons.envelope),
              title: 'Request to add stock',
              trailingIcon: const FaIcon(FontAwesomeIcons.arrowRight),
              onTap: () => Navigator.push(
                context,
                RequestToAddStockPage.route(),
              ),
            ),
            _CardTile(
              leadingIcon: const FaIcon(FontAwesomeIcons.eraser),
              title: 'Reset',
              trailingIcon: const FaIcon(FontAwesomeIcons.arrowRight),
              onTap: () => _reset(context),
            ),
            _CardTile(
              leadingIcon: const FaIcon(FontAwesomeIcons.yahoo),
              title: 'Yahoo Finance',
              trailingIcon: const FaIcon(FontAwesomeIcons.arrowRight),
              onTap: () => Navigator.push(
                context,
                BaseWebView.route(
                  title: 'Yahoo Finance',
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
      title: 'Reset All Your Portfolio?',
      isSimpleDialog: true,
      widget: const Padding(
        padding: EdgeInsets.only(top: kPadding / 2),
        child: Text('This operation cannot be undone.'),
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
