import 'package:flutter/cupertino.dart';

import '../../../consts/padding.dart';
import '../home/home.dart';

class Portfolio extends StatelessWidget {
  const Portfolio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: coffeeController.images.length,
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      padding: EdgeInsets.only(right: appPadding, top: appPadding),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 10 / 10,
        crossAxisCount: 2,
        mainAxisSpacing: 0,
        crossAxisSpacing: 0,
      ),
      itemBuilder: (_, index) {
        return Container(
          padding: EdgeInsets.all(10),
          child: Image.asset(
            coffeeController.images[index],
          ),
        );
      },
    );
  }
}
