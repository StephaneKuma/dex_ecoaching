import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'package:e_coaching/src/core/error/failures.dart';
import 'package:e_coaching/src/core/usecases/usecase.dart';
import 'package:e_coaching/src/core/entities/user.dart';
import 'package:e_coaching/src/features/authentication/domain/repositories/authentication_repository.dart';

@lazySingleton
class UserSignUp implements UseCase<User, UserSignUpParams> {
  final AuthenticationRepository repository;

  UserSignUp({required this.repository});

  @override
  Future<Either<Failure, User>> call({
    required UserSignUpParams params,
  }) async {
    return await repository.signUpWithEmailAndPassword(
      email: params.email,
      password: params.password,
    );
  }
}

class UserSignUpParams {
  final String email;
  final String password;

  UserSignUpParams({required this.email, required this.password});
}
