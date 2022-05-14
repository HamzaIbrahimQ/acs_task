import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatefulWidget {
  final String title;
  final VoidCallback onButtonPressed;
  final bool isGradient;
  final bool hasIcon;
  final IconData? icon;
  final bool isFacebook;

  const CustomButton({
    Key? key,
    required this.title,
    required this.onButtonPressed,
    this.isGradient = false,
    this.hasIcon = false,
    this.icon,
    this.isFacebook = false,
  }) : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 0.9.sw,
      height: 0.05.sh,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: widget.isGradient ? null : Colors.white,
        gradient: widget.isGradient
            ? const LinearGradient(colors: [
                Color(0xffA28BC5),
                Color(0xff977DBF),
                Color(0xff8E72B9),
              ])
            : null,
      ),
      child: ElevatedButton(
        child: Row(
          mainAxisAlignment: widget.hasIcon
              ? MainAxisAlignment.start
              : MainAxisAlignment.center,
          children: [
            if (widget.hasIcon && widget.icon != null)
              Icon(
                widget.icon,
                color: widget.isFacebook ? Colors.blue : Colors.red,
              ),
            if (widget.hasIcon) 56.horizontalSpace,
            Text(
              widget.title,
              style: TextStyle(
                color: widget.hasIcon ? Colors.black : Colors.white,
              ),
            ),
          ],
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
              widget.hasIcon ? Colors.white : Colors.transparent),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                15.0,
              ),
            ),
          ),
        ),
        onPressed: () {
          widget.onButtonPressed();
        },
      ),
    );
  }
}