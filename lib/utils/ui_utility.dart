import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

mixin UiUtility {
  Widget getTextField(
      {required Key? key,
      required TextEditingController textController,
      required TextInputType keyboardType,
      IconData? icon,
      required BuildContext context,
      Color? iconColor,
      bool? enable,
      int? length,
      FocusNode? focusNode,
      String? regex,
      Color? textColor,
      required String hint,
      ValueChanged<String>? onSubmitted,
      required String fontFamily,
      double? fontSize,
      required BorderRadius border,
      bool? inDialog = true,
      Color? fillColor,
      bool? hasIcon,
      TextInputAction? textInputAction,
      String? errorMsg}) {
    return TextFormField(
      key: key,

      controller: textController,
      cursorColor: Colors.red,
      keyboardType: keyboardType,
      enabled: enable ?? true,
      focusNode: focusNode,
      // maxLength: 10,
      textInputAction: textInputAction,
      onChanged: (data) {
        data = textController.text;
        if (onSubmitted != null) {
          onSubmitted(data);
        }
      },
      maxLines: 1,
      validator: (data) => regex == null
          ? ''
          : (regex.allMatches(data ?? '')).isEmpty
              ? ''
              : '',
      decoration: InputDecoration(
        hintText: hint,
        errorText: errorMsg ?? '',
        errorMaxLines: 2,
        contentPadding: inDialog ?? false
            ? EdgeInsets.symmetric(vertical: 18.0.h, horizontal: 16.0.w)
            : EdgeInsets.symmetric(vertical: 26.0.h, horizontal: 16.0.w),
        errorStyle: TextStyle(
            fontSize: 12.0, color: Colors.red, fontFamily: fontFamily),
        filled: true,
        fillColor: fillColor ?? Colors.white,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(style: BorderStyle.none),
          // borderSide: const BorderSide(
          //     color: appPrimaryColor05, width: 0.5, style: BorderStyle.solid),
          borderRadius: border,
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(style: BorderStyle.none),

          // borderSide: const BorderSide(
          //   color: appPrimaryColor05,
          //   width: 0.5,
          //   style: BorderStyle.solid,
          // ),
          borderRadius: border,
        ),
        suffixIcon: hasIcon ?? false
            ? IconButton(
                onPressed: () {
                  textController.clear();
                },
                icon: const Icon(
                  Icons.clear,
                  color: Colors.grey,
                ),
              )
            : null,
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(style: BorderStyle.none),

          // borderSide: const BorderSide(
          //     color: appPrimaryColor05, width: 0.5, style: BorderStyle.solid),
          borderRadius: border,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(style: BorderStyle.none),

          // borderSide: const BorderSide(
          //     color: appPrimaryColor05, width: 0.5, style: BorderStyle.solid),
          borderRadius: border,
        ),
      ),
      style: TextStyle(
        fontSize: fontSize ?? 12,
        color: textColor ?? Colors.black,
        fontFamily: fontFamily,
      ),
    );
  }

  Widget? showToast(BuildContext context, String msg, {bool success = false}) {
    final FToast fToast = FToast();
    fToast.init(context);
    fToast.showToast(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
              decoration: BoxDecoration(
                  color: success ? Colors.green[400] : Colors.red[400],
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.error,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Text(
                        msg,
                      style: const TextStyle(color: Colors.white),
                       ),
                  ),
                ],
              )),
        ),
        toastDuration: const Duration(seconds: 2),
        gravity: ToastGravity.BOTTOM,
    );
    return null;
  }
}
