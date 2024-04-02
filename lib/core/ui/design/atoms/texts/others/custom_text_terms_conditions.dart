import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';

import '../../../../utils/paths/colors_ui.dart';

class CustomTextTermsConditions extends StatefulWidget {
  final Function onTap;
  const CustomTextTermsConditions({Key? key, required this.onTap})
      : super(key: key);
  @override
  State<CustomTextTermsConditions> createState() =>
      _CustomTextTermsConditions();
}

class _CustomTextTermsConditions extends State<CustomTextTermsConditions> {
  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(children: [
      TextSpan(
          text: 'Acepto los ',
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: colors.primary900,
              fontFamily: 'Poppins')),
      TextSpan(
          text: 'Términos y condiciones - Políticas de privacidad',
          recognizer: TapGestureRecognizer()..onTap = () => widget.onTap(),
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: colors.secondary500,
              fontFamily: 'Poppins'))
    ]));
  }
}
