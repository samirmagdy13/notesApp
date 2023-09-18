import 'package:flutter/material.dart';
import 'package:notes_app/constant.dart';

class CustomMatrialButton extends StatelessWidget {
  final String text;
  final bool isLoading;
  final VoidCallback? onPressed;

  const CustomMatrialButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: kPrimaryColor,
      //elevation: 20,
      height: 60,
      minWidth: MediaQuery.of(context).size.width,
      textColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: isLoading
          ? const CircularProgressIndicator(
              // backgroundColor: Colors.black,
              color: Colors.black,
            )
          : Text(
              text,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
    );
  }
}
