import 'package:barbershop/views/pages/profile/widgets/custom_clipper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../widgets/book_appointment_btn.dart';


class Profile extends StatefulWidget {
  final emails;
  Profile({Key? key, this.emails}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}
RxBool _isLightTheme = false.obs;
class _ProfileState extends State<Profile> {
  bool switchValue = false;

  @override
  void initState() {
    super.initState();
    getThemeStatus();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 250,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        flexibleSpace: Stack(
          clipBehavior: Clip.none,
          children: [
            ClipPath(
              clipper: Customshape(),
              child: Container(
                height: 250,
                width: MediaQuery.of(context).size.width,
                color: Theme.of(context).primaryColor,
              ),
            ),
            FractionalTranslation(
              translation: Offset(0.0, -0.25),
              child: Center(
                  child: Text(
                "Ben Jonsan",
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 17,
                    height: 2,
                    fontWeight: FontWeight.w600),
              )),
            ),
            FractionalTranslation(
              translation: Offset(0.0, 0.14),
              child: Center(
                child: CircleAvatar(
                  backgroundColor: Theme.of(context).primaryColor,
                  radius: 65,
                  child: CircleAvatar(
                    radius: 60,
                    backgroundColor: Theme.of(context).backgroundColor,
                    child: Image.asset(
                      "assets/images/nav4.png",
                      width: 70.0,
                      color: Theme.of(context).primaryColor,
                      height: 70.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: ListTile(
                leading: Icon(
                  Icons.person,
                  size: 30,
                  color: Theme.of(context).primaryColor,
                ),
                title: Text(
                  "Ben Jonsan",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ),
            Container(
              height: 0.5,
              width: double.infinity,
              color: Colors.grey,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: ListTile(
                leading: Icon(
                  Icons.cake,
                  size: 30,
                  color: Theme.of(context).primaryColor,
                ),
                title: Text(
                  "Birthday",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ),
            Container(
              height: 0.5,
              width: double.infinity,
              color: Colors.grey,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: ListTile(
                leading: Icon(
                  Icons.phone_android,
                  size: 30,
                  color: Theme.of(context).primaryColor,
                ),
                title: Text(
                  "8606872355",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ),
            Container(
              height: 0.5,
              width: double.infinity,
              color: Colors.grey,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Obx(() => ListTile(
                leading: Icon(
                  Icons.dark_mode,
                  size: 30,
                  color: Theme.of(context).primaryColor,
                ),
                title: Text(
                  "Light mode",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                trailing:  CupertinoSwitch(
                  value: _isLightTheme.value,
                  activeColor: Theme.of(context).primaryColor,
                  onChanged: (val) {
                    _isLightTheme.value = val;
                    Get.changeThemeMode(
                      _isLightTheme.value ? ThemeMode.light : ThemeMode.dark,
                    );
                    _saveThemeStatus();
                  },
                ),
            ),
            ),
            ),
            Container(
              height: 0.5,
              width: double.infinity,
              color: Colors.grey,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: ListTile(
                leading: Icon(
                  Icons.mail,
                  size: 30,
                  color: Theme.of(context).primaryColor,
                ),
                title: Text(
                  "tsakshay126@gmail.com",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ),
            Container(
              height: 0.5,
              width: double.infinity,
              color: Colors.grey,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: ListTile(
                leading: Icon(
                  Icons.remove_red_eye_outlined,
                  size: 30,
                  color: Theme.of(context).primaryColor,
                ),
                title: Text(
                  "Password",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ),
            BookAppointment(texts: 'Edit Profile'),
          ],
        ),
      ),
    );
  }

}
Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

_saveThemeStatus() async {
  SharedPreferences pref = await _prefs;
  pref.setBool('theme', _isLightTheme.value);
}

getThemeStatus() async {
  var _isLight = _prefs.then((SharedPreferences prefs) {
    return prefs.getBool('theme') != null ? prefs.getBool('theme') : true;
  }).obs;
  _isLightTheme.value = (await _isLight.value)!;
  Get.changeThemeMode(_isLightTheme.value ? ThemeMode.light : ThemeMode.dark);
}