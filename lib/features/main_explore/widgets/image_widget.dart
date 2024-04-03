import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:yugioh/core/ui/utils/size/size_config.dart';

class ImageWidget extends StatefulWidget {
  final dynamic listImages;
  const ImageWidget({super.key, required this.listImages});
  @override
  State<ImageWidget> createState() => _ImageWidget();
}

class _ImageWidget extends State<ImageWidget> {
  final CarouselController _controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: 60 * SizeConfig.heightMultiplier,
      child: CarouselSlider.builder(
        carouselController: _controller,
        itemCount: widget.listImages.length,
        itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
            Container(
          color: Colors.transparent,
          child: Container(
            width: 90 * SizeConfig.widthMultiplier,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(widget.listImages[itemIndex]))),
          ),
        ),
        options: CarouselOptions(
            height: MediaQuery.of(context).size.height,
            viewportFraction: 1.0,
            aspectRatio: 2.0,
            initialPage: 0,
            enlargeCenterPage: true,
            autoPlay: true,
            autoPlayInterval: const Duration(milliseconds: 2500),
            enlargeFactor: 0.3,
            enlargeStrategy: CenterPageEnlargeStrategy.height,
            scrollDirection: Axis.horizontal,
            onPageChanged: (index, page) {
              log('cambio de pagina $index $page');
            }),
      ),
    );
  }
}
