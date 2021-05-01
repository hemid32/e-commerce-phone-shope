


import 'package:flutter/material.dart';

import 'componants/body.dart';
import 'componants/buttomNavigationBar.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Body(),

      bottomNavigationBar: BottomNavigationsBars(),

    );
  }
}

