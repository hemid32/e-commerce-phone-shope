import 'package:flutter/material.dart';
import 'package:phoneshop/constant.dart';
import 'package:phoneshop/screens/loginorRegester/componants/costom_path.dart';

class ContainerBackground2 extends StatelessWidget {
  const ContainerBackground2({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size ;

    return ClipPath(
      clipper: CostomPath11(),
      child: Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          color: kPrimaryColor.withOpacity(0.23),
        ),
      ),
    );
  }
}

class ContainerBackgrounds1 extends StatelessWidget {
  const ContainerBackgrounds1({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size ;

    return ClipPath(
      clipper: CostomPath10(),
      child: Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          color: kPrimaryColor.withOpacity(0.6),
        ),
      ),
    );
  }
}


