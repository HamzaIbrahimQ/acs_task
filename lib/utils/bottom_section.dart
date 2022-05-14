import 'package:acs_task/ui/bloc/login_bloc.dart';
import 'package:acs_task/ui/login_page.dart';
import 'package:acs_task/ui/signup_page.dart';
import 'package:acs_task/utils/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class BottomSection extends StatelessWidget {
  final bool isHasLogin;
  final bool isHasSignUp;
  final VoidCallback? loginFunc;
  final VoidCallback? signUpFunc;

  const BottomSection(
      {Key? key,
      this.isHasLogin = true,
      this.isHasSignUp = true,
      this.loginFunc,
        this.signUpFunc,
      })
      : super(key: key);

  _goToLoginPage(BuildContext context) {
    Navigator.of(context).push<void>(
      MaterialPageRoute(
        builder: (ctx) => BlocProvider(
          create: (context) => LoginBloc(),
          child: LoginPage(),
        ),
      ),
    );
  }

  _goToSignUpPage(BuildContext context) {
    Navigator.of(context).push<void>(
      MaterialPageRoute(
        builder: (ctx) => SignUpPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 0.25.sh,
      child: Column(
        children: [
          if (isHasLogin)
            CustomButton(
                title: 'Login',
                isGradient: true,
                onButtonPressed: loginFunc ?? () {
                    loginFunc ?? _goToLoginPage(context);
                }),
          8.verticalSpace,
          if (isHasSignUp)
            CustomButton(
              title: 'Sign Up',
              isGradient: true,
              onButtonPressed: signUpFunc ?? () => _goToSignUpPage(context),
            ),
          isHasLogin || isHasSignUp ? 8.verticalSpace : 106.verticalSpace,
          CustomButton(
              title: 'Connect with Facebook',
              onButtonPressed: () {},
              hasIcon: true,
              icon: MdiIcons.facebook,
              isFacebook: true),
          isHasLogin || isHasSignUp ? 8.verticalSpace : 60.verticalSpace,
          CustomButton(
            title: 'Connect with Google',
            onButtonPressed: () {},
            hasIcon: true,
            icon: MdiIcons.googlePlus,
          ),
        ],
      ),
    );
  }
}
