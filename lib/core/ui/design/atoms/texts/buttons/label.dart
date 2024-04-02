import 'package:flutter/cupertino.dart';

class Label extends StatefulWidget {
  final String title;
  final Color color;
  final TextAlign align;
  const Label(
      {Key? key, required this.title, required this.color, required this.align})
      : super(key: key);
  @override
  State<Label> createState() => _Label();
}

class _Label extends State<Label> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.title,
      textAlign: widget.align,
      style: TextStyle(
          color: widget.color, fontFamily: 'Poppins', fontSize: 14, height: 1.5),
    );
  }
}
