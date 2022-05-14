import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


mixin UiUtility {
  Widget getTextField({
    Key? key,
    required BuildContext context,
    required TextEditingController textController,
    int? maxLength,
    required String hint,
  }) {
    return TextFormField(
      controller: textController,
      textInputAction: TextInputAction.next,
      style: const TextStyle(
        color: Colors.black,
        decorationColor: Colors.black,
      ),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
          color: Colors.grey[700],
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xff7B5AAD)),
        ),
      ),
      validator: (value) {
        if (value?.isEmpty ?? false) {
          return 'This field is required';
        }
      },
    );
  }

  Widget? showToast(BuildContext context, String msg, {bool success = false}) {
    final FToast fToast = FToast();
    fToast.init(context);
    fToast.removeCustomToast();
    fToast.showToast(
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
      toastDuration: const Duration(seconds: 2),
      gravity: ToastGravity.BOTTOM,
    );
    return null;
  }
}