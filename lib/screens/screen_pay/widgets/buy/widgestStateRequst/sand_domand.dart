import 'package:flutter/material.dart';
import 'package:phoneshop/screens/screen_pay/componants/container_buttom_prograss_shopping.dart';
import 'package:phoneshop/screens/screen_pay/componants/double_button_bottom.dart';
import 'package:phoneshop/screens/screen_pay/componants/progress_shopping.dart';
import 'package:phoneshop/screens/screen_pay/componants/text_rich_buttom_deatils.dart';

class SandDomand extends StatelessWidget {
  const SandDomand({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProgressShopping(stat: 1,) ,
        ContainetButtomPrograssShopping(icon: Icons.check,) ,
        TextRichTitleDetails(
          title: 'Your request has been sent',
          detail: 'Your order is currently being processed. After approval, your order will be shipped',
        ) ,


        DoubleButtonButtom(iconBunnGreen: Icons.message, titleBunnGreen: 'Contect Me',
          iconBunnWaith: Icons.close,
          titleBunnWaith: 'Cencel Requist',
        ) ,



      ],
    );
  }
}

