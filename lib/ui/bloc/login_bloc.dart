import 'dart:async';

import 'package:acs_task/ui/bloc/login_repository.dart';
import 'package:acs_task/utils/progress_hud.dart';
import 'package:acs_task/utils/ui_utility.dart';
import 'package:acs_task/utils/utility.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> with Utility, UiUtility {
  final LoginRepository _loginRepository = LoginRepository();

  LoginBloc() : super(LoginInitial()) {
    on<Login>((event, emit) {
      _mapLoginToState(event);
    });
    on<LoggedInSuccessfullyEvent>((event, emit) {
      emit.call(LoggedInSuccessfullyState());
    });
    on<LoginErrorEvent>((event, emit) {
      emit.call(LoginErrorState(errorMsg: event.errorMsg));
    });
    on<LoginFailureEvent>((event, emit) {
      emit.call(LoginFailureState(errorMsg: event.errorMsg));
    });
  }

  _mapLoginToState(Login event) async {
    checkInternetConnection().then((isConnect) {
      if (isConnect) {
        _loginRepository.login(event.userName, event.password).then((value) {
          if (value.errorCode == 0 && value.loginResponseDetails != null) {
            add(LoggedInSuccessfullyEvent());
            ProgressHud.shared.stopLoading();
            // showToast(event.context, 'userName is : ${event.userName} and password is : ${event.password}', success: true);
          } else {
            add(
              LoginErrorEvent(
                errorMsg:
                    value.errorMessage ?? 'An error was occurred try again later',
              ),
            );
            ProgressHud.shared.stopLoading();
          }
        });
      } else {
        add(
          LoginFailureEvent(
            errorMsg: 'Please check your internet connection',
          ),
        );
        ProgressHud.shared.stopLoading();
      }
    });
  }
}
