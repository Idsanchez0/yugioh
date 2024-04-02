import 'package:flutter/cupertino.dart';

class FootNote extends StatefulWidget {
  final String title;
  final Color color;
  final TextAlign align;
  const FootNote(
      {Key? key, required this.title, required this.color, required this.align})
      : super(key: key);
  @override
  State<FootNote> createState() => _FootNote();
}

class _FootNote extends State<FootNote> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.title,
      textAlign: widget.align,
      style: TextStyle(
          color: widget.color,
          fontWeight: FontWeight.w500,
          fontFamily: 'Poppins',
          fontSize: 8,
          height: 1.5),
    );
  }
}
