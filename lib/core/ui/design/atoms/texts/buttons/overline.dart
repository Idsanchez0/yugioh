import 'package:flutter/cupertino.dart';

class Overline extends StatefulWidget {
  final String title;
  final Color color;
  final TextAlign align;
  const Overline(
      {Key? key, required this.title, required this.color, required this.align})
      : super(key: key);
  @override
  State<Overline> createState() => _Overline();
}

class _Overline extends State<Overline> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.title,
      textAlign: widget.align,
      style: TextStyle(
          color: widget.color,
          fontWeight: FontWeight.w500,
          fontFamily: 'Poppins',
          fontSize: 10,
          height: 1.5),
    );
  }
}
