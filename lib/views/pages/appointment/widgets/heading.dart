

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../consts/padding.dart';

class Heading extends StatelessWidget {
  final String heading;
  const Heading({Key? key, required this.heading}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: appPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            heading,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ],
      ),
    );
  }
}
