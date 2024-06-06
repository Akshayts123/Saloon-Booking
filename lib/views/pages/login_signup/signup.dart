import 'package:barbershop/views/pages/login_signup/login.dart';
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
import '../dashboard/dashboard.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
  TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      "Create New",
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 27,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    child: Text(
                      "Account.",
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

                        style: TextStyle(color: Colors.black),
                        cursorColor: Colors.black,

                        controller: _usernameController,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            fillColor: Colors.grey.shade300,
                            contentPadding: EdgeInsets.all(15),
                            hintText: "Name",

                            prefixIcon: Icon(Icons.person,color: Theme.of(context).primaryColor,),
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
                          if (value == null ||
                              value.isEmpty ||
                              !value.contains('@') ||
                              !value.contains('.')) {
                            return 'Please enter valid Email';
                          }
                          return null;
                        },
                        style: TextStyle(color: Colors.black),
                        cursorColor: Colors.black,
                        controller: _emailController,
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
                      cursorColor: Colors.black,
                      controller: _passwordController,
                      obscureText: true,

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
                    SizedBox(
                      height: 50,
                    ),

                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () async {

                              try {
                                await FirebaseAuthService().signup(
                                    _emailController.text.trim(), _passwordController.text.trim());

                                if (!mounted) return;

                                Navigator.push(
                                    context, MaterialPageRoute(builder: (context) => Dashboard()));
                              } on FirebaseException catch (e) {
                                debugPrint(e.message);
                                _formKey.currentState!.validate();
                                _checkEmail();
                                // Utility.showToast(msg: "Please enter valid Email and Password .");
                              }
                            },
                            child: Container(
                              width: 270,
                              height: 55,
                              decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                child: Text(
                                  "Register",
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
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: (){
                Get.to(LoginPage());
              },
              child: Padding(
                padding: const EdgeInsets.all(appPadding),
                child: Text(
                  "Log In",
                  style: GoogleFonts.poppins(
                      color: Theme.of(context).primaryColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }  Future<bool> doesEmailAlreadyExist(String email) async {
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
          showSnackBar(context, message: 'Email already exists .');
        } else {
          showSnackBar(context, message: 'Email does not exist ');
        }
      });
    }
  }

}
