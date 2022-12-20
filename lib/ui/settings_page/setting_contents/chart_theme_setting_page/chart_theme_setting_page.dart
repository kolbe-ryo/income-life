import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:income_life/enum/chart_theme_enum.dart';
import 'package:income_life/enum/color_index_enum.dart';
import 'package:income_life/ui/common/app_colors.dart';
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
      (ChartThemeSettingPageState value) => isColorTheme ? value.colorTheme : value.chartTheme,
    );
    final viewModel = context.read<ChartThemeSettingPageViewModel>();

    return Row(
      children: (isColorTheme ? ColorIndexEnum.values : ChartThemeEnum.values).map(
        (e) {
          Future<void> onTap() async {
            if (isColorTheme) {
              viewModel.switchColorTheme(e as ColorIndexEnum);
            }
            if (isChartTheme) {
              viewModel.switchChartTheme(e as ChartThemeEnum);
            }
            // TODO: save to local
          }

          return Row(
            children: [
              Radio(
                value: value,
                activeColor: AppColors.tealAccent,
                groupValue: e,
                onChanged: (_) => onTap(),
              ),
              GestureDetector(
                onTap: onTap,
                child: Text(e.name),
              ),
            ],
          );
        },
      ).toList(),
    );
  }
}
