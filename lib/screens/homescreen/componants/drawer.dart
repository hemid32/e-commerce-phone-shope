import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:phoneshop/bloc/manageScreen/home/bloc.dart';
import 'package:phoneshop/bloc/manageScreen/home/events.dart';
import 'package:phoneshop/bloc/userManagze/userVirifaid/bloc.dart';
import 'package:phoneshop/bloc/userManagze/userVirifaid/event.dart';
import 'package:phoneshop/screens/homescreen/componants/costom_listTile.dart';
import 'package:phoneshop/screens/loginorRegester/login_or_regester.dart';
import 'package:phoneshop/screens/messages/messages.dart';
import 'package:phoneshop/screens/profile/profile.dart';

class DrawerApps extends StatelessWidget {
  const DrawerApps({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).accentColor,
      child: SingleChildScrollView(
      child: Column(
        children: [

          Container(
            alignment: Alignment.center,
            height: 120,
            margin: EdgeInsets.only(top: 40 , bottom: 10),
            child: SvgPicture.asset('assets/icons/icons8-apple-logo.svg'),
          ),
          BlocBuilder<BlocUserVerifaid , bool >(
              builder: (context, state) {
                //print('state user === $state') ;
                return CostomListTile(title:  state ? 'Account' : 'Login & register' , icon: Icons.person, onTap: (){
                  Scaffold.of(context).openEndDrawer() ;
                  if(!state){
                    Navigator.push(context, MaterialPageRoute(builder: (_)=> BlocProvider.value(

                        value: BlocProvider.of<BlocUserVerifaid>(context),
                        child: LoginOrRegester()))) ;


                  }else {
                    Navigator.push(context, MaterialPageRoute(builder: (_)=> BlocProvider.value(
                        value: BlocProvider.of<BlocUserVerifaid>(context),
                        child:  BlocProvider.value(
                                value: BlocProvider.of<BlocHomeButtomBar>(context),
                                child:Profile())

                    ))) ;

                  }

                },);
              }
          ) ,
          BlocBuilder<BlocUserVerifaid , bool >(
              builder: (context, user) {
                return CostomListTile(title: 'Messages' , icon: Icons.message,onTap: () async  {
                  Scaffold.of(context).openEndDrawer() ;
                  //showDialogloding(context) ;
                  //await Future.delayed(Duration(seconds: 2)) ;
                  //Navigator.pop(context) ;
                  if(user)
                    Navigator.push(context, MaterialPageRoute(builder: (_)=>  Messages())) ;
                  else
                    Navigator.push(context, MaterialPageRoute(builder: (_)=> BlocProvider.value(

                        value: BlocProvider.of<BlocUserVerifaid>(context),
                        child: LoginOrRegester()))) ;


                },
                );
              }
          ) ,
          CostomListTile(title: 'Call Store' , icon: Icons.call,onTap: (){},) ,
          CostomListTile(title: 'Setting' , icon: Icons.settings,onTap: (){
            Scaffold.of(context).openEndDrawer() ;
            BlocProvider.of<BlocHomeButtomBar>(context).add(GoToSetting());
            BlocProvider.of<BlocUserVerifaid>(context).add(EventsUserVerified());

          },) ,
          CostomListTile(title: 'feedback' , icon: Icons.feedback,onTap: (){},) ,
          CostomListTile(title: 'About' , icon: Icons.info,onTap: (){},) ,

        ],
      ),
    ),
    );
  }
}
