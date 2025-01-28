abstract class Question{
  QuestionType get questionType;
  dynamic id;
  String? image;
  String question;
  bool isRequired;

  Question({this.id, this.image, required this.question, required this.isRequired});

  Question copyWith({
    dynamic id,
    String? question,
    String? image,
    bool? isRequired,
  });

  Map<String, dynamic> toJson();
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
  starRating,
  smile
}

extension QuestionTypeExtension on QuestionType {
  String get type {
    switch(this) {
      case QuestionType.shortAnswer: return 'short_answer';
      case QuestionType.longAnswer: return 'long_answer';
      case QuestionType.email: return 'email';
      case QuestionType.number: return 'number';
      case QuestionType.select: return 'select';
      case QuestionType.checkbox: return 'checkbox';
      case QuestionType.dropdown: return 'dropdown';
      case QuestionType.linearScale: return 'linear_scale';
      case QuestionType.date: return 'date';
      case QuestionType.time: return 'time';
      case QuestionType.fileUpload: return 'file_upload';
      case QuestionType.starRating: return 'star_rating';
      case QuestionType.smile: return 'smile';
    }
  }

  String get title {
    switch(this) {
      case QuestionType.shortAnswer: return 'question.types.short_answer';
      case QuestionType.longAnswer: return 'question.types.long_answer';
      case QuestionType.email: return 'question.types.email';
      case QuestionType.number: return 'question.types.number';
      case QuestionType.select: return 'question.types.select';
      case QuestionType.checkbox: return 'question.types.checkbox';
      case QuestionType.dropdown: return 'question.types.dropdown';
      case QuestionType.linearScale: return 'question.types.linear_scale';
      case QuestionType.date: return 'question.types.date';
      case QuestionType.time: return 'question.types.time';
      case QuestionType.fileUpload: return 'question.types.file_upload';
      case QuestionType.starRating: return 'question.types.star_rating';
      case QuestionType.smile: return 'question.types.smile';
    }
  }

  String get hint {
    switch(this) {
      case QuestionType.shortAnswer: return 'question.hints.short_answer';
      case QuestionType.longAnswer: return 'question.hints.long_answer';
      case QuestionType.email: return 'question.hints.email';
      case QuestionType.number: return 'question.hints.number';
      case QuestionType.select: return 'question.hints.select';
      case QuestionType.checkbox: return 'question.hints.checkbox';
      case QuestionType.dropdown: return 'question.hints.dropdown';
      case QuestionType.linearScale: return 'question.hints.linear_scale';
      case QuestionType.date: return 'question.hints.date';
      case QuestionType.time: return 'question.hints.time';
      case QuestionType.fileUpload: return 'question.hints.file_upload';
      case QuestionType.starRating: return 'question.hints.star_rating';
      case QuestionType.smile: return 'question.hints.smile';
    }
  }
}

extension QuestionExtentionOnString on String {
   QuestionType get question {
    switch(this) {
      case "short_answer": return QuestionType.shortAnswer;
      case "long_answer": return QuestionType.longAnswer;
      case "email": return QuestionType.email;
      case "number": return QuestionType.number;
      case "select": return QuestionType.select;
      case "checkbox": return QuestionType.checkbox;
      case "dropdown": return QuestionType.dropdown;
      case "linear_scale": return QuestionType.linearScale;
      case "date": return QuestionType.date;
      case "time": return QuestionType.time;
      case "file_upload": return QuestionType.fileUpload;
      case "star_rating": return QuestionType.starRating;
      case "smile": return QuestionType.smile;
      default: return QuestionType.shortAnswer;
    }
  }
}