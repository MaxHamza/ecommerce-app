import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CustomRichText extends StatelessWidget {
  const CustomRichText({super.key, required this.title1, required this.title2});
final String title1;
final String title2;
  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(children: [
       TextSpan(text: title1),
      TextSpan(
        text: title2,
        style: const TextStyle(fontSize: 18),
        recognizer: TapGestureRecognizer()..onTap = () {},
      ),
    ]));
  }
}
