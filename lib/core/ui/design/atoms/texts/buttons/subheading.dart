import 'package:flutter/cupertino.dart';

class Subheading extends StatefulWidget {
  final String title;
  final Color color;
  final TextAlign align;
  const Subheading(
      {Key? key, required this.title, required this.color, required this.align})
      : super(key: key);
  @override
  State<Subheading> createState() => _Subheading();
}

class _Subheading extends State<Subheading> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.title,
      textAlign: widget.align,
      style: TextStyle(
          color: widget.color,
          fontWeight: FontWeight.w500,
          fontFamily: 'Poppins',
          fontSize: 14,
          height: 1.5),
    );
  }
}
