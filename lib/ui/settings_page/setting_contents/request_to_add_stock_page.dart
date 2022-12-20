// Flutter imports:
import 'package:flutter/material.dart';

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
      appBar: AppBar(
        title: Text('Request'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(child: Text('tes')),
    );
  }
}

// TODO: Gsheets上で3シート目に追加していく。