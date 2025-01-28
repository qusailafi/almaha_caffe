
 import 'package:flutter/material.dart';
 import 'package:webview_flutter/webview_flutter.dart';

import '../../../generated/l10n.dart';

   class AboutUsWebView extends StatefulWidget{
  @override
  State<AboutUsWebView> createState() => _WebViewExampleState();


}

class _WebViewExampleState extends State<AboutUsWebView> {
  late WebViewController _controller;
  bool _isLoading=true;
  @override
  void initState() {
    super.initState();
    if(_isLoading)
      Container(color: Colors.red,child:  CircularProgressIndicator(),);

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (url) {
            setState(() {
              _isLoading = true; // Show the loading indicator
            });
          },
          onPageFinished: (url) {
            setState(() {

              _isLoading = false; // Hide the loading indicator
            });
          },
          onWebResourceError: (error) {
            debugPrint('Error loading page: ${error.description}');
          },
        ),
      )

    ..loadRequest(
        Uri.parse('https://flutter.dev'),
      );

  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title:   Text(S.of(context).about_us),centerTitle: true,
      ),
      body:


      WebViewWidget(
        controller: _controller,


      ),
    );
  }
}