
import 'dart:ui';

enum AppLang { uzbek, russian, english}

extension AppLangExtension on AppLang {
  Locale get locale => Locale(code, region);

  String get code {
    switch (this) {
      case AppLang.uzbek:
        return 'uz';
      case AppLang.russian:
        return 'ru';
      case AppLang.english:
        return 'en';
    }
  }

  String get region {
    switch (this) {
      case AppLang.uzbek:
        return 'UZ';
      case AppLang.russian:
        return 'RU';
      case AppLang.english:
        return "EN";
    }
  }
}