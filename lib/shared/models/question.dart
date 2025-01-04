abstract class Question{
  String get questionType;
}

enum QuestionType {
  shortAnswer,
  longAnswer,
  email,
  number,
  select,
  checkbox,
  dropdown,
  linearScale,
  date,
  time,
  fileUpload,
  startRating,
  smile
}

extension on QuestionType {
  String get name {
    switch(this) {
      case QuestionType.shortAnswer: return 'Short answer';
      case QuestionType.longAnswer: return 'Long answer';
      case QuestionType.email: return 'Email';
      case QuestionType.number: return 'Number';
      case QuestionType.select: return 'Select';
      case QuestionType.checkbox: return 'Checkbox';
      case QuestionType.dropdown: return 'Dropdown';
      case QuestionType.linearScale: return 'Linear Scale';
      case QuestionType.date: return 'Date';
      case QuestionType.time: return 'Time';
      case QuestionType.fileUpload: return 'File Upload';
      case QuestionType.startRating: return 'Star Rating';
      case QuestionType.smile: return 'Smile';
    }
  }
}

extension on String {
  QuestionType get questionType {
    switch(this) {
      case "Short answer": return QuestionType.shortAnswer;
      default: return QuestionType.shortAnswer;
    }
  }
}