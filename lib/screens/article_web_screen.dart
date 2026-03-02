import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleWebScreen extends StatefulWidget {
  final String title;
  final String url;

  const ArticleWebScreen({
    super.key,
    required this.title,
    required this.url,
  });

  @override
  State<ArticleWebScreen> createState() => _ArticleWebScreenState();
}

class _ArticleWebScreenState extends State<ArticleWebScreen> {
  bool isLoading = true;

  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (_) => setState(() => isLoading = false),
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children: [
          WebViewWidget(controller: _controller),
          if (isLoading)
            const Center(child: CircularProgressIndicator()),
        ],
      ),
    );
  }
}