import 'dart:ui';

import 'package:barbershop/views/pages/dashboard/dashboard.dart';
import 'package:barbershop/views/pages/login_signup/signup.dart';
import 'package:barbershop/views/pages/login_signup/widgets/text_fields.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../consts/padding.dart';
import '../../../services/firebase_services.dart';
import '../../widgets/show_snackbar.dart';
import 'google_signin.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  FirebaseAuth auth = FirebaseAuth.instance;
  String _message = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(appPadding),
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                    alignment: Alignment(1, 1),
                    image: AssetImage("assets/images/panna.png")),
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
                  SizedBox(
                    height: 100,
                  ),
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
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.all(appPadding),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                        validator: (value) {
                          // add your custom validation here.
                          if (value!.isEmpty) {
                            return 'Please enter some text';
                          }
                          if (value == null ||
                              value.isEmpty ||
                              !value.contains('@') ||
                              !value.contains('.')) {
                            return 'Please enter valid Email';
                          }
                          return null;
                        },
                        style: TextStyle(color: Colors.black),
                        controller: _emailController,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            fillColor: Colors.grey.shade300,
                            contentPadding: EdgeInsets.all(15),
                            hintText: "Email",
                            prefixIcon: Icon(Icons.email,color: Theme.of(context).primaryColor,),
                            filled: true)),
                    SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      validator: (value) {
                        // add your custom validation here.
                        if (value!.isEmpty) {
                          return 'Please enter some text';
                        }
                        if (value!.length < 6) {
                          return 'Must be more than 6 charater';
                        }
                      },
                      style: TextStyle(color: Colors.black),
                      controller: _passwordController,
                      obscureText: true,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                          // border: OutlineInputBorder(borderSide: BorderSide(width: 1 ,color: Color(0xFFF5593F) ,)),
                          fillColor: Colors.grey.shade300,
                          contentPadding: EdgeInsets.all(15),
                          hintText: "Password",
                          labelStyle: TextStyle(color: Colors.black),
                          focusColor: Theme.of(context).primaryColor ,
                          hoverColor: Theme.of(context).primaryColor ,
                          prefixIcon: Icon(Icons.security,color: Theme.of(context).primaryColor,),
                          filled: true),
                    ),
                    // SizedBox(
                    //   height: 60,
                    //   child: Padding(
                    //     padding: const EdgeInsets.only(bottom: 8.0),
                    //     child: Material(
                    //       elevation: 8,
                    //       shadowColor: Colors.black87,
                    //       color: Colors.transparent,
                    //       borderRadius: BorderRadius.circular(10),
                    //       child: TextFormField(
                    //         controller: _passwordController,
                    //         validator: (value) {
                    //           // add your custom validation here.
                    //           if (value!.isEmpty) {
                    //             return 'Please enter some text';
                    //           }
                    //           if (value!.length < 6) {
                    //             return 'Must be more than 6 charater';
                    //           }
                    //         },
                    //         textAlignVertical: TextAlignVertical.bottom,
                    //         decoration: InputDecoration(
                    //           border: OutlineInputBorder(
                    //             borderRadius: BorderRadius.circular(10),
                    //             borderSide: BorderSide.none,
                    //           ),
                    //           filled: true,
                    //           fillColor: Colors.white,
                    //           hintText: "Password",
                    //           prefixIcon: Icon(Icons.security),
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () async {
                              try {
                                await FirebaseAuthService().login(
                                    _emailController.text.trim(),
                                    _passwordController.text.trim());

                                if (FirebaseAuth.instance.currentUser != null) {

                                  if (!mounted) return;

                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Dashboard()));
                                }
                              } on FirebaseException catch (e) {
                                debugPrint("error is ${e.message}");
                                _formKey.currentState!.validate();
                                _checkEmail();
                              }
                              ;
                            },
                            child: Container(
                              width: 270,
                              height: 55,
                              decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                child: Text(
                                  "Sign In",
                                  style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Container(
                            width: 55,
                            height: 55,
                            decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: Icon(
                                Icons.camera,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Forgot Password ?",
                            style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(SignUp());
                            },
                            child: Text(
                              "Register",
                              style: GoogleFonts.poppins(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      child: Row(
                        children: [
                          Flexible(
                            child: Container(
                              height: 1,
                              color: Colors.grey,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              'or',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Flexible(
                            child: Container(
                              height: 1,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: (){
                              signInWithGoogle();
                            },
                            child: Container(
                              width: 160,
                              height: 55,
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Theme.of(context)
                                          .primaryColor
                                          .withOpacity(0.5),
                                      spreadRadius: 2.0,
                                      blurRadius: 2.0,
                                    )
                                  ],
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset('assets/images/google.png',
                                        width: 20),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "Google",
                                      style: GoogleFonts.poppins(
                                          color: Theme.of(context).primaryColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Container(
                            width: 160,
                            height: 55,
                            decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset('assets/images/facebook.png',
                                      width: 20),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Facebook",
                                    style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> doesEmailAlreadyExist(String email) async {
    try {
      List<String> signInMethods = await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);
      return signInMethods.isNotEmpty;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  void _checkEmail() async {
    if (_formKey.currentState!.validate()) {
      bool emailExists = await doesEmailAlreadyExist(_emailController.text.trim());

      setState(() {
        if (emailExists) {
          showSnackBar(context, message: 'Email exist Password does not exist');
        } else {
          showSnackBar(context, message: 'Email or Password does not exist ');
        }
      });
    }
  }
}
