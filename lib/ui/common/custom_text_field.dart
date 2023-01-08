// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import '../../generated/l10n.dart';
import '../../util/constants.dart';
import '../../util/logger.dart';
import '../search_stock_page/search_stock_page_view_model.dart';
import 'app_colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: context.read<SearchStockPageViewModel>().controller,
      cursorColor: AppColors.darkGrey,
      cursorWidth: 1,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.zero,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kBorder),
          borderSide: const BorderSide(color: AppColors.darkGrey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kBorder),
          borderSide: const BorderSide(color: AppColors.lightGrey60),
        ),
        prefixIcon: const Icon(
          Icons.search,
          color: Colors.tealAccent,
        ),
      ),
      style: const TextStyle(
        color: AppColors.lightGrey70,
        fontSize: 18,
      ),
      onChanged: (text) {
        context.read<SearchStockPageViewModel>().searchText(text);
      },
    );
  }
}

class DigitsTextField extends StatelessWidget {
  const DigitsTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.watch<GlobalKey<FormState>>(),
      child: CupertinoTextFormFieldRow(
        cursorColor: AppColors.darkGrey,
        cursorWidth: 1,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
        ),
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        padding: const EdgeInsets.symmetric(horizontal: kPadding),
        placeholder: S.of(context).example,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        style: const TextStyle(
          color: AppColors.lightGrey70,
          fontSize: 18,
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return S.of(context).alertTextNotEmpty;
          } else if (value == '0') {
            return S.of(context).alertTextNoQuantity;
          }
          return null;
        },
        onChanged: (value) {
          final stocks = int.parse(value);
          context.read<void Function(int)>()(stocks);
          logger.info(stocks);
        },
      ),
    );
  }
}
