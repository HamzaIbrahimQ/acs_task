import 'dart:async';

import 'package:acs_task/ui/bloc/login_repository.dart';
import 'package:acs_task/utils/utility.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> with Utility {
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

  _mapLoginToState(LoginEvent event) async {
    checkInternetConnection().then((isConnect) {
      if (isConnect) {
        _loginRepository.login('malak21', '123').then((value) {
          if (value.errorCode == 0 && value.loginResponseDetails != null) {
            add(LoggedInSuccessfullyEvent());
          } else {
            add(LoginErrorEvent(
                errorMsg:
                    value.errorMessage ?? 'حدث خطا ما يرجى المحاولة لاحقا'));
          }
        });
      } else {
        add(LoginFailureEvent(
            errorMsg: 'تحقق من اتصالك بالانترنت ثم حاول مجددا'));
      }
    });
  }
}
