// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:pie_chart/pie_chart.dart';
import 'package:provider/provider.dart';

// Project imports:
import '../../data/model/gsheets_model.dart';
import '../../enum/color_index_enum.dart';
import '../../util/constants.dart';
import '../common/app_colors.dart';
import '../global/stock_data_state.dart';
import '../top_page/top_page_state.dart';

class IncomePieChart extends StatelessWidget {
  const IncomePieChart({super.key});

  @override
  Widget build(BuildContext context) {
    final portfoio = context.select((StockDataState value) => value.portfolio);
    final colorTheme = context.select((TopPageState value) => value.colorTheme);
    return AspectRatio(
      aspectRatio: 1,
      child: Visibility(
        visible: portfoio.isNotEmpty,
        replacement: const Center(
          child: Text('No Data'),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: kPadding),
          child: PieChart(
            baseChartColor: Colors.teal,
            chartLegendSpacing: kPadding,
            chartRadius: double.infinity,
            chartType: ChartType.ring,
            chartValuesOptions: const ChartValuesOptions(
              chartValueStyle: TextStyle(
                color: AppColors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              decimalPlaces: 0,
              showChartValueBackground: false,
            ),
            colorList: colorTheme.colors.take(portfoio.length).toList(),
            dataMap: _getPortfolioDataMap(portfoio),
            initialAngleInDegree: 270,
            legendOptions: const LegendOptions(
              legendPosition: LegendPosition.bottom,
              legendTextStyle: TextStyle(
                fontSize: kFontSize,
              ),
              showLegendsInRow: true,
            ),
          ),
        ),
      ),
    );
  }

  // TODO: 6以上のティッカーは合わせて表示する処理を追加する
  Map<String, double> _getPortfolioDataMap(List<GsheetsModel> models) {
    final dataMap = <String, double>{};
    for (final model in models) {
      dataMap[model.ticker] = model.income;
    }
    return dataMap;
  }
}

Map<String, double> dataMap = {
  "Flutter": 5,
  "React": 3,
  "a": 5,
  "Reacvt": 3,
  // "Reacvtw": 3,
  // "Reacvtf": 3,
};
