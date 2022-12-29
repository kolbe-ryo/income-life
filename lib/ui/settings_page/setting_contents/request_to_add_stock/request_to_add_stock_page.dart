// Flutter imports:
import 'package:flutter/material.dart';
import 'package:income_life/ui/settings_page/setting_contents/request_to_add_stock/request_to_add_stick_page_view_model.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Request'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          TextField(),
          ElevatedButton(
            onPressed: () => context.read<RequestToAddStockPageViewModel>().request('test'),
            child: Text('test'),
          ),
        ],
      ),
    );
  }
}
