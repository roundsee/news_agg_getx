import 'dart:async';

import 'package:flutter/material.dart';
import 'package:new_agg/presentation/home_page_with_tab_page/controller/home_page_with_tab_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';

class WebViewNews extends StatefulWidget {
  final String newsUrl;
  WebViewNews({Key? key, required this.newsUrl}) : super(key: key);

  @override
  State<WebViewNews> createState() => _WebViewNewsState();
}

class _WebViewNewsState extends State<WebViewNews> {
  late final WebViewController controller;
  // HomePageWithTabController newsController = HomePageWithTabController();

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..loadRequest(
        //Uri.parse('https://flutter.dev'),
        Uri.parse(widget.newsUrl),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: WebViewWidget(
      controller: controller,
    ));
  }
}
