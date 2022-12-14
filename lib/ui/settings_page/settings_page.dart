// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// Project imports:
import '../common/constants.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(kPadding),
        child: Column(
          children: [
            SizedBox(height: kPadding),
            _CardTile(
              leadingIcon: FaIcon(FontAwesomeIcons.appStore),
              title: 'About This App',
              trailingIcon: FaIcon(FontAwesomeIcons.arrowRight),
              onTap: () => print('test'),
            ),
            _CardTile(
              leadingIcon: FaIcon(FontAwesomeIcons.eraser),
              title: 'Reset',
              trailingIcon: FaIcon(FontAwesomeIcons.arrowRight),
              onTap: null,
            ),
            _CardTile(
              leadingIcon: FaIcon(FontAwesomeIcons.certificate),
              title: 'Licenses',
              trailingIcon: FaIcon(FontAwesomeIcons.arrowRight),
              onTap: null,
            ),
            _CardTile(
              leadingIcon: FaIcon(FontAwesomeIcons.certificate),
              title: 'Licenses',
              trailingIcon: FaIcon(FontAwesomeIcons.arrowRight),
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
      padding: const EdgeInsets.only(bottom: kPadding / 2),
      child: Center(
        child: Card(
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kBorder),
          ),
          child: SizedBox(
            height: kCardHeight,
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
              onTap: onTap,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(kBorder),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
