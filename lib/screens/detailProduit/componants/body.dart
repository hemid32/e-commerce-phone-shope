

import 'package:flutter/material.dart';

import 'body_details_widgets.dart';
import 'header_detail.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size ;
    return SingleChildScrollView(
      child: Column(
        children: [
          HeaderDetail(image: 'assets/images/Redmi_Note_9_Pro_5G_6.png',) ,
          BodyDetail(title: 'Samsung Gtx 23' , price:  500, priceOld:  600,),


        ],
      ),
    );

  }
}

