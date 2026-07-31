import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Handles activation code validation and persistence.
///
/// Codes are never stored in plain text in the app — only their SHA-256
/// hashes live in [_validHashes]. To add or change codes, hash your new
/// code (see generate_hash.dart helper below) and add the hash here.
class ActivationManager {
  static const _prefsKey = 'ptube_activated';

  // Add the SHA-256 hash of each valid activation code here.
  // Example code "PTUBE-2026-XYZ1" -> its hash goes below.
  static const List<String> _validHashes = [
    // Replace these with your own generated hashes.
'3dde814b9121c5e7c8a2fdf456716fa554c258a0fa5010e122a150f8b8d6e4a9',
  ];

  static String _hash(String code) {
    final bytes = utf8.encode(code.trim());
    return sha256.convert(bytes).toString();
  }

  static bool isValidCode(String code) {
    final hashed = _hash(code);
    return _validHashes.contains(hashed);
  }

  static Future<bool> isActivated() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_prefsKey) ?? false;
  }

  static Future<void> setActivated() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_prefsKey, true);
  }

  /// Dev/testing helper only — clears activation so you can re-test the flow.
  static Future<void> reset() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_prefsKey);
  }
}
