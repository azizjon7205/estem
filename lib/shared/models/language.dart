class Language {
  String flag;
  String label;

  Language({
    required this.flag,
    required this.label,
  });
}

List<Language> dataLanguages() {
  return [
    Language(flag: 'assets/icons/ic_flag_uz.png', label: "Uzbek"),
    Language(flag: 'assets/icons/ic_flag_ru.png', label: "Russkiy"),
    Language(flag: 'assets/icons/ic_flag_en.png', label: "English"),
  ];
}
