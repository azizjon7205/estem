class UploadFileResponse {
  dynamic id;
  String url;
  String? name;
  double? size;

  UploadFileResponse({
    this.id,
    required this.url,
    this.name,
    this.size,
  });

  UploadFileResponse copyWith({
    dynamic id,
    String? url,
    String? name,
    double? size,
  }) {
    return UploadFileResponse(
        url: url ?? this.url, name: name ?? this.name, size: size ?? this.size);
  }

  factory UploadFileResponse.fromJson(Map<String, dynamic> json) {
    return UploadFileResponse(
        id: json['id'],
        url: json['url'],
        name: json['name'],
        size: json['size']);
  }

  @override
  String toString() {
    return 'UploadFileResponse(url: $url, name: $name, size: $size)';
  }
}
