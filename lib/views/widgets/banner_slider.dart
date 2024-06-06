import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';

class AutoplaySlider extends StatefulWidget {
  @override
  _AutoplaySliderState createState() => _AutoplaySliderState();
}

class _AutoplaySliderState extends State<AutoplaySlider> {
  int _currentSlide = 0 ;
  final List<String> _images = [
    'assets/images/ban3.jpg',
    'assets/images/ban3.jpg',
    'assets/images/ban3.jpg',
    'assets/images/ban3.jpg',
  ];
  final CarouselController _controller = CarouselController();

  @override
  void initState() {
    super.initState();
    // Start autoplaying the slider
    _controller
        .animateToPage(0, duration: Duration(seconds: 3), curve: Curves.linear)
        .then((_) {
      _autoplaySlider();
    });
  }

  void _autoplaySlider() {
    // Move to the next slide
    _controller
        .nextPage(duration: Duration(seconds: 3), curve: Curves.linear)
        .then((_) {
      // If the current slide is the last slide, go back to the first slide
      if (_currentSlide == _images.length - 1) {
        _controller.jumpToPage(0);
        _currentSlide = 0;
      } else {
        _currentSlide++;
      }
      // Autoplay the slider again
      _autoplaySlider();
    });
  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: _images.map((image) {
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: <Color>[
                Color(0xFF0d152c),
                Theme.of(context).primaryColor
              ],
            ),
            
              borderRadius: BorderRadius.circular(5),
          ),
          margin: EdgeInsets.all(5),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 150,
                    padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                    child: Text(
                      "Look Awesome & Save Some",
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    width: 150,
                    height: 25,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(5)
                    ),
                    alignment: Alignment.center,
                    child: Text("Get Upto 50% Off",style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),),
                  ),
                ],
              ),
              Image.asset(
                image,
                fit: BoxFit.cover,
              )
            ],
          ),
        );
      }).toList(),
      options: CarouselOptions(
        height: 170,
        viewportFraction: 0.93,
        autoPlay: true,
        enlargeCenterPage: true,
        enableInfiniteScroll:
            true, // Disable infinite scrolling, we will handle it ourselves
        onPageChanged: (index, _) {
          setState(() {
            _currentSlide = index;
          });
        },
        // Disable manual scrolling, we will use a controller to control the slider
        disableCenter: true,
      ),
      carouselController: _controller,
    );
  }
}
