import 'package:flutter/cupertino.dart';

class Captions extends StatefulWidget {
  final String title;
  final Color color;
  final TextAlign align;
  const Captions(
      {Key? key, required this.title, required this.color, required this.align})
      : super(key: key);
  @override
  State<Captions> createState() => _Captions();
}

class _Captions extends State<Captions> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.title,
      textAlign: widget.align,
      style: TextStyle(
          color: widget.color,
          fontWeight: FontWeight.w500,
          fontFamily: 'Poppins',
          fontSize: 12,
          height: 1.5),
    );
  }
}
