import 'package:meal_snap/core/utils/app_strings.dart';

class SignUpModel {
  String name;
  String email;
  String password;

  SignUpModel({
    required this.name,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      AppStrings.signUpName: name,
      AppStrings.signUpEmail: email,
      AppStrings.signUpPassword: password,
    };
  }

  factory SignUpModel.fromJson(Map<String, dynamic> json) {
    return SignUpModel(
      name: json[AppStrings.signUpName],
      email: json[AppStrings.signUpEmail],
      password: json[AppStrings.signUpPassword],
    );
  }

  SignUpModel copyWith({
    String? name,
    String? email,
    String? password,
  }) {
    return SignUpModel(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
