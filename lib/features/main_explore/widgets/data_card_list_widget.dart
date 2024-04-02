import 'package:flutter/material.dart';
import 'package:yugioh/core/ui/design/molecules/buttons/custom_button.dart';
import 'package:yugioh/core/ui/utils/size/size_config.dart';

import '../../../core/ui/utils/paths/colors_ui.dart';

class DataCardListWidget extends StatefulWidget {
  final dynamic dataCard;
  final Function showMore;
  const DataCardListWidget(
      {super.key, required this.dataCard, required this.showMore});
  @override
  State<DataCardListWidget> createState() => _DataCardListWidget();
}

class _DataCardListWidget extends State<DataCardListWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 1 * SizeConfig.heightMultiplier,
        ),
        Container(
          padding:
              EdgeInsets.symmetric(horizontal: .5 * SizeConfig.widthMultiplier),
          child: RichText(
            textAlign: TextAlign.justify,
            text: TextSpan(children: [
              TextSpan(
                  text: 'Description: ',
                  style: TextStyle(
                      color: colors.primary900,
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      height: 1.5,
                      fontWeight: FontWeight.bold)),
              TextSpan(
                  text: widget.dataCard['desc'],
                  style: TextStyle(
                      color: colors.primary900,
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      height: 1.5,
                      fontWeight: FontWeight.w500))
            ]),
          ),
        ),
        SizedBox(height: 1 * SizeConfig.heightMultiplier),
        Container(
          alignment: Alignment.centerLeft,
          child: Table(
            children: [
              TableRow(children: [
                TableCell(
                  child: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: 'Type: ',
                          style: TextStyle(
                              color: colors.primary900,
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              height: 1.5,
                              fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: widget.dataCard['type'],
                          style: TextStyle(
                              color: colors.primary900,
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              height: 1.5,
                              fontWeight: FontWeight.w500))
                    ]),
                  ),
                ),
                TableCell(
                  child: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: widget.dataCard['attribute'] == null
                              ? 'Archetype: '
                              : 'Attribute: ',
                          style: TextStyle(
                              color: colors.primary900,
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              height: 1.5,
                              fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: widget.dataCard['attribute'] ??
                              widget.dataCard['archetype'],
                          style: TextStyle(
                              color: colors.primary900,
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              height: 1.5,
                              fontWeight: FontWeight.w500))
                    ]),
                  ),
                ),
              ]),
            ],
          ),
        ),
        SizedBox(height: 1 * SizeConfig.heightMultiplier),
        if (widget.dataCard['atk'] != null &&
            widget.dataCard['def'] != null &&
            widget.dataCard['level'] != null) ...[
          Container(
            alignment: Alignment.centerLeft,
            child: Table(
              children: [
                TableRow(children: [
                  TableCell(
                    child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: 'ATK: ',
                            style: TextStyle(
                                color: colors.primary900,
                                fontSize: 14,
                                fontFamily: 'Poppins',
                                height: 1.5,
                                fontWeight: FontWeight.bold)),
                        TextSpan(
                            text: widget.dataCard['atk'].toString(),
                            style: TextStyle(
                                color: colors.primary900,
                                fontSize: 14,
                                fontFamily: 'Poppins',
                                height: 1.5,
                                fontWeight: FontWeight.w500))
                      ]),
                    ),
                  ),
                  TableCell(
                    child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: 'DEF: ',
                            style: TextStyle(
                                color: colors.primary900,
                                fontSize: 14,
                                fontFamily: 'Poppins',
                                height: 1.5,
                                fontWeight: FontWeight.bold)),
                        TextSpan(
                            text: widget.dataCard['def'].toString(),
                            style: TextStyle(
                                color: colors.primary900,
                                fontSize: 14,
                                fontFamily: 'Poppins',
                                height: 1.5,
                                fontWeight: FontWeight.w500))
                      ]),
                    ),
                  ),
                ]),
              ],
            ),
          ),
          SizedBox(height: 1 * SizeConfig.heightMultiplier),
        ],
        SizedBox(height: 1 * SizeConfig.heightMultiplier),
        Container(
            alignment: Alignment.center,
            child: GestureDetector(
                onTap: () => widget.showMore(),
                child: CustomButton(
                    color: Colors.white,
                    border: colors.primary500,
                    colorText: colors.primary500,
                    text: 'Show more'))),
      ],
    );
  }
}
