import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/bloc/damand/bloc.dart';
import 'package:phoneshop/bloc/manageData/puy/bloc.dart';
import 'package:phoneshop/bloc/manageScreen/puy_screen/bloc.dart';
import 'package:phoneshop/bloc/manageScreen/puy_screen/events.dart';
import 'package:phoneshop/constant.dart';
import 'package:phoneshop/screens/screen_pay/screen_pay.dart';
import 'package:phoneshop/screens/screen_pay/widgets/adress.dart';
import 'package:phoneshop/screens/screen_pay/widgets/buy/buy.dart';
import 'package:phoneshop/screens/screen_pay/widgets/buy/widgestStateRequst/sand_domand.dart';
import 'package:phoneshop/screens/screen_pay/widgets/cart.dart';
import 'package:phoneshop/screens/screen_pay/widgets/shopping.dart';
class Items_Menuu extends StatelessWidget {
  const Items_Menuu({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20 , left:  20 , right:  20),
      child: Row(
        children: [
          BlocBuilder<PuyScreenBloc, Widget>(
            builder: (_, state) {
              return ItemTopMenu(
                title:  'Adress ',
                active:  state.runtimeType == Addres ,
                onTap: ()=>BlocProvider.of<PuyScreenBloc>(context).add(FirstAddAdress()),
                fin: BlocProvider.of<AdressDataBloc>(context).state.fine,
              );
            }
          ) ,
          BlocBuilder<PuyScreenBloc, Widget>(
            builder: (_, state) {
              return ItemTopMenu(
                title:  'Shopping',
                active:  state.runtimeType == Shopping ,
                fin:  BlocProvider.of<ShoppingDataBloc>(context).state.fin ,
                onTap: ()=>BlocProvider.of<PuyScreenBloc>(context).add(ContinuShopping()),
              );
            }
          ),
          BlocBuilder<PuyScreenBloc, Widget>(
            builder: (_, state) {
              return ItemTopMenu(
                  title: 'Verefaid',
                  active:  state.runtimeType == Cart ,
                  onTap: ()=>BlocProvider.of<PuyScreenBloc>(context).add(ContenuVarifeid()) ,
                  fin: BlocProvider.of<BlocSandDamand>(context).state == true ? true : false ,
              );
            }
          ),
          BlocBuilder<PuyScreenBloc, Widget>(
            builder: (_, state) {
              return ItemTopMenu(
                  title: 'Buy',
                  active: state.runtimeType == DetailOrderaFterBuy ,
                  onTap: ()=>BlocProvider.of<PuyScreenBloc>(context).add(LastPuy()) ,
                  //fin: true ,
              );
            }
          ) ,

        ],
      ),
    );
  }
}



class ItemTopMenu extends StatelessWidget {

  const ItemTopMenu({
    Key key, this.title ,this.active = false, this.fin = false, this.onTap
  }) : super(key: key);
  final bool active ;
  final bool fin  ;
  final String title ;
  final Function onTap ;


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size ;

    return GestureDetector(
      onTap: fin ?  onTap : (){} ,
      child: Container(
        width:  size.width / 4  - kDefaultPadding/2,
        child: Column(
          children: [
            Text('$title' , style: Theme.of(context).textTheme.button.copyWith(
              color: active || fin ? kPrimaryColor.withOpacity(0.6) : Colors.black.withOpacity(0.4) ,
            ),) ,
            Divider( color: active || fin  ? kPrimaryColor.withOpacity(0.6) :  Colors.black.withOpacity(0.23) ),

          ],
        ),

      ),
    );
  }
}

