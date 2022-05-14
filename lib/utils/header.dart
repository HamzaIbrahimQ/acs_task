import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final double height;

  const Header({
    Key? key,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
        gradient: LinearGradient(colors: [
          Color(0xffA28BC5),
          Color(0xff977DBF),
          Color(0xff8E72B9),
          Color(0xff8668B4),
          Color(0xff8262B2),
          Color(0xff7B5AAD),
        ]),
      ),
      child: Center(
        child: Image.asset(
          'assets/car_logo.png',
        ),
      ),
    );
  }
}