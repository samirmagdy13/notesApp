// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'custom_search_icon.dart';

class CustomAppBar extends StatelessWidget {
  final String text;
  final Color color;
  final IconData icon;
  final Function()? onPressed;

  const CustomAppBar({
    Key? key,
    required this.text,
    required this.color,
    required this.icon,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text,
          style: TextStyle(fontSize: 24, color: color),
        ),
        const Spacer(),
        CustomSearchIcon(icon: icon, color: color, onPressed: onPressed),
      ],
    );
  }
}
