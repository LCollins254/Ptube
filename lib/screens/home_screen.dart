import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

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
          return Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: YoutubePlayer(
                    controller: YoutubePlayerController(
                      initialVideoId: video['id']!,
                      flags: const YoutubePlayerFlags(autoPlay: false, mute: false),
                    ),
                    showVideoProgressIndicator: true,
                    progressColors: const ProgressBarColors(
                      playedColor: Color(0xFFFF3B3B),
                      handleColor: Color(0xFFFF3B3B),
                    ),
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
