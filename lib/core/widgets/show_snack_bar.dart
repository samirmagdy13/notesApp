import 'package:flutter/material.dart';
import 'package:notes_app/constant.dart';

void showSnackBar(BuildContext context, {required String messege}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(messege),
    backgroundColor: kPrimaryColor,
  ));
}
