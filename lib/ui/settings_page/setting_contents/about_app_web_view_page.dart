// Flutter imports:
import 'package:flutter/material.dart';
import 'package:income_life/util/constants.dart';

// Package imports:
import 'package:webview_flutter/webview_flutter.dart';

class AboutAppWebViewPage extends StatefulWidget {
  const AboutAppWebViewPage({super.key});

  static Route<AboutAppWebViewPage> route() {
    return MaterialPageRoute<AboutAppWebViewPage>(
      builder: (_) => const AboutAppWebViewPage(),
    );
  }

  @override
  State<AboutAppWebViewPage> createState() => _AboutAppWebViewPageState();
}

class _AboutAppWebViewPageState extends State<AboutAppWebViewPage> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..loadRequest(
        Uri.parse(aboutAppUrl),
      );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About This App'),
        centerTitle: true,
        elevation: 0,
      ),
      body: WebViewWidget(
        controller: _controller,
      ),
    );
  }
}
