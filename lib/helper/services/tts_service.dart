import 'package:flutter_tts/flutter_tts.dart';

class TtsService {
  TtsService._() {
    _tts.setPitch(1.5);
    // _tts.setSpeechRate(0.45);
  }

  static final TtsService instance = TtsService._();
  final FlutterTts _tts = FlutterTts();

  Future<void> speak(String text, [double? soundFast]) async {
    await _configureLanguage();
    if (soundFast == null) {
      _tts.setSpeechRate(0.45);
      // default
    } else {
      _tts.setSpeechRate(soundFast);
    }

    await _tts.speak(text.toString());
  }

  Future<void> stop() async {
    await _tts.stop();
  }

  Future<void> _configureLanguage() async {
    try {
      await _tts.setLanguage('ar');
    } catch (_) {
      try {
        await _tts.setLanguage('ar');
      } catch (_) {}
    }
  }
}
