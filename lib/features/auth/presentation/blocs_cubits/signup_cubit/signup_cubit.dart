import 'package:appwrite/models.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/utils/service_locator.dart';
import '../../../data/models/signup_model.dart';
import '../../../data/repository/auth_repository.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());

  final authRepo = getIt<AuthRepo>();
  User? user;

  Future<void> signUp({
    required SignUpModel signUpModel,
  }) async {
    emit(SignupLoadingState());
    final result = await authRepo.signUp(
      signUpModel: signUpModel,
    );
    result.fold(
      (l) => emit(SignupErrorState(l.message)),
      (r) async {
        user = r;
        emit(SignupSuccessState());
      },
    );
  }
}
