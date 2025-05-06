import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class AppLocalization {
  final Locale locale;

  AppLocalization(this.locale);

  static AppLocalization of(BuildContext context) {
    return Localizations.of<AppLocalization>(context, AppLocalization)!;
  }

  static const Map<String, Map<String, String>> _localizedStrings = {
    'en': {
      'welcome': 'Welcome',
      'login': 'Login',
      'logout': 'Logout',
      'visitor': 'Visitor',
      'admin': 'Admin',
    },
    'pt': {
      'welcome': 'Bem-vindo',
      'login': 'Entrar',
      'logout': 'Sair',
      'visitor': 'Visitante',
      'admin': 'Administrador',
    },
  };

  String translate(String key) {
    return _localizedStrings[locale.languageCode]?[key] ?? key;
  }

  static const LocalizationsDelegate<AppLocalization> delegate =
      _AppLocalizationDelegate();
}

class _AppLocalizationDelegate
    extends LocalizationsDelegate<AppLocalization> {
  const _AppLocalizationDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'pt'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalization> load(Locale locale) async {
    return AppLocalization(locale);
  }

  @override
  bool shouldReload(_AppLocalizationDelegate old) => false;
}