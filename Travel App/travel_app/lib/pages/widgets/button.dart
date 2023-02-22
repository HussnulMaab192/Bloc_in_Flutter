import 'package:flutter/cupertino.dart';
import 'package:travel_app/misc/colors.dart';

class ResponsiveButton extends StatefulWidget {
  final double width;
  final bool responsive;
  const ResponsiveButton(
      {super.key, required this.width, this.responsive = false});
  @override
  State<ResponsiveButton> createState() => _ResponsiveButtonState();
}

class _ResponsiveButtonState extends State<ResponsiveButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: widget.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: AppColors.mainColor),
      child: const Image(
        image: AssetImage("img/button-one.png"),
      ),
    );
  }
}
