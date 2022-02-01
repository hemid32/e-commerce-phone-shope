import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/bloc/cartCalcul/bloc.dart';
import 'package:phoneshop/bloc/cartCalcul/events.dart';
import 'package:phoneshop/bloc/cartScreenManage/bloc.dart';
import 'package:phoneshop/bloc/manageData/puy/bloc.dart';
import 'package:phoneshop/bloc/manageData/puy/event.dart';
import 'package:phoneshop/bloc/manageScreen/puy_screen/bloc.dart';
import 'package:phoneshop/bloc/manageScreen/puy_screen/events.dart';
import 'package:phoneshop/bloc/manageScreen/shoppingShoiMethods/bloc.dart';
import 'package:phoneshop/bloc/manageScreen/shoppingShoiMethods/event.dart';
import 'package:phoneshop/model/cart/services.dart';
import 'package:phoneshop/model/getModelFirebase/getMethodShopping/getMethod.dart';
import 'package:phoneshop/model/puy/address.dart';
import 'package:phoneshop/model/puy/shopping.dart';
import 'package:phoneshop/model/puy/shopping_method_is_shoi.dart';
import 'package:phoneshop/screens/screen_pay/componants/ContainerShoiMethodSHoping.dart';
import 'package:phoneshop/screens/screen_pay/componants/footer_button_shopping.dart';
import 'package:phoneshop/screens/screen_pay/componants/not_support_shopping_any_wilaya.dart';
import 'package:phoneshop/screens/screen_pay/componants/title.dart';
enum valueRadio { javatpoint, w3schools, tutorialandexample }

class Shopping extends StatelessWidget {
  const Shopping({
    Key? key,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    GetMethodShopping getMethodListShoppin = GetMethodShopping(
        wilaya: BlocProvider.of<AdressDataBloc>(context).state.wilaya
    );
    return FutureBuilder<TotalShoppingMethod>(
      future: getMethodListShoppin.getTotalShoppingMethod(),
      builder: (context, snapshot) {
        return snapshot.hasData ? snapshot.data!.methods!.length ==  0 ? NostatSepurtShopping() :  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleTextAligns(title: 'Methode Shoppin',) ,
            //Text('f')
            for(var i=0 ; i<  snapshot.data!.methods!.length   ; i++ )
              BlocBuilder<ShoppingBlocRadio, dynamic>(
                builder: (_, state) {
                  return RadioButton(
                    valure: snapshot.data!.methods![i].titleMethod ,
                    title: snapshot.data!.methods![i].titleMethod,
                    price: snapshot.data!.methods![i].price,
                    groub: state??snapshot.data!.methods![0].titleMethod,
                    onChanged: (valur){
                      MethodShoppingShoi methodShop = MethodShoppingShoi.froJson({
                        'method'  : snapshot.data!.methods![i]  ,
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
              buttonTap: ()   {
              //testMetod()[0]
              //print(' =============****================  ${BlocProvider.of<ShoppingDataBloc>(context).state.fin}') ;
              if( BlocProvider.of<ShoppingDataBloc>(context).state.fin == false ){
                MethodShoppingShoi methodShopResq = MethodShoppingShoi.froJson({
                  'method'  : snapshot.data!.methods![0]  ,
                  'fin' : true ,
                });
                 BlocProvider.of<ShoppingDataBloc>(context).add(AddShoppingData(methodShopResq)) ;
              }
              BlocProvider.of<PuyScreenBloc>(context).add(ContenuVarifeid()) ;

              BlocProvider.of<CalculCartBloc>(context).add(EventCart(
                listProduitCart: BlocProvider.of<BlocListDataCart>(context).state ,

                methodShopping: BlocProvider.of<ShoppingDataBloc>(context).state.fin == false ? MethodShoppingShoi.froJson({
                  'method': snapshot.data!.methods![0] ,
                  'fin': true
                }):BlocProvider.of<ShoppingDataBloc>(context).state )

              ) ;


            },
            )

          ],
        ): Container();
      }
    );
  }
}

