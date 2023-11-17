import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../../core/presentation/styles/font_styles.dart';

class WebViewScreen extends StatefulWidget {
  final String pageUrl;
  const WebViewScreen({super.key, required this.pageUrl});

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  late final WebViewController controller;
  int loadingPercentage = 0;
  @override
  void initState() {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            setState(() {
              loadingPercentage = progress;
            });
          },
          onPageStarted: (String url) {
            setState(() {
              loadingPercentage = 0;
            });
          },
          onPageFinished: (String url) {
            setState(() {
              loadingPercentage = 100;
            });
          },
          onWebResourceError: (WebResourceError error) {},
          // onNavigationRequest: (NavigationRequest request) {
          //   if (request.url.startsWith(widget.pageUrl
          //       //'https://royamedicalcenter.com/price-list'
          //       )) {
          //     return NavigationDecision.prevent;
          //   }
          //   return NavigationDecision.navigate;
          // },
        ),
      )
      ..loadRequest(Uri.parse(widget.pageUrl));
    log('${widget.pageUrl}');
    super.initState();
  }

  // final controller = WebViewController()
  //  ..setJavaScriptMode(JavaScriptMode.disabled)
  //  ..loadRequest(Uri.parse('https://royamedicalcenter.com/price-list'));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Roya Medical Center ',
            style: FontStyles.priceListTitleFontStyle(context)),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Center(
          child: loadingPercentage < 100
              ? CircularProgressIndicator(
                  color: Theme.of(context).primaryColor,
                  strokeWidth: 5,
                  value: loadingPercentage / 100,
                )
              : WebViewWidget(controller: controller)),
    );
  }
}
