import 'package:dartz/dartz.dart';

import 'package:e_coaching/src/core/error/failures.dart';
import 'package:e_coaching/src/core/entities/user.dart';

abstract class AuthenticationRepository {
  Future<Either<Failure, User>> signUpWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<Either<Failure, User>> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<Either<Failure, User>> currentUser();
}
