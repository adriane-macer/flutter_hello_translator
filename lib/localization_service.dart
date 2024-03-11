import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LocalizationService {
  static LocalizationService? _singleton;

  StreamController<Locale> streamController = StreamController.broadcast();

  LocalizationService._();

  final List<String> languageOrder = [
    "en",
    "fr",
    "es",
    "de",
    "it",
    "pt",
    "ja",
    "ko",
    "zh",
    "ar",
    "ru",
    "hi"
  ];

  LocalizationService createInstance() {
    return LocalizationService();
  }

  factory LocalizationService() {
    return _singleton ??= LocalizationService._();
  }

  Timer? _timer;
  final languages = AppLocalizations.supportedLocales;
  final int numberOfLanguages = AppLocalizations.supportedLocales.length;
  int currentLanguageIndex = 0;

  void initializeLanguageTimer() {
    _timer = Timer.periodic(const Duration(milliseconds: 2500), (timer) {
      final currentLanguage = languageOrder.elementAt(currentLanguageIndex);

      final localIndex = languages.indexWhere(
          (Locale element) => element.languageCode == currentLanguage);

      streamController.add(languages.elementAt(localIndex));

      currentLanguageIndex++;
      if (currentLanguageIndex >= numberOfLanguages) {
        currentLanguageIndex = 0;
      }
    });
  }

  void dispose() {
    _timer?.cancel();
    _timer = null;
    streamController.close();
  }
}
