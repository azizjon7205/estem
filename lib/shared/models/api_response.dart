import 'package:flutter/foundation.dart';

import 'api_error.dart';

class ApiResponse<T> {
  const ApiResponse({
    required this.success,
    required this.data,
    required this.error,
  });

  final bool? success;
  final T? data;
  final ApiError? error;

  factory ApiResponse.fromJson(
      Map<String, dynamic> json, Function dataFromJson) {
    return ApiResponse(
      success: json["success"],
      data: json["data"] != null && json['data'].isNotEmpty
          ? dataFromJson(json["data"])
          : null,
      error: json["error"] != null ? ApiError.fromJson(json["error"]) : null,
    );
  }

  const ApiResponse.success(T data)
      : this(
          success: true,
          data: data,
          error: null,
        );

  const ApiResponse.error(ApiError error)
      : this(
          success: false,
          data: null,
          error: error,
        );

  Map<String, dynamic> toJson(Function(T? data) dataToJson) => {
        "success": success,
        "data": dataToJson(data),
        "error": error?.toJson(),
      };

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other.runtimeType != runtimeType) {
      return false;
    }
    if (other is ApiResponse) {
      return other.data is List
          ? listEquals(other.data, data as List)
          : other.data == data;
    }

    return false;
  }
}
