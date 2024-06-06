import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../appointment/appointment.dart';
import '../home/home.dart';
import '../home/widgets/carousel_slider.dart';
import '../login_signup/login.dart';
import '../offers/offers.dart';
import '../profile/profile.dart';
import '../specialist_inner_page/specialist_inner_page.dart';

class Dashboard extends StatefulWidget {

  Dashboard({Key? key, }) : super(key: key);
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return  NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (overscroll) {
        overscroll.disallowGlow();
        return true;
      },
      child: Scaffold(
        body: getBody(),
        bottomNavigationBar: getFooter(),
      ),
    );
  }

  Widget getBody() {
    List<Widget> pages = [
      HomeScreen(),
      Appointment(),
      Offers(),
      Profile( ),
      // LoginPage(),
    ];
    return IndexedStack(
      index: pageIndex,
      children: pages,
    );
  }

  Widget getFooter() {
    var size = MediaQuery.of(context).size;
    List bottomItems = [
      "assets/images/nav1.png",
      "assets/images/nav2.png",
      "assets/images/nav3.png",
      "assets/images/nav4.png",
    ];
    List navItems = [
      'Home',
      "Appointment",
      "Offers",
      "Profile",
    ];
    return Container(
      width: size.width,
      height: 67,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.12),
            blurRadius: 30.0,
            offset: Offset(0, -10),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        child: Padding(
          padding:
          const EdgeInsets.only(left: 30, right: 30, bottom: 15, top: 15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              bottomItems.length,
                  (index) {
                return InkWell(
                  onTap: () {
                    selectedTab(index);
                  },
                  child: Column(
                    children: [
                      Image.asset(
                        bottomItems[index],
                        height: 20.5,
                        color: pageIndex == index
                            ? context.theme.primaryColor
                            : Colors.grey,
                      ),

                      Container(
                        child: Text(
                          navItems[index],style:GoogleFonts.poppins(
                            color:  pageIndex == index
                                ? context.theme.primaryColor
                                : Colors.grey, fontSize: 12, fontWeight: FontWeight.w600) ,
                        ),
                      ),
                      // (pageIndex == index)
                      //     ? AnimatedContainer(
                      //   duration: Duration(milliseconds: 500),
                      //   curve: Curves.easeIn,
                      //   child: Container(
                      //     height: 5.0,
                      //     width: 20.0,
                      //     decoration: BoxDecoration(
                      //         color: context.theme.primaryColor,
                      //         borderRadius: BorderRadius.circular(100)),
                      //   ),
                      // )
                      //     : Container(
                      //   height: 5.0,
                      //   width: 20.0,
                      // ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  selectedTab(index) {
    setState(() {
      pageIndex = index;
    });
  }
}
