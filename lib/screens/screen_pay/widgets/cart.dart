import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/bloc/manageScreen/puy_screen/bloc.dart';
import 'package:phoneshop/bloc/manageScreen/puy_screen/events.dart';
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
              CardPhoneChope(
                image: 'assets/images/Redmi_Note_9_Pro_5G_6.png',
                title: 'Samsung Gtx 10',
                detail: 'dvfnvfdnjv dfjnvjkdnvdfjvn dkvnndfvnjfd dfkvnjfdvjn fdjvnjfdvn',
                ram: 4,
                storage: 120,
                contitu: 1,
                price: 1200,
                deletCard: (){},
              ) ,
              CardPhoneChope(
                image: 'assets/images/Redmi_Note_9_Pro_5G_6.png',
                title: 'Samsung Gtx 10',
                detail: 'dvfnvfdnjv dfjnvjkdnvdfjvn dkvnndfvnjfd dfkvnjfdvjn fdjvnjfdvn',
                ram: 4,
                storage: 120,
                contitu: 1,
                price: 1200,
                deletCard: (){},
              ) ,

            ],
          ),
        ),
        SizedBox(height: 10,) ,
        TextPriceShoping(title: 'Total Produit : ', price:  1540,)  ,
        TextPriceShoping(title: 'Shopping : ', price:  1540,)  ,
        TextPriceShoping(title: 'Total : ', price:  1540,)  ,
        SizedBox(height: 10,) ,
        TitleTextAligns(title:  'Notes',) ,
        FieldNotes(onChanged: (text){print(text) ; }, hintText: 'Write Your Notes',) ,
        ButtonCostomWithInfiniti(title: 'Contunu Bay', onTap:  ()=> BlocProvider.of<PuyScreenBloc>(context).add(LastPuy()),) ,
        TextBack(text: 'Return Shopping ', onTap: (){},)

      ],
    );
  }
}

