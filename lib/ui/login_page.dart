import 'package:acs_task/ui/bloc/login_bloc.dart';
import 'package:acs_task/utils/ui_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget with UiUtility {
  const LoginPage({Key? key}) : super(key: key);

  void _login(BuildContext context) {
    BlocProvider.of<LoginBloc>(context)
        .add(Login(context: context, userName: '', password: ''));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoggedInSuccessfullyState) {
          showToast(context, state.msg ?? 'تم تسجيل الدخول بنجاح', success: true);
        }
        if (state is LoginErrorState) {
          showToast(context, state.errorMsg);
        }
        if (state is LoginFailureState) {
          showToast(context, state.errorMsg);
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: Center(
              child: TextButton(
                child: const Text('تسجيل الدخول'),
                onPressed: () => _login(context),
              ),
            ),
          ),
        );
      }),
    );
  }
}
