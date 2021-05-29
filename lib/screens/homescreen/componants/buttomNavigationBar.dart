import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/bloc/manageScreen/home/bloc.dart';
import 'package:phoneshop/bloc/manageScreen/home/events.dart';
import 'package:phoneshop/constant.dart';
import 'package:phoneshop/screens/homescreen/widgeets/card.dart';
import 'package:phoneshop/screens/homescreen/widgeets/favorite.dart';
import 'package:phoneshop/screens/homescreen/widgeets/home.dart';
import 'package:phoneshop/screens/homescreen/widgeets/setting_app.dart';
import 'package:phoneshop/screens/screen_pay/widgets/cart.dart';

class BottomNavigationsBars extends StatelessWidget {

   BottomNavigationsBars({
    Key key,
  }) : super(key: key);




  @override
  Widget build(BuildContext context) {


    //print( BlocProvider.of<CounterBloc>(context).state == (Home().runtimeType)? ' false' : ' true ' ) ;
    return Container(
      //alignment: Alignment.center,
      padding:EdgeInsets.symmetric(horizontal: 20 , vertical: 10 ),
      width:  MediaQuery.of(context).size.width,
      height:  60,
      decoration:  BoxDecoration(
        color: Colors.white ,

      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlocBuilder<BlocHomeButtomBar , Widget>(
            builder: (_, snapshot) {
              return IconButtonBottom(
                icon:   Icons.home,
                onTap: (){ BlocProvider.of<BlocHomeButtomBar>(context).add(GoToHome()); },
                active:  (snapshot.runtimeType) == Home  ,
              );
            }
          ) ,
          BlocBuilder<BlocHomeButtomBar , Widget >(
            builder: (_, state) {
              return IconButtonBottom(
                icon:Icons.favorite,
                onTap: ()=> BlocProvider.of<BlocHomeButtomBar>(context).add(GoToFavorite()),
                active:   (state.runtimeType) == Favorite ,
              );
            }
          ) ,
          BlocBuilder<BlocHomeButtomBar , Widget>(
            builder: (_, state) {
              return IconButtonBottom(
                icon:Icons.shopping_cart,
                onTap: ()=> BlocProvider.of<BlocHomeButtomBar>(context).add(GoToCart()),
                active:   (state.runtimeType) == CartHome ,
              );
            }
          ) ,
          BlocBuilder<BlocHomeButtomBar , Widget>(
            builder: (_, state) {
              return IconButtonBottom(
                icon:Icons.person,
                onTap: ()=> BlocProvider.of<BlocHomeButtomBar>(context).add(GoToSetting()),
                active:  (state.runtimeType) == SettingAPP,
              );
            }
          ) ,

        ],
      ),

    );
  }
}

class IconButtonBottom extends StatelessWidget {
  const IconButtonBottom({
    Key key, this.icon, this.onTap, this.active = false ,
  }) : super(key: key);
  final IconData icon ;
  final Function onTap ;
  final bool active ;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [

          Icon(icon , size:  30, color:  active ? kPrimaryColor : Colors.black.withOpacity(0.4), ) ,
          Container(
            height: 2,
            width: 15,
            decoration: BoxDecoration(
                color: active ? kPrimaryColor : Colors.transparent,
                shape: BoxShape.rectangle
            ),
          )
        ],
      ),
    );
  }
}
