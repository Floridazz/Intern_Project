part of 'authentication_bloc.dart';

// @immutable
// sealed class AuthenticationState {}

// final class AuthenticationInitial extends AuthenticationState {}

enum AuthenticationStatus { authenticated, unauthenticated, unknown }

class AuthenticationState extends Equatable {
  final AuthenticationStatus status;
  final User? user;

  const AuthenticationState._(
      {this.status = AuthenticationStatus.unknown, this.user});

  //* Constructor when no info about the AuthenticationStatus of current user
  const AuthenticationState.unknown() : this._();

  //* Constructor when current user is authenticated
  const AuthenticationState.authenticated(User user)
      : this._(status: AuthenticationStatus.authenticated, user: user);

  //* Constructor when current user is unauthenticated
  const AuthenticationState.unauthenticated()
      : this._(status: AuthenticationStatus.unauthenticated);

  @override
  List<Object?> get props => [status, user];
}
