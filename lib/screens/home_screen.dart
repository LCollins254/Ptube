import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // Replace with your own curated list of YouTube video IDs.
  static const List<Map<String, String>> _videos = [
    {'id': 'dQw4w9WgXcQ', 'title': 'Sample Video 1'},
    {'id': 'jNQXAC9IVRw', 'title': 'Sample Video 2'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0F0F),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F0F0F),
        elevation: 0,
        title: Text(
          'Ptube',
          style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: _videos.length,
        itemBuilder: (context, index) {
          final video = _videos[index];
          final embedUrl =
              'https://www.youtube.com/embed/${video['id']}?playsinline=1&rel=0';
          final controller = WebViewController()
            ..setJavaScriptMode(JavaScriptMode.unrestricted)
            ..loadRequest(
              Uri.parse(embedUrl),
              headers: {'Referer': 'https://www.youtube.com'},
            );

          return Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: SizedBox(
                    height: 220,
                    child: WebViewWidget(controller: controller),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  video['title']!,
                  style: GoogleFonts.poppins(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
