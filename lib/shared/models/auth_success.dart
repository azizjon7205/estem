
class AuthSuccess {
  final String token;
  final String refreshToken;

  AuthSuccess({
    required this.token,
    required this.refreshToken,
  });

  factory AuthSuccess.fromJson(Map<String, dynamic> json) =>
      AuthSuccess(token: json['token'], refreshToken: json['refresh_token']);

  Map<String, dynamic> toJson() => {};
}
