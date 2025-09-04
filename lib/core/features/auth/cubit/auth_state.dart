part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}
final class AutLoginLLoadingState extends AuthState {}
final class AuthRegisterSuccessState extends AuthState {
  final   Map<String, dynamic> data;

  AuthRegisterSuccessState({required this.data});
}
final class AuthLoginSuccessState extends AuthState {
  final   Map<String, dynamic> data;

  AuthLoginSuccessState({required this.data});
}
