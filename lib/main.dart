import 'package:flutter/material.dart';
import 'package:income_life/di/di.dart';
import 'package:income_life/ui/top_page/top_page.dart';
import 'package:income_life/ui/top_page/top_page_view_model.dart';

void main() async {
  setUpDI();
  await TopPageViewModel().fetch();
  return runApp(const MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Income Life',
      home: TopPage(),
    );
  }
}
