// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BaseWebViewArguments {
  BaseWebViewArguments({
    required this.title,
    required this.url,
  });
  final String title;
  final String url;
}

class BaseWebView extends StatefulWidget {
  const BaseWebView({super.key});

  static Route<BaseWebView> route({
    required String title,
    required String url,
  }) {
    return MaterialPageRoute<BaseWebView>(
      builder: (_) => Provider.value(
        value: BaseWebViewArguments(title: title, url: url),
        child: const BaseWebView(),
      ),
    );
  }

  @override
  State<BaseWebView> createState() => _BaseWebViewState();
}

class _BaseWebViewState extends State<BaseWebView> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.loadRequest(
      Uri.parse(
        context.select((BaseWebViewArguments value) => value.url),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.select((BaseWebViewArguments value) => value.title),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: WebViewWidget(
        controller: _controller,
      ),
    );
  }
}
