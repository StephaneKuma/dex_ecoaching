part of 'authentication_bloc.dart';

sealed class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

final class AuthenticationSignedUp extends AuthenticationEvent {
  final String email;
  final String password;

  const AuthenticationSignedUp({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}

final class AuthenticationSignedIn extends AuthenticationEvent {
  final String email;
  final String password;

  const AuthenticationSignedIn({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}

final class AuthenticationUserIsLoggedIn extends AuthenticationEvent {}
