import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'image_direct.dart';

class EnlargeStrategyZoomDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Container(
        child: CarouselSlider(
          options: CarouselOptions(
            aspectRatio: 2.0,
            autoPlay: true,
            viewportFraction: 0.92,
            enlargeCenterPage: true,
            enlargeStrategy: CenterPageEnlargeStrategy.zoom,
            enlargeFactor: 0.4,
          ),
          items:[
            ImageDirect(image: "assets/images/ban3.jpg"),
            ImageDirect(image: "assets/images/ban3.jpg"),
            ImageDirect(image: "assets/images/ban3.jpg"),
            ImageDirect(image: "assets/images/ban3.jpg"),
          ],
        ),
      );

  }
}