// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'di/di.dart';
import 'ui/top_page/top_page.dart';

void main() {
  setUpDI();
  return runApp(const MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Income Life',
      theme: ThemeData.dark(),
      home: const TopPage(),
    );
  }
}
