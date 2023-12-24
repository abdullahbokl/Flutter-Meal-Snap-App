import '../../../../core/utils/app_strings.dart';

class ResetPasswordModel {
  final String email;
  final String password;
  final String confirmPassword;
  final String code;

  ResetPasswordModel({
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.code,
  });

  Map<String, dynamic> toJson() {
    return {
      AppStrings.apiEmail: email,
      AppStrings.apiPassword: password,
      AppStrings.apiConfirmPassword: confirmPassword,
      AppStrings.apiCode: code,
    };
  }
}
