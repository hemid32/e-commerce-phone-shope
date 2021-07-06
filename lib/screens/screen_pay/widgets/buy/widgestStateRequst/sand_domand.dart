import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/bloc/cartCalcul/bloc.dart';
import 'package:phoneshop/bloc/cartScreenManage/bloc.dart';
import 'package:phoneshop/bloc/dataDetailsOrder/bloc.dart';
import 'package:phoneshop/bloc/manageData/puy/bloc.dart';
import 'package:phoneshop/constant.dart';
import 'package:phoneshop/model/domand/servisec_domand.dart';
import 'package:phoneshop/screens/screen_pay/componants/card_shoping_phone.dart';
import 'package:phoneshop/screens/screen_pay/componants/container_buttom_prograss_shopping.dart';
import 'package:phoneshop/screens/screen_pay/componants/detailed_order.dart';
import 'package:phoneshop/screens/screen_pay/componants/double_button_bottom.dart';
import 'package:phoneshop/screens/screen_pay/componants/expendad_shoping_verefaid.dart';
import 'package:phoneshop/screens/screen_pay/componants/progress_shopping.dart';
import 'package:phoneshop/screens/screen_pay/componants/text_price_shoping.dart';
import 'package:phoneshop/screens/screen_pay/componants/text_rich_buttom_deatils.dart';
import 'package:phoneshop/screens/screen_pay/widgets/buy/function/dialogCancelOrder.dart';
import 'package:toast/toast.dart';

class SandDomand extends StatelessWidget {
  const SandDomand({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ProgressShopping(stat: 1,) ,
          ContainetButtomPrograssShopping(icon: Icons.check,) ,
          TextRichTitleDetails(
            title: 'Your request has been sent',
            detail: 'Your order is currently being processed. After approval, your order will be shipped',
          ) ,

          DetaildedOrder(
          ),


          SizedBox(height: 20,),





          DoubleButtonButtom(
            iconBunnGreen: Icons.message, titleBunnGreen: 'Contect Me',
            iconBunnWaith: Icons.close,
            titleBunnWaith: 'Cencel Requist',
            onTapWath: () async {
              var  objectCancel = CancelDomandSanded(uidDomand: BlocProvider.of<BlocDataOrderShow>(context).state[5]) ;
              //print(await objectCancel.getIdDecDomand()) ;
              showMyDialogDeletOrder(context , () async  {
                var  objectCancel = CancelDomandSanded(uidDomand: BlocProvider.of<BlocDataOrderShow>(context).state[5]) ;
                var _resultCancel = await objectCancel.deletFromFireBase() ;
                if(_resultCancel == true){
                  Navigator.pop(context );
                  Toast.show("the request has been canceled", context, duration: 5, gravity:  Toast.BOTTOM);
                  Navigator.pop(context );
                }else {
                  Toast.show("${_resultCancel.message}", context, duration: 5, gravity:  Toast.BOTTOM);
                }

              }) ;


            },

          ) ,



        ],
      ),
    );
  }
}

