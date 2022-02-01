import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/bloc/cartScreenManage/bloc.dart';
import 'package:phoneshop/bloc/cartScreenManage/event.dart';
import 'package:phoneshop/bloc/manageScreen/detailProduit/bloc.dart';
import 'package:phoneshop/bloc/manageScreen/detailProduit/event.dart';
import 'package:phoneshop/bloc/userManagze/userVirifaid/bloc.dart';
import 'package:phoneshop/model/cart/cart.dart';
import 'package:phoneshop/model/cart/services.dart';
import 'package:phoneshop/model/getModelFirebase/getTotalProduitColors.dart';
import 'package:phoneshop/model/produit/produit_colors.dart';
import 'package:phoneshop/screens/detailProduit/detail_produit.dart';
import 'package:phoneshop/screens/homescreen/componants/header_setting.dart';
import 'package:phoneshop/screens/loginorRegester/login_or_regester.dart';
import 'package:phoneshop/screens/myOrder/componants/when_vide.dart';
import 'package:phoneshop/screens/screen_pay/componants/button_costom_wight_infinty.dart';
import 'package:phoneshop/screens/screen_pay/componants/card_shoping_phone.dart';
import 'package:phoneshop/screens/screen_pay/screen_pay.dart';

class CartHome extends StatelessWidget {
  const CartHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        //SearchAndIconMenu() ,
        HeaderSetting(titre:  'Cart',) ,
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20 , vertical: 20),
          child: BlocBuilder<BlocListDataCart , List<ModelCart>> (
            builder: (_, snapShot){
              //print('snapShot.data === $snapShot');
            return   FutureBuilder(
              builder: (context, snp) {
                return snapShot == null ? Container() :  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //TitleTextAligns(title: 'Detail de requist',) ,
                    for(var i =0 ; i < snapShot.length ; i++ ) Dismissible(
                      key:Key(snapShot[i].id!) ,
                      onDismissed: (derection) {
                        BlocProvider.of<BlocListDataCart>(context).add(EventDeletItemFromCart(i)) ;
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Item has been deleted', style: Theme.of(context).textTheme.button?.copyWith(fontSize: 18 , color: Colors.white),),));
                      },
                      child: CardPhoneChope(
                        onTap: ()async {
                          GetProduitTotalFromFirebas getPoduit = GetProduitTotalFromFirebas() ;
                          ProduitsColors produitColors = await  getPoduit.getProduitColorsWithId(snapShot[i].idProduitColors!) ;
                          BlocProvider.of<BlocScreenDetailProduit>(context).add(EvensGoToProduit(indexProduit: snapShot[i].produit!.id!, produisColors:  produitColors)) ;
                          Navigator.push(context, MaterialPageRoute(builder: (_)=> BlocProvider.value(
                              value: BlocProvider.of<BlocScreenDetailProduit>(context),
                          child:  BlocProvider.value(
                          value: BlocProvider.of<BlocUserVerifaid>(context),
                          child: DetailProduit()))));

                        },
                        image: snapShot[i].produit!.image! ,
                        title:snapShot[i].produit!.nomPhone!   , //snapShot[i].produit.nomPhone
                        detail:  snapShot[i].produit!.detail!,
                        ram: snapShot[i].produit!.ram!,
                        storage: snapShot[i].produit!.storage!,
                        contitu: snapShot[i].contituPay!,
                        price: snapShot[i].produit!.price!,
                        deletCard: (){
                          BlocProvider.of<BlocListDataCart>(context).add(EventDeletItemFromCart(i)) ;
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Item has been deleted', style: Theme.of(context).textTheme.button?.copyWith(fontSize: 18 , color: Colors.white),),));


                        }

                      ),
                    ) ,
                    SizedBox(height: 10,) ,

                    snapShot.length == 0 ? WhenVide(
                      title: 'Shop',
                      text: 'You have not added any items to the cart ! ',
                    ) :  BlocBuilder<BlocUserVerifaid , bool >(
                      builder: (context, user) {
                        return ButtonCostomWithInfiniti(title: 'Contunu Bay', onTap: (){

                          if(user) {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => Buy()));
                          }else {
                            Navigator.push(context, MaterialPageRoute(builder: (_)=> BlocProvider.value(

                                value: BlocProvider.of<BlocUserVerifaid>(context),
                                child: LoginOrRegester()))) ;
                          }

                        });
                      }
                    ) ,


                  ],
                );
              }
            ) ;
            }
          ),
        ),
        /*
        TextPriceShoping(title: 'Total Produit : ', price:  1540,)  ,
        TextPriceShoping(title: 'Shopping : ', price:  0,)  ,
        TextPriceShoping(title: 'Total : ', price:  1540,)  ,
        SizedBox(height: 10,) ,
        TitleTextAligns(title:  'Notes',) ,
        FieldNotes(onChanged: (text){print(text) ; }, hintText: 'Write Your Notes',) ,

         */

      ],
    );
  }
}

