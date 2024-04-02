import 'package:flutter/cupertino.dart';

class ButtonRegular extends StatefulWidget {
  final String title;
  final Color color;
  final TextAlign align;
  const ButtonRegular(
      {Key? key, required this.title, required this.color, required this.align})
      : super(key: key);
  @override
  State<ButtonRegular> createState() => _ButtonRegular();
}

class _ButtonRegular extends State<ButtonRegular> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.title,
      textAlign: widget.align,
      style: TextStyle(
          color: widget.color, fontFamily: 'Poppins', fontSize: 16, height: 1.5),
    );
  }
}
