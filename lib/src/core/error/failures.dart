// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class Failure {
  String message;

  Failure({
    this.message = 'An unexpected error occurred',
  });
}

final class ServerFailure extends Failure {
  ServerFailure({
    required super.message,
  });
}

final class CacheFailure extends Failure {
  CacheFailure({
    required super.message,
  });
}
