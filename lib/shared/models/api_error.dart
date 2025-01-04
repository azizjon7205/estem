
class ApiError implements Exception {
  final String? message;
  final dynamic code;

  ApiError({
    this.message,
    this.code,
  });

  @override
  String toString() {
    return message ?? '';
  }

  factory ApiError.fromJson(Map<String, dynamic> json) =>
      ApiError(
        message: json['message'],
        code: json['code']
      );

  Map<String, dynamic> toJson() => {};
}
