import 'package:flutter/material.dart';

showSnackBar(BuildContext context,  {required String message,}) =>
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor:  Theme.of(context).primaryColor,
        behavior: SnackBarBehavior.floating,
        elevation: 2,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      ),
    );
