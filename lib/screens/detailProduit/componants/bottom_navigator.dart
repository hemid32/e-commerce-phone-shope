import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/bloc/addToCart/bloc.dart';
import 'package:phoneshop/bloc/addToCart/event.dart';
import 'package:phoneshop/bloc/manageScreen/detailProduit/bloc.dart';
import 'package:phoneshop/constant.dart';
import 'package:phoneshop/screens/screen_pay/screen_pay.dart';

class ButtomNavigatorBar extends StatelessWidget {
  const ButtomNavigatorBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
          color: Colors.white
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: (){
              BlocProvider.of<BlocAddToCartNewProduit>(context).add(EventAddNewProduitToCart(
                contitu: BlocProvider.of<BlocMinusAddProduitFromDetail>(context).state ,
                produit: BlocProvider.of<BlocScreenDetailProduit>(context).state[0] ,
              ));
              Navigator.push(context, MaterialPageRoute(builder: (context)=> Buy()));
              },
            child: Container(
              height: double.infinity,
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width / 2 ,
              decoration: BoxDecoration(
                  color: kPrimaryColor ,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20)
                  )
              ),
              child: Text('BUY NOW' , style:  Theme.of(context).textTheme.button.copyWith(color: Colors.white , fontSize:  20),),
            ),
          ) ,
          Expanded(
            child: GestureDetector(
              onTap: ()=> BlocProvider.of<BlocAddToCartNewProduit>(context).add(EventAddNewProduitToCart(
                contitu: BlocProvider.of<BlocMinusAddProduitFromDetail>(context).state ,
                produit: BlocProvider.of<BlocScreenDetailProduit>(context).state[0] ,
              )) ,
              child: Container(
                alignment: Alignment.center,
                child: Text('ADD TO CART' , style:  Theme.of(context).textTheme.button.copyWith(color: kPrimaryColor , fontSize:  20),),
              ),
            ),
          )
        ],
      ),
    );
  }
}
