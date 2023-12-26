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
      AppStrings.signUpModelName: name,
      AppStrings.signUpModelEmail: email,
      AppStrings.signUpModelPassword: password,
    };
  }

  factory SignUpModel.fromJson(Map<String, dynamic> json) {
    return SignUpModel(
      name: json[AppStrings.signUpModelName],
      email: json[AppStrings.signUpModelEmail],
      password: json[AppStrings.signUpModelPassword],
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
