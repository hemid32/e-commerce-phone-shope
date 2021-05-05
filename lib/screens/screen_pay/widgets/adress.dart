import 'package:flutter/material.dart';
import 'package:phoneshop/screens/screen_pay/componants/container_text_And_icon.dart';
import 'package:phoneshop/screens/screen_pay/componants/drop_dawen.dart';
import 'package:phoneshop/screens/screen_pay/componants/field_text.dart';
import 'package:phoneshop/screens/screen_pay/componants/footer_buttons.dart';
import 'package:phoneshop/screens/screen_pay/componants/title.dart';

class Addres extends StatelessWidget {
  const Addres({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FieldTextGet(title: 'Nome',) ,
        FieldTextGet(title: 'Prenome',) ,
        FieldTextGet(title: 'Nombre Phone',) ,
        FieldTextGet(title: 'Email Adress',) ,
        ContainerAndIconAndText_Seach(title: 'Search Your Adress', icon:  Icon(Icons.location_searching_sharp),),
        ContainerAndIconAndText_Seach(title: 'Shoise Your Adress', icon:  Icon(Icons.account_box),) ,
        TitleTextAligns(title:  'Wilaya',) ,
        DropDawen(valur: 'hemidi', items: ['hemidi' , 'benameur' , 'yyy'], onTap: (valeur)=>print(valeur),),
        FieldTextGet(title: 'Daira',) ,
        FieldTextGet(title: 'adress',) ,
        FieldTextGet(title: 'adress 2 ',) ,
        FieldTextGet(title: 'Cod Postal',) ,
        FooterButtons(titleButton1: 'Continu Shoping', titleButton2: 'Save Address', onTapButton1: (){}, onTapButton2: (){},)

      ],
    );
  }
}

