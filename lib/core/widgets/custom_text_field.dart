import 'package:flutter/material.dart';
import 'package:notes_app/constant.dart';

class CustomTtextField extends StatelessWidget {
  const CustomTtextField({
    super.key,
    required this.hintText,
    this.maxlines = 1,
    this.onSaved,
    this.onChanged,
    this.enabledBorderColor,
    this.focusNode,
  });

  final int maxlines;
  final String hintText;
  final Function(String?)? onSaved;
  final void Function(String)? onChanged;
  final InputBorder? enabledBorderColor;
  final FocusNode? focusNode;
  
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      //autofocus: true,
      textInputAction: TextInputAction.search,
      focusNode: focusNode,
      onChanged: onChanged,
      onSaved: onSaved,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Field is required';
        } else {
          return null;
        }
      },
      maxLines: maxlines,
      decoration: InputDecoration(
        hintText: hintText,
        border: enabledBorderColor ?? outlineInputBorder(),
        enabledBorder: enabledBorderColor ?? outlineInputBorder(),
        focusedBorder: outlineInputBorder(kPrimaryColor),
      ),
    );
  }

  OutlineInputBorder outlineInputBorder([color]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: color ?? Colors.white,
      ),
    );
  }
}
