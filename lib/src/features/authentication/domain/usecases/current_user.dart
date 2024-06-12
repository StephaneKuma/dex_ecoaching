import 'package:dartz/dartz.dart';
import 'package:e_coaching/src/core/error/failures.dart';
import 'package:e_coaching/src/core/usecases/usecase.dart';
import 'package:e_coaching/src/core/entities/user.dart';
import 'package:e_coaching/src/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class CurrentUser implements UseCase<User, NoParams> {
  final AuthenticationRepository repository;

  CurrentUser({required this.repository});

  @override
  Future<Either<Failure, User>> call({required NoParams params}) async {
    return await repository.currentUser();
  }
}

class NoParams {}
