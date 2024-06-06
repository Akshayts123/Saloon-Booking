

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../consts/padding.dart';

class ButtonImages extends StatelessWidget {
  final String icons;
  final String texts;
  const ButtonImages({Key? key, required this.icons, required this.texts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(appPadding),
      child: Column(
        children: [
          Container(
            width: 50,
            height: 50,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).primaryColor.withOpacity(0.5),
                  spreadRadius: 2.0,
                  blurRadius: 2.0,
                )
              ],
            ),
            child: Image.asset(
              icons,
              width: 30.0,
              // color: Theme.of(context).primaryColor,
              height: 30.0,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          FittedBox(
            child: Text(
             texts,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ],
      ),
    );
  }
}
