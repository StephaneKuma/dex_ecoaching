import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:e_coaching/src/core/error/exceptions.dart';
import 'package:e_coaching/src/features/authentication/data/models/user_model.dart';

abstract class AuthenticationRemoteDatasource {
  Session? get currentUserSession;

  Future<UserModel> signUpWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<UserModel> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<UserModel?> currentUser();
}

@LazySingleton(as: AuthenticationRemoteDatasource)
class AuthenticationRemoteDatasourceImpl
    implements AuthenticationRemoteDatasource {
  final SupabaseClient client;

  AuthenticationRemoteDatasourceImpl({required this.client});

  @override
  Session? get currentUserSession => client.auth.currentSession;

  @override
  Future<UserModel> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final AuthResponse response = await client.auth.signInWithPassword(
        email: email,
        password: password,
      );

      if (response.user == null) {
        final String message = Intl.getCurrentLocale() == 'en'
            ? "User is null"
            : "Utilisateur est null";

        throw ServerException(message: message);
      }

      return UserModel.fromMap(response.user!.toJson());
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<UserModel> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final AuthResponse response = await client.auth.signUp(
        email: email,
        password: password,
      );

      if (response.user == null) {
        final String message = Intl.getCurrentLocale() == 'en'
            ? "User is null"
            : "Utilisateur est null";

        throw ServerException(message: message);
      }

      return UserModel.fromMap(response.user!.toJson());
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<UserModel?> currentUser() async {
    try {
      if (currentUserSession != null) {
        final List<Map<String, dynamic>> response = await client
            .from('profiles')
            .select()
            .eq('id', currentUserSession!.user.id);

        return UserModel.fromMap(response.first);
      }

      return null;
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}
