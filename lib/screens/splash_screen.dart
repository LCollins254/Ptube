import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/activation_manager.dart';
import 'activation_screen.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _route();
  }

  Future<void> _route() async {
    // Kept deliberately short (300ms) so the app feels instant to open.
    await Future.delayed(const Duration(milliseconds: 300));
    final activated = await ActivationManager.isActivated();
    if (!mounted) return;
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => activated ? const HomeScreen() : const ActivationScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0F0F),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 96,
              height: 96,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [Color(0xFFFF3B3B), Color(0xFFC4001D)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: const Icon(Icons.play_arrow_rounded, color: Colors.white, size: 52),
            ),
            const SizedBox(height: 20),
            Text(
              'Ptube',
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.w700,
                letterSpacing: 1,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              'PREMIUM',
              style: GoogleFonts.poppins(
                color: const Color(0xFFFF3B3B),
                fontSize: 12,
                fontWeight: FontWeight.w500,
                letterSpacing: 6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
