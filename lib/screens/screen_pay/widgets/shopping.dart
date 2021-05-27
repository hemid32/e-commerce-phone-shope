import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/bloc/manageData/puy/bloc.dart';
import 'package:phoneshop/bloc/manageData/puy/event.dart';
import 'package:phoneshop/bloc/manageScreen/puy_screen/bloc.dart';
import 'package:phoneshop/bloc/manageScreen/puy_screen/events.dart';
import 'package:phoneshop/bloc/manageScreen/shoppingShoiMethods/bloc.dart';
import 'package:phoneshop/bloc/manageScreen/shoppingShoiMethods/event.dart';
import 'package:phoneshop/model/puy/address.dart';
import 'package:phoneshop/model/puy/shopping.dart';
import 'package:phoneshop/model/puy/shopping_method_is_shoi.dart';
import 'package:phoneshop/screens/screen_pay/componants/ContainerShoiMethodSHoping.dart';
import 'package:phoneshop/screens/screen_pay/componants/footer_button_shopping.dart';
import 'package:phoneshop/screens/screen_pay/componants/title.dart';
enum valueRadio { javatpoint, w3schools, tutorialandexample }

class Shopping extends StatelessWidget {
  const Shopping({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleTextAligns(title: 'Methode Shoppin',) ,
        //Text('f')
        for(var i=0 ; i<  testMetod().length   ; i++ )
          BlocBuilder<ShoppingBlocRadio, dynamic>(
            builder: (_, state) {
              return RadioButton(
                valure: testMetod()[i].titleMethod ,
                title: testMetod()[i].titleMethod,
                price: testMetod()[i].price,
                groub: state??testMetod()[0].titleMethod,
                onChanged: (valur){
                  MethodShoppingShoi methodShop = MethodShoppingShoi.froJson({
                    'method'  : testMetod()[i]  ,
                    'fin' : true ,
                  });
                  BlocProvider.of<ShoppingDataBloc>(context).add(AddShoppingData(methodShop))  ;
                  BlocProvider.of<ShoppingBlocRadio>(context).add(EvenstRadio(valur));
                  },
              );
            }
          ),
        FooterButton(
          back: (){
            BlocProvider.of<PuyScreenBloc>(context).add(FirstAddAdress()) ;
          },
          textButton: 'Continu to  verefaid',
          backText: 'Return Shoping',
          buttonTap: (){
          //testMetod()[0]
          //print(' =============****================  ${BlocProvider.of<ShoppingDataBloc>(context).state.fin}') ;
          if( BlocProvider.of<ShoppingDataBloc>(context).state.fin == false ){
            MethodShoppingShoi methodShopResq = MethodShoppingShoi.froJson({
              'method'  : testMetod()[0]  ,
              'fin' : true ,
            });
            BlocProvider.of<ShoppingDataBloc>(context).add(AddShoppingData(methodShopResq)) ;
          }
          BlocProvider.of<PuyScreenBloc>(context).add(ContenuVarifeid()) ;

        },
        )

      ],
    );
  }
}

