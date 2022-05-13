part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoggedInSuccessfullyState extends LoginState {
  final String? msg;

  LoggedInSuccessfullyState({this.msg});
}

class LoginErrorState extends LoginState {
  final String errorMsg;

  LoginErrorState({required this.errorMsg});
}

class LoginFailureState extends LoginState {
  final String errorMsg;

  LoginFailureState({required this.errorMsg});
}
