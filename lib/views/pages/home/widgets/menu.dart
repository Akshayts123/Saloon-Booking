import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuIcons extends StatelessWidget {
  final ontap;
  const MenuIcons({Key? key, required this.ontap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: (){
            ontap;
          },
          child: Container(
            child: Icon(
              Icons.menu,
              color: Colors.white,
            ),
          ),
        ),
        Container(
          child: Icon(
            Icons.notifications,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
