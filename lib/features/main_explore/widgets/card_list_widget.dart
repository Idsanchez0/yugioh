import 'package:flutter/material.dart';
import 'package:yugioh/core/ui/design/atoms/texts/body/md_p.dart';
import 'package:yugioh/core/ui/utils/paths/images_ui.dart';
import 'package:yugioh/core/ui/utils/size/size_config.dart';

import '../../../core/ui/design/atoms/texts/header/h5.dart';
import '../../../core/ui/utils/paths/colors_ui.dart';
import 'data_card_list_widget.dart';

class CardListWidget extends StatefulWidget {
  final dynamic dataCard;
  final Function showModalPhotos;
  final Function showMore;
  const CardListWidget(
      {super.key,
      required this.dataCard,
      required this.showModalPhotos,
      required this.showMore});
  @override
  State<CardListWidget> createState() => _CardListWidget();
}

class _CardListWidget extends State<CardListWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(
            bottom: 4 * SizeConfig.heightMultiplier,
            left: 5 * SizeConfig.widthMultiplier,
            right: 5 * SizeConfig.widthMultiplier),
        padding: EdgeInsets.symmetric(
            horizontal: 1 * SizeConfig.widthMultiplier,
            vertical: 1 * SizeConfig.heightMultiplier),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  colors.warning100,
                  colors.warning400,
                ],
                begin: const FractionalOffset(0.0, 1.0),
                end: const FractionalOffset(1.0, 0.0),
                stops: const [0.0, 1.0],
                tileMode: TileMode.clamp),
            image: DecorationImage(
              image: AssetImage(imagesUi.background),
              fit: BoxFit.cover
            ),
            borderRadius: BorderRadius.all(
                Radius.circular(3 * SizeConfig.widthMultiplier))),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 1 * SizeConfig.heightMultiplier),
              width: double.infinity,
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: colors.neutral300))),
              child: H5(
                title: widget.dataCard['name'],
                color: colors.primary900,
                align: TextAlign.center,
              ),
            ),
            Container(
              height: 40 * SizeConfig.heightMultiplier,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(widget.dataCard['card_images'][0]
                          ['image_url_cropped']),
                      fit: BoxFit.cover)),
            ),
            Container(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () => widget.showModalPhotos(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      MdP(
                          title: 'Show photos',
                          color: colors.secondary500,
                          align: TextAlign.end,
                          fontWeight: FontWeight.bold),
                      SizedBox(
                        width: 1 * SizeConfig.widthMultiplier,
                      ),
                      Icon(
                        Icons.image_outlined,
                        size: 6 * SizeConfig.imageSizeMultiplier,
                        color: colors.secondary500,
                      )
                    ],
                  ),
                )),
            DataCardListWidget(
              dataCard: widget.dataCard,
              showMore: () => widget.showMore(),
            )
          ],
        ));
  }
}
