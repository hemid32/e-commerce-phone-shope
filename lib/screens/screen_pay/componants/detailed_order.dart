import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/bloc/dataDetailsOrder/bloc.dart';
import 'package:phoneshop/screens/screen_pay/componants/card_shoping_phone.dart';
import 'package:phoneshop/screens/screen_pay/componants/expendad_shoping_verefaid.dart';
import 'package:phoneshop/screens/screen_pay/componants/text_price_shoping.dart';

class DetaildedOrder extends StatelessWidget {
  const DetaildedOrder({
    Key? key
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    print('BlocProvider.of<BlocDataOrderShow>(context).state[3] ==${BlocProvider.of<BlocDataOrderShow>(context).state[3]}') ;
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: ExpansionTile(
            //backgroundColor: kPrimaryColor.withOpacity(0.23),
            title: Text('Produits'),
            children: [
              for(var i = 0 ; i< BlocProvider.of<BlocDataOrderShow>(context).state[3].length ; i++)  CardPhoneChope(
                onTap: (){},
                image:  BlocProvider.of<BlocDataOrderShow>(context).state[3][i].produit.image, //BlocProvider.of<BlocListDataCart>(context).state[i].produit.image ,
                title: BlocProvider.of<BlocDataOrderShow>(context).state[3][i].produit.nomPhone,//BlocProvider.of<BlocListDataCart>(context).state[i].produit.nomPhone,
                detail:BlocProvider.of<BlocDataOrderShow>(context).state[3][i].produit.detail ,  //BlocProvider.of<BlocListDataCart>(context).state[i].produit.detail,
                ram: BlocProvider.of<BlocDataOrderShow>(context).state[3][i].produit.ram , //BlocProvider.of<BlocListDataCart>(context).state[i].produit.ram,
                storage: BlocProvider.of<BlocDataOrderShow>(context).state[3][i].produit.storage , //BlocProvider.of<BlocListDataCart>(context).state[i].produit.storage ,
                contitu: BlocProvider.of<BlocDataOrderShow>(context).state[3][i].produit.contitu , //BlocProvider.of<BlocListDataCart>(context).state[i].produit.contitu,
                price: BlocProvider.of<BlocDataOrderShow>(context).state[3][i].produit.price , //BlocProvider.of<BlocListDataCart>(context).state[i].produit.price,
                deletCard:  (){} ,
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: ExpansionTile(
            //backgroundColor: kPrimaryColor.withOpacity(0.23),

            title: Text('Address'),
            children: [
              items_shoping_verefaid(text: 'Nome', reponse: BlocProvider.of<BlocDataOrderShow>(context).state[2].nome ,),//BlocProvider.of<AdressDataBloc>(context).state.nome
              items_shoping_verefaid(text: 'Prenom', reponse:  BlocProvider.of<BlocDataOrderShow>(context).state[2].prenome ,),
              items_shoping_verefaid(text: 'Email', reponse:  BlocProvider.of<BlocDataOrderShow>(context).state[2].email ,),
              items_shoping_verefaid(text: 'Phone', reponse:  BlocProvider.of<BlocDataOrderShow>(context).state[2].nomberPhone,),
              items_shoping_verefaid(text: 'Wilaya', reponse:  BlocProvider.of<BlocDataOrderShow>(context).state[2].wilaya,),
              items_shoping_verefaid(text: 'Daira', reponse:  BlocProvider.of<BlocDataOrderShow>(context).state[2].daira,),
              items_shoping_verefaid(text: 'Adress1', reponse: BlocProvider.of<BlocDataOrderShow>(context).state[2].adress1,),
              items_shoping_verefaid(text: 'Adress2', reponse:  BlocProvider.of<BlocDataOrderShow>(context).state[2].address2,),
              items_shoping_verefaid(text: 'Cod Postal', reponse:  BlocProvider.of<BlocDataOrderShow>(context).state[2].codPostal.toString(),),
              items_shoping_verefaid(text: 'Method shopping', reponse:  BlocProvider.of<BlocDataOrderShow>(context).state[1].method.titleMethod,),//BlocProvider.of<ShoppingDataBloc>(context).state.method.titleMethod

            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: ExpansionTile(
            //backgroundColor: kPrimaryColor.withOpacity(0.23),
            title: Text('Buy'),
            children: [
              TextPriceShoping(title: 'Total Produit : ', price:BlocProvider.of<BlocDataOrderShow>(context).state[0].totalProduit ,)  ,// BlocProvider.of<CalculCartBloc>(context).state.totalProduit
              TextPriceShoping(title: 'Shopping : ', price:  BlocProvider.of<BlocDataOrderShow>(context).state[0].totalShopping ,)  ,
              TextPriceShoping(title: 'Total : ', price:   BlocProvider.of<BlocDataOrderShow>(context).state[0].total,)  ,

            ],
          ),
        ),
      ],
    );
  }
}

