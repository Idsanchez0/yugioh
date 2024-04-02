import 'package:flutter/cupertino.dart';

class ButtonBold extends StatefulWidget {
  final String title;
  final Color color;
  final TextAlign align;
  const ButtonBold(
      {Key? key, required this.title, required this.color, required this.align})
      : super(key: key);
  @override
  State<ButtonBold> createState() => _ButtonBold();
}

class _ButtonBold extends State<ButtonBold> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.title,
      textAlign: widget.align,
      style: TextStyle(
          color: widget.color,
          fontWeight: FontWeight.bold,
          fontFamily: 'Poppins',
          fontSize: 14,
          height: 1.5),
    );
  }
}
