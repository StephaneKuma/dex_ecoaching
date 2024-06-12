import 'package:dartz/dartz.dart';
import 'package:e_coaching/src/core/error/failures.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call({required Params params});
}
