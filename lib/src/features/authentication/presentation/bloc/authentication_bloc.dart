import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:e_coaching/src/core/commons/cubits/app_user/app_user_cubit.dart';
import 'package:e_coaching/src/core/error/failures.dart';
import 'package:e_coaching/src/core/entities/user.dart';
import 'package:e_coaching/src/features/authentication/domain/usecases/current_user.dart';
import 'package:e_coaching/src/features/authentication/domain/usecases/user_sign_in.dart';
import 'package:e_coaching/src/features/authentication/domain/usecases/user_sign_up.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

@lazySingleton
class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserSignUp _signUp;
  final UserSignIn _signIn;
  final CurrentUser _currentUser;
  final AppUserCubit _userCubit;

  AuthenticationBloc({
    required UserSignUp signUp,
    required UserSignIn signIn,
    required CurrentUser currentUser,
    required AppUserCubit userCubit,
  })  : _signUp = signUp,
        _signIn = signIn,
        _currentUser = currentUser,
        _userCubit = userCubit,
        super(AuthenticationInitial()) {
    on<AuthenticationSignedUp>(_onAuthSignedUp);
    on<AuthenticationSignedIn>(_onAuthSignedIn);
    on<AuthenticationUserIsLoggedIn>(_onAuthIsLoggedIn);
  }

  void _onAuthSignedUp(
    AuthenticationSignedUp event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(AuthenticationLoading());

    final Either<Failure, User> response = await _signUp.call(
      params: UserSignUpParams(
        email: event.email,
        password: event.password,
      ),
    );

    response.fold(
      (failure) => emit(AuthenticationFailure(message: failure.message)),
      (user) => _emitAuthSuccess(user, emit),
    );
  }

  void _onAuthSignedIn(
    AuthenticationSignedIn event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(AuthenticationLoading());

    final Either<Failure, User> response = await _signIn.call(
      params: UserSignInParams(
        email: event.email,
        password: event.password,
      ),
    );

    response.fold(
      (failure) => emit(AuthenticationFailure(message: failure.message)),
      (user) => _emitAuthSuccess(user, emit),
    );
  }

  FutureOr<void> _onAuthIsLoggedIn(
    AuthenticationUserIsLoggedIn event,
    Emitter<AuthenticationState> emit,
  ) async {
    final Either<Failure, User> response = await _currentUser.call(
      params: NoParams(),
    );

    response.fold(
      (failure) => emit(AuthenticationFailure(message: failure.message)),
      (user) {
        return _emitAuthSuccess(user, emit);
      },
    );
  }

  void _emitAuthSuccess(
    User user,
    Emitter<AuthenticationState> emit,
  ) {
    _userCubit.update(user);

    emit(AuthenticationSuccess(user: user));
  }
}
