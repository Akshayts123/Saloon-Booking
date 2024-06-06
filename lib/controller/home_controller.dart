

import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../models/icons_model.dart';

class HomeController extends  GetxController{
  final iconButton = [
    IconsModel(image: 'assets/images/pal.png', text: 'Haircut'),
    IconsModel(image: 'assets/images/pal1.png', text: 'Coloring'),
    IconsModel(image: 'assets/images/pal2.png', text: 'Styling'),
    IconsModel(image: 'assets/images/pal3.png', text: 'Hairdryer'),
    IconsModel(image: 'assets/images/pal4.png', text: 'Hairspa'),
    IconsModel(image: 'assets/images/pal5.png', text: 'Shampoo'),
    IconsModel(image: 'assets/images/pal6.png', text: 'Shaving'),
    IconsModel(image: 'assets/images/pal7.png', text: 'More'),
  ];
  final images = [
    'assets/images/hair1.jpg',
    'assets/images/hair2.jpg',
    'assets/images/hair3.jpg',
    'assets/images/hair4.jpg',
    'assets/images/hair5.jpg',
    'assets/images/hair6.jpg',
    'assets/images/hair7.jpg',
    'assets/images/hair8.jpg',
    'assets/images/hair9.jpg',
    'assets/images/hair10.jpg',
  ];
  final saloon = [
    'assets/images/saloon1.jpg',
    'assets/images/saloon2.jpg',
    'assets/images/saloon3.jpg',
    'assets/images/saloon4.jpg',
    'assets/images/saloon5.jpg',
    'assets/images/saloon6.jpg',
    'assets/images/saloon7.jpg',
    'assets/images/saloon8.jpg',

  ];
}