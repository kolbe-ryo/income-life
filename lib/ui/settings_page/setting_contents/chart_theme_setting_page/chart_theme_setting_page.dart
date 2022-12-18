import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:income_life/enum/chart_theme_enum.dart';
import 'package:income_life/enum/color_index_enum.dart';
import 'package:income_life/ui/settings_page/setting_contents/chart_theme_setting_page/chart_theme_setting_page_state.dart';
import 'package:income_life/ui/settings_page/setting_contents/chart_theme_setting_page/chart_theme_setting_page_view_model.dart';
import 'package:income_life/util/constants.dart';
import 'package:provider/provider.dart';

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
            title: const Text('Theme Setting'),
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
    final value = context.select(
      (ChartThemeSettingPageState value) {
        if (isColorTheme) {
          return value.colorTheme;
        }
        if (isChartTheme) {
          return value.chartTheme;
        }
      },
    );
    final viewModel = context.read<ChartThemeSettingPageViewModel>();

    //TODO: Way to detext tap on all row element

    return Row(
      children: (isColorTheme ? ColorIndexEnum.values : ChartThemeEnum.values)
          .map(
            (e) => GestureDetector(
              onTap: () {
                if (isColorTheme) {
                  viewModel.switchColorTheme(e as ColorIndexEnum);
                }
                if (isChartTheme) {
                  viewModel.switchChartTheme(e as ChartThemeEnum);
                }
              },
              child: Row(
                children: [
                  Radio(
                    value: value,
                    activeColor: Colors.blueAccent,
                    groupValue: e,
                    onChanged: (_) {},
                  ),
                  Text(e.name),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}
