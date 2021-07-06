import 'package:flutter/material.dart';
import 'package:phoneshop/screens/screen_pay/componants/container_buttom_prograss_shopping.dart';
import 'package:phoneshop/screens/screen_pay/componants/detailed_order.dart';
import 'package:phoneshop/screens/screen_pay/componants/double_button_bottom.dart';
import 'package:phoneshop/screens/screen_pay/componants/progress_shopping.dart';
import 'package:phoneshop/screens/screen_pay/componants/text_rich_buttom_deatils.dart';

class AcceptAndChopping extends StatelessWidget {
  const AcceptAndChopping({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProgressShopping(stat: 2,) ,
        ContainetButtomPrograssShopping(icon: Icons.shopping_bag_outlined,) ,
        TextRichTitleDetails(
          title: 'Your order has been shipped',
          detail: 'The request is on its way to you, please confirm arrival when receiving your order',
        ) ,

        DetaildedOrder(
        ),


        SizedBox(height: 20,),



        DoubleButtonButtom(iconBunnGreen: Icons.check, titleBunnGreen: 'Confirm access',
          iconBunnWaith: Icons.message,
          titleBunnWaith: 'Contect Me',
        ) ,



      ],
    );
  }
}

