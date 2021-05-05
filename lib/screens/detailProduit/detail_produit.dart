import 'package:flutter/material.dart';
import 'package:phoneshop/constant.dart';

import 'componants/body.dart';
import 'componants/bottom_navigator.dart';

class DetailProduit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Body(),
      bottomNavigationBar: ButtomNavigatorBar(),
    );
  }
}

