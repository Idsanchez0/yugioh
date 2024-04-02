import 'package:flutter/cupertino.dart';

import '../../../../utils/size/size_config.dart';

class ButtonIconBold extends StatefulWidget {
  final String title;
  final Color color;
  final TextAlign align;
  final String icon;
  const ButtonIconBold(
      {Key? key,
      required this.title,
      required this.color,
      required this.align,
      required this.icon})
      : super(key: key);
  @override
  State<ButtonIconBold> createState() => _ButtonIconBold();
}

class _ButtonIconBold extends State<ButtonIconBold> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
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
        Image(
          image: AssetImage(widget.icon),
          height: 9 * SizeConfig.imageSizeMultiplier,
        ),
      ],
    );
  }
}
