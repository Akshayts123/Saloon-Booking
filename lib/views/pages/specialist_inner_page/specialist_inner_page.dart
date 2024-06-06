import 'package:barbershop/views/pages/specialist_inner_page/portfolio.dart';
import 'package:barbershop/views/pages/specialist_inner_page/review.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../consts/padding.dart';
import 'information.dart';

class SpecialistInnerPage extends StatefulWidget {
  final images;
  const SpecialistInnerPage({Key? key, this.images}) : super(key: key);

  @override
  State<SpecialistInnerPage> createState() => _SpecialistInnerPageState();
}

class _SpecialistInnerPageState extends State<SpecialistInnerPage> {
  Color _favIconColor = Colors.grey;
  int _selectedEvent = 0;

  List<Widget> _pages = [Information(), Portfolio(), Review()];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(appPadding),
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/open.png"),
                ),
                // color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25)),
                // boxShadow: [
                //   BoxShadow(
                //     color: Theme.of(context).primaryColor.withOpacity(0.5),
                //     spreadRadius: 2.0,
                //     blurRadius: 4.0,
                //   )
                // ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        width: 50,
                        height: 50,
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        width: 50,
                        height: 50,
                        child: IconButton(
                          icon: Icon(Icons.favorite),
                          color: _favIconColor,
                          tooltip: 'Add to favorite',
                          onPressed: () {
                            setState(
                                  () {
                                if (_favIconColor == Colors.grey) {
                                  _favIconColor = Colors.red;
                                } else {
                                  _favIconColor = Colors.grey;
                                }
                              },
                            );
                          },
                        ),
                      ),

                    ],
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Text(
                              "Welcome to",
                              style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 27,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          Container(
                            child: Text(
                              "Barbers.",
                              style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 27,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        height: 30,
                        width: 70,
                        child: Center(
                          child: Text("Open",style:GoogleFonts.poppins(
                              color: Colors.white, fontSize: 17, fontWeight: FontWeight.w600),),
                        ),
                      )
                    ],
                  ),

                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(appPadding),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ClipRRect(borderRadius: BorderRadius.circular(3),child: Image.asset('assets/images/hair1.jpg',width: 75,height: 75,)),
                      Text("Vinny's Barber",style:Theme.of(context).textTheme.headlineMedium,),
                      Row(
                        children: [
                          Icon(Icons.star,color: Colors.orange,),
                          Text("4.2(2.6k)",style: GoogleFonts.poppins(
                              color: Colors.grey, fontSize: 14, fontWeight: FontWeight.w500),)
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    height: 90,
                    width: double.infinity,
                    child: Row(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          margin: EdgeInsets.only(left: 20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Icon(Icons.location_on_outlined,size: 30,color: Theme.of(context).primaryColor,),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              Text("Location",style: GoogleFonts.poppins(
                                  color: Colors.white, fontSize: 15, fontWeight: FontWeight.w500),),
                              Text("1034 Lexington Ave New York ,USA",style: GoogleFonts.poppins(
                                  color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: appPadding,left: appPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Services",style: Theme.of(context).textTheme.headlineMedium,),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 50,
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          margin: EdgeInsets.only(right: 10),
                          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                          decoration: BoxDecoration(
                              border:Border.all(width: 0.5,color: Colors.grey)
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.add_chart_outlined,color: Theme.of(context).primaryColor,),
                              SizedBox(
                                width: 5,
                              ),
                              Text("Hair Cut",style: Theme.of(context).textTheme.bodySmall,),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  buildUserEvents(size),
                  _pages[_selectedEvent],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container buildUserEvents(Size size) {
    return Container(
      padding: EdgeInsets.only(right: appPadding),
      // color: Colors.grey.shade100,
      child: Row(
        children: [
          Expanded(
            child: Container(
              width: size.width / 1.8,
              padding: EdgeInsets.only(right: 8),
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      _selectedEvent = 0;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color:_selectedEvent == 0 ? Theme.of(context).primaryColor: context.theme.cardColor,width: 2)),
                    ),
                    child: Center(
                      child: Text("Information",
                          style: TextStyle(
                            fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color:_selectedEvent == 0
                                  ? context.theme.primaryColor
                                  : Colors.black
                          )),
                    ),
                  ),
                ),
              ),
            ),
          Expanded(
            child: Container(
              width: size.width / 1.8,
              padding: EdgeInsets.only(right: 8),
              child: GestureDetector(
                onTap: (){
                  setState(() {
                    _selectedEvent = 1;
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color:_selectedEvent == 1 ? Theme.of(context).primaryColor: context.theme.cardColor,width: 2)),
                  ),
                  child: Center(
                    child: Text("Portfolio",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color:_selectedEvent == 1
                                ? context.theme.primaryColor
                                : Colors.black
                        )),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: size.width / 1.8,
              padding: EdgeInsets.only(right: 8),
              child: GestureDetector(
                onTap: (){
                  setState(() {
                    _selectedEvent = 2;
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color:_selectedEvent == 2 ? Theme.of(context).primaryColor: context.theme.cardColor,width: 2)),
                  ),
                  child: Center(
                    child: Text("Review",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color:_selectedEvent == 2
                                ? context.theme.primaryColor
                                : Colors.black
                        )),
                  ),
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
