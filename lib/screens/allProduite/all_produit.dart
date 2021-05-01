

import 'package:flutter/material.dart';

import 'componants/body.dart';
import 'componants/buttomNavigator.dart';

class AllProduit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      bottomNavigationBar: ButtomNavigatorBars(),


    );
  }
}

