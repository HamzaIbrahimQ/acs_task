part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class Login extends LoginEvent {
  final BuildContext context;
  final String userName;
  final String password;

  Login(
      {required this.context, required this.userName, required this.password});
}

class LoggedInSuccessfullyEvent extends LoginEvent {
  final String? msg;

  LoggedInSuccessfullyEvent({this.msg});
}

class LoginErrorEvent extends LoginEvent {
  final String errorMsg;

  LoginErrorEvent({required this.errorMsg});
}

class LoginFailureEvent extends LoginEvent {
  final String errorMsg;

  LoginFailureEvent({required this.errorMsg});
}
