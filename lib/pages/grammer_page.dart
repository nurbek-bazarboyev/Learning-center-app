import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../components/task_item_page_components/task_item_app_bar.dart';

class GrammerTaskPage extends StatefulWidget {
  const GrammerTaskPage({super.key});

  @override
  State<GrammerTaskPage> createState() => _GrammerTaskPageState();
}

class _GrammerTaskPageState extends State<GrammerTaskPage> {
  final controller = WebViewController()
  ..setJavaScriptMode(JavaScriptMode.unrestricted)
  ..setBackgroundColor(const Color(0x00000000))
  ..setNavigationDelegate(
  NavigationDelegate(
  onProgress: (int progress) {
  // Update loading bar.
  },
  onPageStarted: (String url) {},
  onPageFinished: (String url) {},
  onWebResourceError: (WebResourceError error) {},
  onNavigationRequest: (NavigationRequest request) {
  if (request.url.startsWith('https://www.youtube.com/')) {
  return NavigationDecision.prevent;
  }
  return NavigationDecision.navigate;
  },
  ),
  )
  ..loadRequest(Uri.parse('https://www.busuu.com/en/english/grammar-rules'));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildTaskItemAppBar(context,"Grammer Homework"),
      body: WebViewWidget(controller: controller)
    );
  }


}
