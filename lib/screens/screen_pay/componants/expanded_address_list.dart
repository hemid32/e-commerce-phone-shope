import 'package:flutter/material.dart';
import 'package:phoneshop/model/puy/address.dart';
import 'package:phoneshop/screens/screen_pay/componants/radioButton_list_addres.dart';
import 'package:phoneshop/screens/screen_pay/componants/title_text_address_chois.dart';

class ExpandedColumnAddesses extends StatelessWidget {
  const ExpandedColumnAddesses({
    Key? key,
    required this.address,required this.valure,required this.groub,required this.onChanged,
  }) : super(key: key);

  final ModelAdress address  ;
  final String valure ;
  final String groub  ;
  final Function onChanged ;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(

      collapsedBackgroundColor: Colors.black.withOpacity(0.07),
      //trailing: SizedBox(width: 0,),
      //leading: SizedBox(),
      tilePadding: EdgeInsets.only(right: 10),
      backgroundColor: Colors.black.withOpacity(0.07),

      title: RadioButtonListAddress(
        valure: valure ,
        title: address.nome +' '+ address.prenome,
        groub: groub,
        onChanged: onChanged,
      ) , children: [
      Column(
        children: [
          TextTileAddress(
            title: 'Phone ',
            details: address.nomberPhone ,
          ),
          TextTileAddress(
            title: 'Email ',
            details: address.email ,
          ),
          TextTileAddress(
            title: 'Wilaya ',
            details: address.wilaya ,
          ),
          TextTileAddress(
            title: 'Daira ',
            details: address.daira ,
          ),
          TextTileAddress(
            title: 'Address 1 ',
            details: address.adress1 ,
          ),
          TextTileAddress(
            title: 'Address 2  ',
            details: address.address2 ,
          ),
          TextTileAddress(
            title: 'Code Postal ',
            details: address.codPostal.toString() ,
          ),

        ],
      )

    ],);
  }
}
