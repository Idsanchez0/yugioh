import 'package:flutter/cupertino.dart';

class ButtonMedium extends StatefulWidget {
  final String title;
  final Color color;
  final TextAlign align;
  const ButtonMedium(
      {Key? key, required this.title, required this.color, required this.align})
      : super(key: key);
  @override
  State<ButtonMedium> createState() => _ButtonMedium();
}

class _ButtonMedium extends State<ButtonMedium> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.title,
      textAlign: widget.align,
      style: TextStyle(
          color: widget.color,
          fontWeight: FontWeight.w500,
          fontFamily: 'Poppins',
          fontSize: 16,
          height: 1.5),
    );
  }
}
