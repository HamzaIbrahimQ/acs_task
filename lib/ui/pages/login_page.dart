import 'package:acs_task/component/bottom_section.dart';
import 'package:acs_task/ui/bloc/login_bloc.dart';
import '../../component/back_arrow.dart';
import '../../component/header_section.dart';
import 'package:acs_task/utils/progress_hud.dart';
import '../../component/second_login_choise.dart';
import 'package:acs_task/utils/ui_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with UiUtility {
  String email = '';
  String password = '';

  void _login(BuildContext context) {
    ProgressHud.shared.startLoading(context);
    BlocProvider.of<LoginBloc>(context).add(Login(
        context: context,
        userName: emailController.text.trim(),
        password: passwordController.text.trim()));
  }

  void _submit() {
    if (!(_formKey.currentState?.validate() ?? false)) {
      // Invalid!
      return;
    } else {
      _formKey.currentState?.save();
      _login(context);
    }
  }

  final _formKey = GlobalKey<FormState>();

  late TextEditingController emailController;

  late TextEditingController passwordController;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoggedInSuccessfullyState) {
          showToast(context, state.msg ?? 'Logged in successfully',
              success: true);
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
            body: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Header(height: 0.26.sh),
                      SizedBox(
                        height: 0.4.sh,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 32),
                              child: Center(
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                      color: Colors.grey[700],
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Form(
                              key: _formKey,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 24.0, vertical: 32),
                                child: Column(
                                  children: [
                                    Column(
                                      children: <Widget>[
                                        getTextField(
                                          context: context,
                                          textController: emailController,
                                          hint: 'Email, Username of Phone',
                                          maxLength: 20,
                                        ),
                                        24.verticalSpace,
                                        getTextField(
                                          context: context,
                                          textController: passwordController,
                                          hint: 'Password',
                                          maxLength: 20,
                                        ),
                                        Container(
                                          alignment: Alignment.centerRight,
                                          padding: EdgeInsets.only(top: 16.h),
                                          child: InkWell(
                                            onTap: () {},
                                            child: Text(
                                              'Forget Password?',
                                              style: TextStyle(
                                                  color: Colors.grey[600]),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      BottomSection(isHasSignUp: false, loginFunc: _submit),
                    ],
                  ),
                ),
                const BackArrow(),
              ],
            ),
            bottomSheet: Container(
                padding: EdgeInsetsDirectional.only(bottom: 16.h),
                child: const SecondLoginChoise(
                  isFromLogin: true,
                )),
          ),
        );
      }),
    );
  }
}