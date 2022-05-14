import 'package:acs_task/ui/login_page.dart';
import 'package:acs_task/ui/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SecondLoginChoise extends StatelessWidget {
  final bool isFromLogin;

  const SecondLoginChoise({this.isFromLogin = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
            isFromLogin ? 'Dont\'t have account?' : 'Already have an account?'),
        4.horizontalSpace,
        InkWell(
            onTap: () {
              if (isFromLogin) {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SignUpPage()));
              } else {
                Navigator.of(context).pop();
              }
            },
            child: Text(
              isFromLogin ? 'Sign Up' : 'Login',
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.grey[750]),
            )),
      ],
    );
  }
}
