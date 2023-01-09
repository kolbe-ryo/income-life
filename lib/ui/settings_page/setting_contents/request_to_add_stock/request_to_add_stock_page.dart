// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:income_life/generated/l10n.dart';
import 'package:provider/provider.dart';

// Project imports:
import '../../../../util/constants.dart';
import '../../../../util/logger.dart';
import '../../../common/app_colors.dart';
import '../../../common/notification_toast.dart';
import 'request_to_add_stock_page_state.dart';
import 'request_to_add_stock_page_view_model.dart';

class RequestToAddStockPage extends StatelessWidget {
  const RequestToAddStockPage({super.key});

  static Route<RequestToAddStockPage> route() {
    return MaterialPageRoute<RequestToAddStockPage>(
      builder: (_) => Provider(
        create: (_) => RequestToAddStockPageViewModel(),
        child: const RequestToAddStockPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).request),
        centerTitle: true,
        elevation: 0,
      ),
      body: StateNotifierProvider<RequestToAddStockPageViewModel, RequestToAddStockPageState>(
        create: (_) => RequestToAddStockPageViewModel(),
        builder: (context, _) {
          return Padding(
            padding: const EdgeInsets.all(kPadding),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    S.of(context).requestTicker,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                const SizedBox(height: kPadding),
                Text(
                  S.of(context).descriptionForRequest,
                  style: const TextStyle(color: AppColors.lightGrey60),
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: kPadding * 2),
                Provider.value(
                  value: formKey,
                  child: const _TextField(),
                ),
                const SizedBox(height: kPadding / 2),
                Builder(
                  builder: (context) {
                    final viewModel = context.read<RequestToAddStockPageViewModel>();
                    final messageIntl = S.of(context);
                    return SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            await NotificationToast.showToast(
                              context: context,
                              message: messageIntl.sending,
                            );
                            final isComplete = await viewModel.request();
                            await NotificationToast.showToast(
                              context: context,
                              message: isComplete ? messageIntl.complete : messageIntl.tryAgain,
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.teal,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(kBorder),
                          ),
                        ),
                        child: Text(
                          S.of(context).send,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _TextField extends StatelessWidget {
  const _TextField();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.watch<GlobalKey<FormState>>(),
      child: CupertinoTextFormFieldRow(
        controller: context.read<RequestToAddStockPageViewModel>().controller,
        cursorColor: AppColors.darkGrey,
        cursorWidth: 1,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.darkGrey),
          borderRadius: const BorderRadius.all(
            Radius.circular(kBorder),
          ),
        ),
        placeholder: S.of(context).requestPlaceholder,
        padding: EdgeInsets.zero,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        style: const TextStyle(
          color: AppColors.lightGrey70,
          fontSize: 18,
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return S.of(context).alertTextNotEmpty;
          }
          return null;
        },
        onChanged: (value) {
          context.read<RequestToAddStockPageViewModel>().inputTicker(value);
          logger.info(value);
        },
      ),
    );
  }
}
