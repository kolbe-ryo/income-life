// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';

// Project imports:
import '../../../../enum/chart_theme_enum.dart';
import '../../../../enum/color_index_enum.dart';
import '../../../../enum/currency_value.dart';
import '../../../../generated/l10n.dart';
import '../../../../util/constants.dart';
import '../../../common/app_colors.dart';
import 'chart_theme_setting_page_state.dart';
import 'chart_theme_setting_page_view_model.dart';

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
            title: Text(S.of(context).themeSetting),
            centerTitle: true,
            elevation: 0,
          ),
          body: Padding(
            padding: const EdgeInsets.all(kPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _HeadLineText(S.of(context).colorTheme),
                const _RadioButtonWithText(isColorTheme: true),
                const Divider(),
                const SizedBox(height: kPadding),
                _HeadLineText(S.of(context).chartTheme),
                const _RadioButtonWithText(isChartTheme: true),
                const Divider(),
                _HeadLineText(S.of(context).currency),
                const _RadioButtonWithText(isCurrency: true),
                const Divider(),
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
    this.isCurrency = false,
  });

  final bool isColorTheme;
  final bool isChartTheme;
  final bool isCurrency;

  @override
  Widget build(BuildContext context) {
    final valueMap = context.select(
      (ChartThemeSettingPageState value) {
        if (isColorTheme) {
          return {value.colorTheme: ColorIndexEnum.values};
        }
        if (isChartTheme) {
          return {value.chartTheme: ChartThemeEnum.values};
        }
        if (isCurrency) {
          return {value.currencyValue: CurrencyValue.values};
        }
      },
    );
    final viewModel = context.read<ChartThemeSettingPageViewModel>();

    return Row(
      children: valueMap!.values.first.map(
        (e) {
          var text = '';
          Future<void> Function()? onTap;
          if (isColorTheme) {
            onTap = () async => viewModel.switchColorTheme(e as ColorIndexEnum);
            text = (e as ColorIndexEnum).value;
          } else if (isChartTheme) {
            onTap = () async => viewModel.switchChartTheme(e as ChartThemeEnum);
            text = (e as ChartThemeEnum).value;
          } else if (isCurrency) {
            onTap = () async => viewModel.switchCurrencyValue(e as CurrencyValue);
            text = (e as CurrencyValue).value;
          }

          return Row(
            children: [
              Radio(
                value: valueMap.keys.first,
                activeColor: AppColors.tealAccent,
                groupValue: e,
                onChanged: (_) => onTap!(),
              ),
              GestureDetector(
                onTap: onTap,
                child: Text(
                  text,
                  style: const TextStyle(fontSize: kFontSize),
                ),
              ),
            ],
          );
        },
      ).toList(),
    );
  }
}
