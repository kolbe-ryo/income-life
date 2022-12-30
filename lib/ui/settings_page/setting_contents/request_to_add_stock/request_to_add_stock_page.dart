// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:income_life/ui/common/app_colors.dart';
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
                Provider.value(
                  value: formKey,
                  child: const _TextField(),
                ),
                const SizedBox(height: kPadding),
                Builder(
                  builder: (context) {
                    return ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          context.read<RequestToAddStockPageViewModel>().request('test');
                          // TODO: Success Confirmation
                        }
                      },
                      child: Text('Send'),
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

// TODO: 検索バーの修正

class _TextField extends StatelessWidget {
  const _TextField();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Form(
        key: context.watch<GlobalKey<FormState>>(),
        child: CupertinoTextFormFieldRow(
          controller: context.read<RequestToAddStockPageViewModel>().controller,
          cursorColor: AppColors.darkGrey,
          cursorWidth: 1,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          padding: const EdgeInsets.symmetric(horizontal: kPadding),
          placeholder: 'ex ) XOM',
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
      ),
    );
  }
}
