import 'package:barbershop/consts/padding.dart';
import 'package:barbershop/views/pages/home/widgets/button_images.dart';
import 'package:barbershop/views/pages/home/widgets/carousel_slider.dart';
import 'package:barbershop/views/pages/home/widgets/hair_specialist.dart';
import 'package:barbershop/views/pages/home/widgets/header_buttons.dart';
import 'package:barbershop/views/pages/home/widgets/header_text.dart';
import 'package:barbershop/views/pages/home/widgets/search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../controller/home_controller.dart';
import '../../../utils/app_routes.dart';
import '../../widgets/banner_slider.dart';
import '../../widgets/header.dart';
import '../../widgets/rating.dart';
import '../specialist_inner_page/specialist_inner_page.dart';

final HomeController coffeeController = Get.find();

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeController _coffeeController = Get.find();
  double rating = 3.5;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      drawer: Drawer(),
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(appPadding),
                height: 250,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25)),
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).primaryColor.withOpacity(0.5),
                      spreadRadius: 2.0,
                      blurRadius: 4.0,
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                scaffoldKey.currentState?.openDrawer();
                              },
                              child: Container(
                                child: Icon(
                                  Icons.menu,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Container(
                              child: Icon(
                                Icons.notifications,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        HeaderButtons(),
                      ],
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    HeaderText(),
                    SizedBox(
                      height: 7,
                    ),
                    Search(
                      hintField: 'Search',
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              EnlargeStrategyZoomDemo(),
              SizedBox(
                height: 15,
              ),
              HeaderView(
                heading: 'Categories',
              ),
              Center(
                child: Wrap(
                  spacing: 2.0,
                  runSpacing: -15.0,
                  children: List.generate(
                    _coffeeController.iconButton.length,
                    (index) {
                      return ButtonImages(
                        icons: _coffeeController.iconButton[index].image,
                        texts: _coffeeController.iconButton[index].text,
                      );
                    },
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: appPadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Hair Specialist',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.SPACIALISTINNER);
                      },
                      child: Text(
                        "View All",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: size.width * .66,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Get.to(SpecialistInnerPage(images:_coffeeController.images[index],));

                      },
                      child: HairSpecialist(
                        images: _coffeeController.images[index],
                      ),
                    );
                  },
                ),
              ),
              // GridView.builder(
              //   itemCount: _coffeeController.images.length,
              //   shrinkWrap: true,
              //   physics: const ScrollPhysics(),
              //   padding: EdgeInsets.only(right: appPadding),
              //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              //     childAspectRatio: 10 / 14,
              //     crossAxisCount: 2,
              //     mainAxisSpacing: 0,
              //     crossAxisSpacing: 0,
              //   ),
              //   itemBuilder: (_, index) {
              //     return GestureDetector(
              //         onTap: () {
              //           showModalBottomSheet(
              //             context: context,
              //             builder: (context) {
              //               return Wrap(
              //                 children: [
              //                   ListTile(
              //                     leading: Icon(Icons.share),
              //                     title: Text('Share'),
              //                   ),
              //                   ListTile(
              //                     leading: Icon(Icons.copy),
              //                     title: Text('Copy Link'),
              //                   ),
              //                   ListTile(
              //                     leading: Icon(Icons.edit),
              //                     title: Text('Edit'),
              //                   ),
              //
              //                 ],
              //               );
              //             },
              //           );
              //         },
              //         child: HairSpecialist(
              //           images: _coffeeController.images[index],
              //         ));
              //   },
              // ),
              SizedBox(
                height: 10,
              ),
              HeaderView(
                heading: 'NearBy Saloons',
              ),
              ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.only(top: 10),
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: _coffeeController.saloon.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.only(
                      left: appPadding,
                      right: appPadding,
                      bottom: appPadding,
                    ),
                    padding: EdgeInsets.all(10),
                    width: double.infinity,
                    height: 120,
                    decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        boxShadow: [
                          BoxShadow(
                            color:
                                Theme.of(context).primaryColor.withOpacity(0.5),
                            spreadRadius: 2.0,
                            blurRadius: 2.0,
                          )
                        ],
                        // border: Border.all(width: 0.3, color: Colors.black),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            _coffeeController.saloon[index],
                            width: 100,
                            height: 150,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Text(
                                  "Saloon EL studio thrissur",
                                  style:
                                      Theme.of(context).textTheme.headlineSmall,
                                ),
                              ),
                              Flexible(
                                child: Text(
                                  'Lorem Ipsum is simply dummy ',
                                  style: GoogleFonts.poppins(
                                      color: Colors.grey,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              Text(
                                'Lorem Ipsum is simply',
                                style: Theme.of(context).textTheme.labelLarge,
                              ),
                              Row(
                                children: [
                                  StarRating(
                                    rating: rating,
                                    onRatingChanged: (rating) =>
                                        setState(() => this.rating = rating),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    '4.8',
                                    style: GoogleFonts.poppins(
                                        color: Colors.grey,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    '|',
                                    style: GoogleFonts.poppins(
                                        color: Colors.grey,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    '120 Reviews',
                                    style: GoogleFonts.poppins(
                                        color: Colors.grey,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),

              // Container(
              //   height: size.width * .65,
              //   child: ListView.builder(
              //     shrinkWrap: true,
              //     physics: BouncingScrollPhysics(),
              //     scrollDirection: Axis.horizontal,
              //     itemCount: 5,
              //     itemBuilder: (BuildContext context, int index) {
              //       return HairSpecialist();
              //     },
              //   ),
              // ),
              // Container(
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(15)
              //   ),
              //   child: Column(
              //     children: [
              //
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
