import 'package:flutter/material.dart';

class ButtonCheckBox extends StatefulWidget {
  final String icon;
  const ButtonCheckBox({super.key, required this.icon});

  @override
  State<ButtonCheckBox> createState() => _ButtonCheckBoxState();
}

class _ButtonCheckBoxState extends State<ButtonCheckBox> {
  bool showTick = false;

  @override
  Widget build(BuildContext context) {
    return Image(image: AssetImage(widget.icon));
  }
}
