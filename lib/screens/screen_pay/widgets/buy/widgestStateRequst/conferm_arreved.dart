import 'package:flutter/material.dart';
import 'package:phoneshop/screens/screen_pay/componants/container_buttom_prograss_shopping.dart';
import 'package:phoneshop/screens/screen_pay/componants/detailed_order.dart';
import 'package:phoneshop/screens/screen_pay/componants/double_button_bottom.dart';
import 'package:phoneshop/screens/screen_pay/componants/progress_shopping.dart';
import 'package:phoneshop/screens/screen_pay/componants/text_rich_buttom_deatils.dart';
class ConfermArrived extends StatelessWidget {
  const ConfermArrived({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProgressShopping(stat: 3,) ,
        ContainetButtomPrograssShopping(icon: Icons.check,) ,
        TextRichTitleDetails(
          title: 'It is done',
          detail: 'You have confirmed the order\'s arrival',
        ) ,
        DetaildedOrder(
        ),


        SizedBox(height: 20,),



        DoubleButtonButtom(iconBunnGreen: Icons.message, titleBunnGreen: 'Contect Me',
          iconBunnWaith: Icons.star,
          titleBunnWaith: 'feedBack',
        ) ,


      ],
    );
  }
}

