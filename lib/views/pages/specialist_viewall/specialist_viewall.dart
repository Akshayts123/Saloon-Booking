import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../consts/padding.dart';
import '../home/home.dart';
import '../home/widgets/hair_specialist.dart';

class SpecialistViewAll extends StatelessWidget {
  const SpecialistViewAll({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Icon(Icons.arrow_back_ios)),
        title: Text("Hair Specialist"),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GridView.builder(
              itemCount: coffeeController.images.length,
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              padding: EdgeInsets.only(right: appPadding),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 10 / 14,
                crossAxisCount: 2,
                mainAxisSpacing: 0,
                crossAxisSpacing: 0,
              ),
              itemBuilder: (_, index) {
                return GestureDetector(
                    onTap: () {},
                    child: HairSpecialist(
                      images: coffeeController.images[index],
                    ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
