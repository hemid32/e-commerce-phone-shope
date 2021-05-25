
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:phoneshop/screens/screen_pay/componants/field_text.dart';

import 'textFeild_and_search_bar.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          FieldTextAndIconSearch()


        ],
      ),
    );
  }
}

