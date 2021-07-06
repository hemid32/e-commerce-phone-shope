import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/bloc/cartCalcul/bloc.dart';
import 'package:phoneshop/bloc/cartCalcul/events.dart';
import 'package:phoneshop/bloc/cartScreenManage/bloc.dart';
import 'package:phoneshop/bloc/cartScreenManage/event.dart';
import 'package:phoneshop/bloc/damand/bloc.dart';
import 'package:phoneshop/bloc/damand/event.dart';
import 'package:phoneshop/bloc/dataDetailsOrder/bloc.dart';
import 'package:phoneshop/bloc/dataDetailsOrder/event.dart';
import 'package:phoneshop/bloc/laodingCirceler/bloc.dart';
import 'package:phoneshop/bloc/laodingCirceler/events.dart';
import 'package:phoneshop/bloc/manageData/puy/bloc.dart';
import 'package:phoneshop/bloc/manageScreen/puy_screen/bloc.dart';
import 'package:phoneshop/bloc/manageScreen/puy_screen/events.dart';
import 'package:phoneshop/constant.dart';
import 'package:phoneshop/model/cart/cart.dart';
import 'package:phoneshop/model/cart/cartCalcul.dart';
import 'package:phoneshop/model/cart/services.dart';
import 'package:phoneshop/model/domand/model.dart';
import 'package:phoneshop/model/puy/shopping_method_is_shoi.dart';
import 'package:phoneshop/model/user/user.dart';
import 'package:phoneshop/screens/screen_pay/componants/button_costom_wight_infinty.dart';
import 'package:phoneshop/screens/screen_pay/componants/card_shoping_phone.dart';
import 'package:phoneshop/screens/screen_pay/componants/expendad_shoping_verefaid.dart';
import 'package:phoneshop/screens/screen_pay/componants/field_notes.dart';
import 'package:phoneshop/screens/screen_pay/componants/text_price_shoping.dart';
import 'package:phoneshop/screens/screen_pay/componants/text_return_back.dart';
import 'package:phoneshop/screens/screen_pay/componants/title.dart';
import 'package:uuid/uuid.dart';

class Cart extends StatelessWidget {
   Cart({
    Key key,
  }) : super(key: key);

  String _note ;

  var uuid = Uuid() ;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        ExpendedShoppingVerefaid(),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: BlocBuilder<BlocListDataCart , List<ModelCart>>(
            builder: (context, itemsCart) {
              return  BlocListener<BlocListDataCart,  List<ModelCart>>(
                listener: (context, state) {
                  // do stuff here based on BlocA's state
                  BlocProvider.of<CalculCartBloc>(context).add(EventCart(
                      listProduitCart: state ,
                      methodShopping: BlocProvider.of<ShoppingDataBloc>(context).state
                  ));
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //TitleTextAligns(title: 'Detail de requist',) ,
                    Text('Detail de Requist' , style:  Theme.of(context).textTheme.button.copyWith(color: Colors.black.withOpacity(0.7)),),
                    for(var i = 0 ; i< itemsCart.length ; i++)  CardPhoneChope(
                        image: itemsCart[i].produit.image ,
                        title: itemsCart[i].produit.nomPhone,
                        detail: itemsCart[i].produit.detail,
                        ram: itemsCart[i].produit.ram,
                        storage: itemsCart[i].produit.storage ,
                        contitu: itemsCart[i].contituPay,
                        price: itemsCart[i].produit.price,
                        deletCard:  ()=> BlocProvider.of<BlocListDataCart>(context).add(EventDeletItemFromCart(i)) ,
                      ),


                  ],
                ),
              );
            }
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
        FieldNotes(onChanged: (text){ _note = text ; }, hintText: 'Write Your Notes',) ,
        BlocListener<BlocLoading , bool>(
          listener:  (_, states){
            if(states== true  ){
              showDialogloding(context) ;
            }else if(states == false ) {
              Navigator.pop(context);
              //_showMyDialogSandCod(context , _phone) ;
            }
          },
          child: ButtonCostomWithInfiniti(title: 'Contunu Bay', onTap:  (){
            BlocProvider.of<BlocLoading>(context).add(EventLoadingStart()) ;


            String uidDomandCreat = uuid.v1() ;

            BlocProvider.of<BlocDataOrderShow>(context).add(EventDataOdererShoawData(
              listMedelCart: BlocProvider.of<BlocListDataCart>(context).state ,
              calulerBuy:BlocProvider.of<CalculCartBloc>(context).state ,
              methoShopping: BlocProvider.of<ShoppingDataBloc>(context).state ,
              state: 0 ,
              address: BlocProvider.of<AdressDataBloc>(context).state ,
              uidDomand: uidDomandCreat ,
            ));



            DomandProduit  _domand = DomandProduit.fromJson({
              'nombreDomand' : 5555 ,
              'listProduitBuy' : ListModelCarte.FormJson({'itemCart' : BlocProvider.of<BlocListDataCart>(context).state  ,
              }) ,
              'addres' : BlocProvider.of<AdressDataBloc>(context).state ,
              'methodSopping' : BlocProvider.of<ShoppingDataBloc>(context).state ,
              'user' : UserLocalModel.fromJson({
                             'email' : 'hemidi@gmail.com' ,
                              'password' : '********' ,
                              'nombrePhon' : '0265656' ,
                               'image' : 'image' ,
                               'uid' : FirebaseAuth.instance.currentUser.uid
              }) ,
              'nots' :  _note ,
              'stateDomand' : 0 ,
              'priceShopping' :  BlocProvider.of<CalculCartBloc>(context).state.totalShopping ,
              'priceTotalProduit' : BlocProvider.of<CalculCartBloc>(context).state.totalProduit ,
              'total' : BlocProvider.of<CalculCartBloc>(context).state.total ,
              'uidDomand' : uidDomandCreat,

            }) ;


            BlocProvider.of<BlocSandDamand>(context).add(EventSandDomand(domandData: _domand)) ;

            //BlocProvider.of<PuyScreenBloc>(context).add(LastPuy());



            },),
        ) ,
        TextBack(text: 'Return Shopping ', onTap: (){

        },)

      ],
    );
  }
}

