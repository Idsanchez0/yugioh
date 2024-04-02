import 'package:flutter/material.dart';

import '../../../utils/paths/colors_ui.dart';
import '../../../utils/size/size_config.dart';

class CustomSearchField extends StatefulWidget {
  final TextEditingController controller;
  final dynamic inputType;
  final bool enable;
  final dynamic hintText;
  const CustomSearchField({
    super.key,
    required this.inputType,
    required this.enable,
    required this.hintText,
    required this.controller,
  });
  @override
  State<CustomSearchField> createState() => _CustomSearchField();
}

class _CustomSearchField extends State<CustomSearchField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            color: Colors.transparent,
            child: Theme(
                data: ThemeData(
                  disabledColor: Colors.black,
                ),
                child: GestureDetector(
                  child: TextField(
                    controller: widget.controller,
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Icon(
                            Icons.search,
                            color: colors.neutral300,
                          )),
                      filled: true,
                      hintStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400),
                      hintText: widget.hintText,
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: colors.primary400, width: 1.5),
                          borderRadius: BorderRadius.all(
                              Radius.circular(2 * SizeConfig.widthMultiplier))),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: colors.neutral300, width: 1.5),
                          borderRadius: BorderRadius.all(
                              Radius.circular(2 * SizeConfig.widthMultiplier))),
                      disabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: colors.neutral300, width: 1.5),
                          borderRadius: BorderRadius.all(
                              Radius.circular(2 * SizeConfig.widthMultiplier))),
                    ),
                    keyboardType: widget.inputType,
                    textInputAction: TextInputAction.done,
                    cursorColor: Colors.black,
                    enabled: widget.enable,
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                    ),
                  ),
                ))),
      ],
    );
  }
}
