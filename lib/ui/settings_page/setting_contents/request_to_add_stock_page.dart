// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class RequestToAddStockPage extends StatelessWidget {
  const RequestToAddStockPage({super.key});

  static Route<RequestToAddStockPage> route() {
    return MaterialPageRoute<RequestToAddStockPage>(
      builder: (_) => const RequestToAddStockPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('test'),
      ),
    );
  }
}
