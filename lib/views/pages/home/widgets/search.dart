import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../consts/consts.dart';


class Search extends StatelessWidget {
  const Search({
    Key? key,
    required this.hintField,
    this.backgroundColor,
  }) : super(key: key);

  final String hintField;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: size.width,
      height: 50,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: 10.0,
          offset: Offset(0, 5),
        )
      ], color: Theme.of(context).cardColor, borderRadius: BorderRadius.circular(7.0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 40.0,
            width: 40.0,
            alignment: Alignment.center,
            child: Container(
              child: Image.asset(
                assetImg + 'searchs.png',
                color: Theme.of(context).focusColor,
                height: 15.0,
              ),
            ),
          ),
          Flexible(
            child: Container(
              width: size.width,
              height: 38,
              alignment: Alignment.topCenter,
              child: TextField(
                style: TextStyle(fontSize: 15),
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  hintText: hintField,
                  hintStyle: TextStyle(
                    fontSize: 15,
                    color:
                    Theme.of(context).focusColor,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          SizedBox(width: 10.0),
          Container(
            height: 40.0,
            width: 40.0,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withOpacity(0.7),
              borderRadius: BorderRadius.circular(7.0),
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).primaryColor.withOpacity(1),
                  spreadRadius: 0.0,
                  blurRadius: 2.0,
                  offset: Offset(0, 2),
                )
              ],
            ),
            child: Container(
              child: Image.asset(
                assetImg + 'filters.png',
                color: Colors.white,
                height: 13.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
