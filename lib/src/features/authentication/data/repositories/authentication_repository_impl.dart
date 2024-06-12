import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:e_coaching/src/core/error/exceptions.dart';
import 'package:e_coaching/src/core/error/failures.dart';
import 'package:e_coaching/src/features/authentication/data/datasources/authentication_remote_datasource.dart';
import 'package:e_coaching/src/features/authentication/data/models/user_model.dart';
import 'package:e_coaching/src/features/authentication/domain/repositories/authentication_repository.dart';

@LazySingleton(as: AuthenticationRepository)
class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationRemoteDatasource remoteDatasource;

  AuthenticationRepositoryImpl({required this.remoteDatasource});

  @override
  Future<Either<Failure, UserModel>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    return _getUser(
      fn: () async => await remoteDatasource.signInWithEmailAndPassword(
        email: email,
        password: password,
      ),
    );
  }

  @override
  Future<Either<Failure, UserModel>> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    return _getUser(
      fn: () async => await remoteDatasource.signUpWithEmailAndPassword(
        email: email,
        password: password,
      ),
    );
  }

  Future<Either<Failure, UserModel>> _getUser({
    required Future<UserModel> Function() fn,
  }) async {
    try {
      final UserModel user = await fn();
      return Right(user);
    } on AuthException catch (e) {
      return Left(ServerFailure(message: e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, UserModel>> currentUser() async {
    try {
      final user = await remoteDatasource.currentUser();

      if (user == null) {
        final String message = Intl.getCurrentLocale() == 'en'
            ? "User is not logged in"
            : "Utilisateur n'est pas connecté";
        return Left(ServerFailure(message: message));
      }

      return Right(user);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }
}
