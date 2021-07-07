

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/bloc/userManagze/userVirifaid/bloc.dart';
import 'package:phoneshop/screens/homescreen/componants/costom_listTile.dart';
import 'package:phoneshop/screens/homescreen/componants/costom_list_tile_switch.dart';
import 'package:phoneshop/screens/homescreen/componants/header_setting.dart';
import 'package:phoneshop/screens/loginorRegester/login_or_regester.dart';
import 'package:phoneshop/screens/messages/messages.dart';
import 'package:phoneshop/screens/profile/profile.dart';

class SettingAPP extends StatelessWidget {
  const SettingAPP({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeaderSetting(titre:  'Setting App',) ,
       BlocBuilder<BlocUserVerifaid , bool >(
          builder: (context, state) {
            print('state user === $state') ;
            return CostomListTile(title:  state ? 'Account' : 'Login & register' , icon: Icons.person, onTap: (){

              if(!state){
                Navigator.push(context, MaterialPageRoute(builder: (_)=> BlocProvider.value(

                    value: BlocProvider.of<BlocUserVerifaid>(context),
                    child: LoginOrRegester()))) ;


              }else {
                Navigator.push(context, MaterialPageRoute(builder: (_)=> BlocProvider.value(
                  value: BlocProvider.of<BlocUserVerifaid>(context),
                  child:  Profile()

                ))) ;

              }

            },);
          }
        ) ,
        Container(
          alignment: Alignment.bottomLeft,
          margin: EdgeInsets.symmetric(horizontal: 20 , vertical:  20),
          child: Text('Setting General' , style:  Theme.of(context).textTheme.button.copyWith(fontSize: 20 , color: Colors.black.withOpacity(0.5 )),),
        ) ,
        CostomListTile(title: 'List Favorite' , icon: Icons.favorite, onTap: (){},) ,
        CostomListTimeSwitch(valur: false,icon: Icons.notifications, title: 'Notification', onChanged: (valuer){},),
        CostomListTile(title: 'Messages' , icon: Icons.message,onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> Messages())) ;
        },) ,
        CostomListTile(title: 'Languge' , icon: Icons.language,onTap: (){},) ,
        CostomListTimeSwitch(valur: false,icon: Icons.brightness_3, title: 'Dark Mode', onChanged: (valuer){},),
        CostomListTile(title: 'FeedBack' , icon: Icons.star,onTap: (){},) ,
        CostomListTile(title: 'Accept Private' , icon: Icons.security,onTap: (){},) ,
        CostomListTile(title: 'About me' , icon: Icons.info,onTap: (){},) ,

      ],
    );
  }
}

