import 'package:flutter/material.dart';

import '../../../../utils/size/size_config.dart';

class IconButtonBold extends StatefulWidget {
  final String title;
  final Color color;
  final TextAlign align;
  final String icon;
  const IconButtonBold(
      {super.key,
      required this.title,
      required this.color,
      required this.align,
      required this.icon});

  @override
  State<IconButtonBold> createState() => _IconButtonBoldState();
}

class _IconButtonBoldState extends State<IconButtonBold> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(
          image: AssetImage(widget.icon),
          height: 8 * SizeConfig.imageSizeMultiplier,
        ),
        Text(
          widget.title,
          textAlign: widget.align,
          style: TextStyle(
              color: widget.color,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
              fontSize: 16,
              height: 1.5),
        ),
      ],
    );
  }
}
