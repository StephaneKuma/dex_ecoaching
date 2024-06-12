import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'package:e_coaching/src/core/error/failures.dart';
import 'package:e_coaching/src/core/usecases/usecase.dart';
import 'package:e_coaching/src/core/entities/user.dart';
import 'package:e_coaching/src/features/authentication/domain/repositories/authentication_repository.dart';

@lazySingleton
class UserSignIn implements UseCase<User, UserSignInParams> {
  final AuthenticationRepository repository;

  UserSignIn({required this.repository});

  @override
  Future<Either<Failure, User>> call({
    required UserSignInParams params,
  }) async {
    return await repository.signInWithEmailAndPassword(
      email: params.email,
      password: params.password,
    );
  }
}

class UserSignInParams {
  final String email;
  final String password;

  UserSignInParams({required this.email, required this.password});
}
