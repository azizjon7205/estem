import 'app_lang.dart';

class Language {
  String flag;
  String label;
  AppLang lang;

  Language({
    required this.flag,
    required this.label,
    required this.lang,
  });
}

List<Language> dataLanguages() {
  return [
    Language(flag: 'assets/icons/ic_flag_uz.png', label: "Uzbek", lang: AppLang.uzbek),
    Language(flag: 'assets/icons/ic_flag_ru.png', label: "Russkiy", lang: AppLang.russian),
    Language(flag: 'assets/icons/ic_flag_en.png', label: "English", lang: AppLang.english),
  ];
}
