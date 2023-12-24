import '../../../../core/utils/app_strings.dart';

class LoginRequestModel {
  final String email;
  final String password;

  LoginRequestModel({required this.email, required this.password});

  Map<String, dynamic> toJson() {
    return {
      AppStrings.apiEmail: email,
      AppStrings.apiPassword: password,
    };
  }
}
