// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BaseWebViewArguments {
  BaseWebViewArguments({
    required this.title,
    required this.url,
    required this.needAppBar,
  });
  final String title;
  final String url;
  final bool needAppBar;
}

class BaseWebView extends StatefulWidget {
  const BaseWebView({super.key});

  static Route<BaseWebView> route({
    required String title,
    required String url,
    bool needAppBar = true,
  }) {
    return MaterialPageRoute<BaseWebView>(
      builder: (_) => Provider.value(
        value: BaseWebViewArguments(
          title: title,
          url: url,
          needAppBar: needAppBar,
        ),
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
    final needAppBar = context.select((BaseWebViewArguments value) => value.needAppBar);
    _controller.loadRequest(
      Uri.parse(
        context.select((BaseWebViewArguments value) => value.url),
      ),
    );
    return SafeArea(
      child: Scaffold(
        appBar: needAppBar
            ? AppBar(
                title: Text(
                  context.select((BaseWebViewArguments value) => value.title),
                ),
                centerTitle: true,
                elevation: 0,
              )
            : null,
        body: WebViewWidget(
          controller: _controller,
        ),
      ),
    );
  }
}
