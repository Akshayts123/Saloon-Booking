import 'package:barbershop/consts/padding.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/rating.dart';

class Offers extends StatefulWidget {
  Offers({Key? key}) : super(key: key);

  @override
  State<Offers> createState() => _OffersState();
}

class _OffersState extends State<Offers> {
  double rating = 3.5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('Offers'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(appPadding),
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.only(bottom: appPadding),
                  width: double.infinity,
                  height: 215,
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        spreadRadius: 2.0,
                        blurRadius: 2.0,
                      )
                    ],
                  ),
                  child: Container(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Image.asset(
                                "assets/images/ban3.jpg",
                                width: 70,
                                height: 70,
                              ),
                            ),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Best Friend',
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),
                                  Text(
                                    'Digital Entertainment',
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  StarRating(
                                    rating: rating,
                                    onRatingChanged: (rating) =>
                                        setState(() => this.rating = rating),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Text(
                                "Offer \$300",
                                style: GoogleFonts.poppins(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 16,
                                    height: 2,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Flexible(
                          child: Text(
                            'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Container(
                              color: Colors.grey,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 42, vertical: 15),
                              child: Center(
                                child: Text(
                                  "MORE INFO",
                                  style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontSize: 15,
                                      height: 2,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                            Container(
                              color: Theme.of(context).primaryColor,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 42, vertical: 15),
                              child: Center(
                                child: Text(
                                  "PURCHASE",
                                  style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: 15,
                                      height: 2,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
