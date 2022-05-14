import 'package:acs_task/component/bottom_section.dart';
import '../../component/back_arrow.dart';
import '../../component/header_section.dart';
import '../../component/second_login_choise.dart';
import 'package:acs_task/utils/ui_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> with UiUtility {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController firstNameControler;

  late TextEditingController lastNameControler;

  late TextEditingController emailOrPhoneControler;

  late TextEditingController passwordControler;

  late TextEditingController confirmPasswordControler;

  @override
  void initState() {
    firstNameControler = TextEditingController();
    lastNameControler = TextEditingController();
    emailOrPhoneControler = TextEditingController();
    passwordControler = TextEditingController();
    confirmPasswordControler = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    firstNameControler.dispose();
    lastNameControler.dispose();
    emailOrPhoneControler.dispose();
    passwordControler.dispose();
    confirmPasswordControler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Header(height: 0.26.sh),
                  Form(
                    key: _formKey,
                    child: Padding(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32),
                      child: Column(
                        children: [
                          Center(
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                  color: Colors.grey[700],
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Column(
                            children: <Widget>[
                              getTextField(
                                context: context,
                                textController: firstNameControler,
                                hint: 'First Name',
                                maxLength: 20,
                              ),
                              8.verticalSpace,
                              getTextField(
                                  context: context,
                                  textController: lastNameControler,
                                  hint: 'Last Name',
                                  maxLength: 20),
                              8.verticalSpace,
                              getTextField(
                                  context: context,
                                  textController: emailOrPhoneControler,
                                  hint: 'Email or Phone',
                                  maxLength: 20),
                              8.verticalSpace,
                              getTextField(
                                context: context,
                                textController: passwordControler,
                                hint: 'Password',
                                maxLength: 8,
                              ),
                              8.verticalSpace,
                              getTextField(
                                context: context,
                                textController: confirmPasswordControler,
                                hint: 'Confirm Password',
                                maxLength: 8,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  BottomSection(isHasLogin: false, signUpFunc: () {}),
                ],
              ),
            ),
            const BackArrow(),
          ],
        ),
        bottomSheet: Container(
            padding: EdgeInsetsDirectional.only(bottom: 16.h),
            child: const SecondLoginChoise()),
      ),
    );
  }
}
