import 'package:flutter/cupertino.dart';

class LargeText extends StatelessWidget {
  final String text;
  final Color color;
  final double size;
  const LargeText(
      {super.key, required this.text, required this.color, required this.size});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:
          TextStyle(fontSize: size, color: color, fontWeight: FontWeight.bold),
    );
  }
}
