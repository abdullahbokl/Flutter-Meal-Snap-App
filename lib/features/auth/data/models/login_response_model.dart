import '../../../../core/utils/app_strings.dart';

class LoginResponseModel {
  final String message;
  final String token;

  LoginResponseModel({
    required this.message,
    required this.token,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> jsonData) {
    return LoginResponseModel(
      message: jsonData[AppStrings.apiMessage],
      token: jsonData[AppStrings.apiToken],
    );
  }
}
