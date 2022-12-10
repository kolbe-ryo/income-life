// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

// Project imports:
import '../../data/model/gsheets_model.dart';
import '../global/stock_data_manager.dart';
import 'app_colors.dart';
import 'constants.dart';

abstract class BaseCard extends StatelessWidget {
  const BaseCard({super.key});

  void Function()? onTap(BuildContext context);

  Widget? innerTextWidget();

  @override
  Widget build(BuildContext context) {
    final model = context.watch<GsheetsModel>();
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Visibility(
        visible: context.select((GsheetsModel value) => value.isAddedPortfolio),
        replacement: _getCard(context),
        child: Slidable(
          endActionPane: ActionPane(
            extentRatio: 0.3,
            motion: const DrawerMotion(),
            children: [
              SlidableAction(
                backgroundColor: AppColors.deepOrangeAccent,
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'Delete',
                onPressed: (BuildContext context) => context.read<StockDataManager>().deletePortfolio(model),
              ),
            ],
          ),
          child: _getCard(context),
        ),
      ),
    );
  }

  Widget _getCard(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kBorder),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(kBorder),
        onTap: onTap(context),
        child: Padding(
          padding: const EdgeInsets.all(kPadding / 2),
          child: innerTextWidget(),
        ),
      ),
    );
  }
}
