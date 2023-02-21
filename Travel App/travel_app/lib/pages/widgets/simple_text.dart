import 'package:flutter/cupertino.dart';

class SimpleText extends StatelessWidget {
  final String text;
  final Color color;
  final double size;
  const SimpleText(
      {super.key, required this.text, required this.color, required this.size});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: size, color: color),
    );
  }
}
