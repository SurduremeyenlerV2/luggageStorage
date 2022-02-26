part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}
class AuthLoading extends AuthState {}
class AuthSucces extends AuthState {}
class AuthFailed extends AuthState {
  final String error;

  AuthFailed(this.error);
}
