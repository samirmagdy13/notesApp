import 'package:flutter/material.dart';
import '../../../../../core/widgets/custom_icon.dart';

class CustomAppBar extends StatelessWidget {
  final Function()? onPressed;

  const CustomAppBar({
    Key? key,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Edit Note',
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
        CustomSearchIcon(
          icon: Icons.check,
          color: Colors.white,
          onPressed: onPressed,
        ),
      ],
    );
  }
}
