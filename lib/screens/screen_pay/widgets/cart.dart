import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/bloc/cartCalcul/bloc.dart';
import 'package:phoneshop/bloc/manageScreen/puy_screen/bloc.dart';
import 'package:phoneshop/bloc/manageScreen/puy_screen/events.dart';
import 'package:phoneshop/model/cart/cartCalcul.dart';
import 'package:phoneshop/model/cart/services.dart';
import 'package:phoneshop/screens/screen_pay/componants/button_costom_wight_infinty.dart';
import 'package:phoneshop/screens/screen_pay/componants/card_shoping_phone.dart';
import 'package:phoneshop/screens/screen_pay/componants/expendad_shoping_verefaid.dart';
import 'package:phoneshop/screens/screen_pay/componants/field_notes.dart';
import 'package:phoneshop/screens/screen_pay/componants/text_price_shoping.dart';
import 'package:phoneshop/screens/screen_pay/componants/text_return_back.dart';
import 'package:phoneshop/screens/screen_pay/componants/title.dart';

class Cart extends StatelessWidget {
  const Cart({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        ExpendedShoppingVerefaid(),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //TitleTextAligns(title: 'Detail de requist',) ,
              Text('Detail de Requist' , style:  Theme.of(context).textTheme.button.copyWith(color: Colors.black.withOpacity(0.7)),),
              for(var i = 0 ; i< itemsCart().length ; i++)  CardPhoneChope(
                image: itemsCart()[i].produit.image ,
                title: itemsCart()[i].produit.nomPhone,
                detail: itemsCart()[i].produit.detail,
                ram: itemsCart()[i].produit.ram,
                storage: itemsCart()[i].produit.storage ,
                contitu: itemsCart()[i].contituPay,
                price: itemsCart()[i].produit.price,
                deletCard: (){},
              ) ,

            ],
          ),
        ),
        SizedBox(height: 10,) ,
        BlocBuilder<CalculCartBloc, ModelCartCalcul>(
          builder: (context, state) {
            return Column(
              children: [
                TextPriceShoping(title: 'Total Produit : ', price:  state.totalProduit,)  ,
                TextPriceShoping(title: 'Shopping : ', price:  state.totalShopping ,)  ,
                TextPriceShoping(title: 'Total : ', price:  state.total,)  ,
              ],
            );
          }
        ),

        SizedBox(height: 10,) ,
        TitleTextAligns(title:  'Notes',) ,
        FieldNotes(onChanged: (text){print(text) ; }, hintText: 'Write Your Notes',) ,
        ButtonCostomWithInfiniti(title: 'Contunu Bay', onTap:  ()=> BlocProvider.of<PuyScreenBloc>(context).add(LastPuy()),) ,
        TextBack(text: 'Return Shopping ', onTap: (){},)

      ],
    );
  }
}

