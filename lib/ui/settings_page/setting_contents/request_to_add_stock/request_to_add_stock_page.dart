// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:income_life/ui/common/app_colors.dart';
import 'package:income_life/ui/common/notification_toast.dart';
import 'package:income_life/ui/settings_page/setting_contents/request_to_add_stock/request_to_add_stock_page_state.dart';
import 'package:income_life/ui/settings_page/setting_contents/request_to_add_stock/request_to_add_stock_page_view_model.dart';
import 'package:income_life/util/constants.dart';
import 'package:income_life/util/logger.dart';
import 'package:provider/provider.dart';

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
        title: const Text('Request'),
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
                const SizedBox(
                  width: double.infinity,
                  child: Text(
                    'Request Ticker',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                const SizedBox(height: kPadding),
                const Text(
                  'Please input the ticker you want to add and push send button. \n※ Some tickers cannot be added.',
                  style: TextStyle(color: AppColors.lightGrey60),
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
                    return SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            final isComplete = await context.read<RequestToAddStockPageViewModel>().request('test');
                            final message = isComplete ? 'Complete' : 'Failed to send. Try again later';
                            NotificationToast.showToast(context: context, message: message);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.teal,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(kBorder),
                          ),
                        ),
                        child: const Text('Send'),
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
        placeholder: 'ex ) XOM',
        padding: EdgeInsets.zero,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        style: const TextStyle(
          color: AppColors.lightGrey70,
          fontSize: 18,
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter some text';
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
