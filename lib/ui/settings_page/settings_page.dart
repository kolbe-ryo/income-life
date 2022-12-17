// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:income_life/ui/common/base_card.dart';
import 'package:income_life/ui/global/stock_data_manager.dart';
import 'package:income_life/ui/settings_page/setting_contents/about_app_web_view_page.dart';
import 'package:provider/provider.dart';

// Project imports:
import '../../util/constants.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(kPadding),
        child: Column(
          children: [
            const SizedBox(height: kPadding),
            _CardTile(
              leadingIcon: const FaIcon(FontAwesomeIcons.appStore),
              title: 'About This App',
              trailingIcon: const FaIcon(FontAwesomeIcons.arrowRight),
              onTap: () => Navigator.push(
                context,
                AboutAppWebViewPage.route(),
              ),
            ),
            _CardTile(
              leadingIcon: const FaIcon(FontAwesomeIcons.certificate),
              title: 'Licenses',
              trailingIcon: const FaIcon(FontAwesomeIcons.arrowRight),
              onTap: () => showLicensePage(context: context),
            ),
            _CardTile(
              leadingIcon: const FaIcon(FontAwesomeIcons.eraser),
              title: 'Reset',
              trailingIcon: const FaIcon(FontAwesomeIcons.arrowRight),
              onTap: () => context.read<StockDataManager>().deleteAll(),
            ),
            _CardTile(
              leadingIcon: const FaIcon(FontAwesomeIcons.envelope),
              title: 'Request to add stock',
              trailingIcon: const FaIcon(FontAwesomeIcons.arrowRight),
              onTap: null,
            ),
            _CardTile(
              leadingIcon: const FaIcon(FontAwesomeIcons.yahoo),
              title: 'Yahoo Finance',
              trailingIcon: const FaIcon(FontAwesomeIcons.arrowRight),
              onTap: null,
            ),
          ],
        ),
      ),
    );
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
