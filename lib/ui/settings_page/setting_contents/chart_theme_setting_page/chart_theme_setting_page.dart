import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:income_life/enum/chart_theme_enum.dart';
import 'package:income_life/enum/color_index_enum.dart';
import 'package:income_life/ui/settings_page/setting_contents/chart_theme_setting_page/chart_theme_setting_page_state.dart';
import 'package:income_life/ui/settings_page/setting_contents/chart_theme_setting_page/chart_theme_setting_page_view_model.dart';
import 'package:income_life/util/constants.dart';

class ChartThemeSettingPage extends StatelessWidget {
  const ChartThemeSettingPage({super.key});

  static Route<ChartThemeSettingPage> route() {
    return MaterialPageRoute<ChartThemeSettingPage>(
      builder: (_) => const ChartThemeSettingPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return StateNotifierProvider<ChartThemeSettingPageViewModel, ChartThemeSettingPageState>(
      create: (_) => ChartThemeSettingPageViewModel(),
      builder: (context, _) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Chart Theme Setting'),
            centerTitle: true,
            elevation: 0,
          ),
          body: Padding(
            padding: const EdgeInsets.all(kPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                _HeadLineText('Color Theme'),
                _RadioButtonWithText(isColorTheme: true),
                Divider(),
                SizedBox(height: kPadding),
                _HeadLineText('Chart Theme'),
                _RadioButtonWithText(isChartTheme: true),
                Divider(),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _HeadLineText extends StatelessWidget {
  const _HeadLineText(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: kFontSize,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class _RadioButtonWithText extends StatelessWidget {
  const _RadioButtonWithText({
    this.isColorTheme = false,
    this.isChartTheme = false,
  });

  final bool isColorTheme;
  final bool isChartTheme;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: null,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isColorTheme) ..._colorThemeRadio(),
          if (isChartTheme) ..._chartThemeRadio(),
        ],
      ),
    );
  }

  List<Widget> _colorThemeRadio() {
    return ColorIndexEnum.values
        .map(
          (e) => Row(
            children: [
              Radio(
                value: e,
                activeColor: Colors.blueAccent,
                groupValue: e,
                onChanged: null,
              ),
              Text(e.name),
            ],
          ),
        )
        .toList();
  }

  List<Widget> _chartThemeRadio() {
    return ChartThemeEnum.values
        .map(
          (e) => Row(
            children: [
              Radio(
                value: e,
                activeColor: Colors.blueAccent,
                groupValue: e,
                onChanged: null,
              ),
              Text(e.name),
            ],
          ),
        )
        .toList();
  }
}
