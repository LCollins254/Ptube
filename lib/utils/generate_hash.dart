// Run this with: dart run lib/utils/generate_hash.dart YOUR-CODE-HERE
// It prints the SHA-256 hash to paste into activation_manager.dart's
// _validHashes list. Keep the original code private — only the hash
// goes in the app.

import 'dart:convert';
import 'package:crypto/crypto.dart';

void main(List<String> args) {
  if (args.isEmpty) {
    print('Usage: dart run lib/utils/generate_hash.dart YOUR-CODE');
    return;
  }
  final code = args[0].trim();
  final hash = sha256.convert(utf8.encode(code)).toString();
  print('Code:  $code');
  print('Hash:  $hash');
  print('\nPaste the hash into _validHashes in activation_manager.dart');
}
