import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class AnimationText extends StatelessWidget {
  const AnimationText({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      totalRepeatCount: 1,
      animatedTexts: [
        WavyAnimatedText(
          'Notes App',
          textAlign: TextAlign.center,
          textStyle: const TextStyle(
            color: Color.fromARGB(255, 213, 213, 213),
            fontSize: 30,
          ),
        ),
      ],
    );
  }
}
