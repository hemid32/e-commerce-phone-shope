import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/bloc/dataDetailsOrder/bloc.dart';
import 'package:phoneshop/constant.dart';
import 'package:phoneshop/model/domand/servisec_domand.dart';
import 'package:phoneshop/model/messages/model_messages.dart';
import 'package:phoneshop/model/messages/services_messages.dart';
import 'package:phoneshop/screens/homescreen/homescreen.dart';
import 'package:phoneshop/screens/messages/messages.dart';
import 'package:phoneshop/screens/screen_pay/componants/container_buttom_prograss_shopping.dart';
import 'package:phoneshop/screens/screen_pay/componants/detailed_order.dart';
import 'package:phoneshop/screens/screen_pay/componants/double_button_bottom.dart';
import 'package:phoneshop/screens/screen_pay/componants/progress_shopping.dart';
import 'package:phoneshop/screens/screen_pay/componants/text_rich_buttom_deatils.dart';
import 'package:phoneshop/screens/screen_pay/widgets/buy/function/dialogCancelOrder.dart';
import 'package:toast/toast.dart';

class SandDomand extends StatelessWidget {
  const SandDomand({
    Key? key,
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
            onTapGreen: ()async  {
              // go to messages and sand order
              var mesg = Message(
                  type : 'order' , text : 'text' , uidUser :  FirebaseAuth.instance.currentUser!.uid ,
                  date: DateTime.now() ,
                  uidOrder: BlocProvider.of<BlocDataOrderShow>(context).state[5]
              ) ;
              var save  = ServesicesImage(
                  mesgae: mesg
              ) ;
              bool _result = await save.saveToFireBase() ;
              if(_result){
               // _controller.clear() ;
                Navigator.push(context, MaterialPageRoute(builder: (context)=> Messages())) ;
              }
            },
            titleBunnWaith: 'Cencel Requist',
            onTapWath: () async {
              var  objectCancel = CancelDomandSanded(uidDomand: BlocProvider.of<BlocDataOrderShow>(context).state[5]) ;
              //print(await objectCancel.getIdDecDomand()) ;
              showMyDialogDeletOrder(context , () async  {
                var  objectCancel = CancelDomandSanded(uidDomand: BlocProvider.of<BlocDataOrderShow>(context).state[5]) ;
                var _resultCancel = await objectCancel.deletFromFireBase() ;
                if(_resultCancel == true){
                  showDialogloding(context) ;

                  Toast.show("the request has been canceled", context, duration: 5, gravity:  Toast.BOTTOM);
                  await Future.delayed(Duration(seconds: 1)) ;
                  Navigator.pop(context );
                  Navigator.pop(context );
                  //Navigator.pop(context );
                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                      HomeScreen()), (Route<dynamic> route) => false) ;


                  /*
                  Navigator.pushReplacement<void, void>(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) =>  MyOrder(),
                    ),
                  );

                   */
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

