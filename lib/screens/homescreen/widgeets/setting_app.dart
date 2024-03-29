


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/bloc/languge/bloc.dart';
import 'package:phoneshop/bloc/languge/state.dart';
import 'package:phoneshop/bloc/manageScreen/home/bloc.dart';
import 'package:phoneshop/bloc/manageScreen/home/events.dart';
import 'package:phoneshop/bloc/notification/bloc.dart';
import 'package:phoneshop/bloc/notification/state.dart';
import 'package:phoneshop/bloc/theme/bloc.dart';
import 'package:phoneshop/bloc/theme/event.dart';
import 'package:phoneshop/bloc/userManagze/userVirifaid/bloc.dart';
import 'package:phoneshop/constant.dart';
import 'package:phoneshop/oitil/snack_bar.dart';
import 'package:phoneshop/screens/homescreen/componants/costom_listTile.dart';
import 'package:phoneshop/screens/homescreen/componants/costom_list_tile_switch.dart';
import 'package:phoneshop/screens/homescreen/componants/header_setting.dart';
import 'package:phoneshop/screens/homescreen/componants/item_list_language.dart';
import 'package:phoneshop/screens/loginorRegester/login_or_regester.dart';
import 'package:phoneshop/screens/messages/messages.dart';
import 'package:phoneshop/screens/profile/profile.dart';
import 'package:phoneshop/services/lang/appLocat.dart';

class SettingAPP extends StatelessWidget {
  const SettingAPP({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeaderSetting(titre:  'Setting App',) ,
       BlocBuilder<BlocUserVerifaid , bool >(
          builder: (context, state) {
            //print('state user === $state') ;
            return CostomListTile(title:  state ? 'Account' : 'Login & register' , icon: Icons.person, onTap: (){

              if(!state){
                Navigator.push(context, MaterialPageRoute(builder: (_)=> BlocProvider.value(

                    value: BlocProvider.of<BlocUserVerifaid>(context),
                    child: LoginOrRegester()))) ;


              }else {
                Navigator.push(context, MaterialPageRoute(builder: (_)=> BlocProvider.value(
                  value: BlocProvider.of<BlocUserVerifaid>(context),
                  child:   BlocProvider.value(
                          value: BlocProvider.of<BlocHomeButtomBar>(context),
                          child:Profile())

                ))) ;

              }

            },);
          }
        ) ,
        Container(
          alignment: Alignment.bottomLeft,
          margin: EdgeInsets.symmetric(horizontal: 20 , vertical:  20),
          child: Text('Setting General' , style:  Theme.of(context).textTheme.button?.copyWith(fontSize: 20 ),),
        ) ,
        CostomListTile(title: 'List Favorite' , icon: Icons.favorite, onTap: (){

          BlocProvider.of<BlocHomeButtomBar>(context).add(GoToFavorite());

        },) ,
        BlocConsumer<BlocNotification , StateBlocNotification>(
          listener: (context , state){
            if(state is StateBlocNotificationSubscrip ){
              showInSnackBar(context ,'Notifications enabled', color: kPrimaryColor ) ;
            }else if (state is StateBlocNotificationUnsubscrip){
              showInSnackBar(context ,'Notifications are disabled', color: kPrimaryColor ) ;
            }
          },
          builder: (context, snapshot) {
            return CostomListTimeSwitch(valur: BlocNotification.get(context).notificationIsActive ,icon: Icons.notifications, title: 'Notification', onChanged: (valuer){
              if(valuer)
              BlocNotification.get(context).subscribe() ;
              else
                BlocNotification.get(context).unSubscribe() ;

            },);
          }
        ),
        BlocBuilder<BlocUserVerifaid , bool >(
          builder: (context, user) {
            return CostomListTile(title: 'Messages' , icon: Icons.message,onTap: () async  {
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
        //CostomListTile(title: 'Language' , icon: Icons.language,onTap: (){
          BlocConsumer<BlocLanguage , StateBlocLanguage>(
            listener: (context, state){

              if(state is StateBlocLanguageChangeLanguage){
                //Toast.show('Language has changed', context ) ;
                showInSnackBar(context ,'Language has changed', color: kPrimaryColor ) ;


              }
            },
            builder: (context, snapshot) {
              return PopupMenuButton(
                color: Theme.of(context).accentColor,
                onSelected: (String  newLang)=>BlocLanguage.get(context).changeLocal(newLang),
                child: CostomListTileChangeLang(title: getLang(context , 'language') , icon: Icons.language ),
                itemBuilder:(context)=> [
                PopupMenuItem(  value: 'ar',child: ItemListMenu(title: 'ar', icon:  'assets/icons/ar.svg', valueLang: 'ar',)) ,
                PopupMenuItem(  value: 'fr',child: ItemListMenu(title: 'fr', icon:  'assets/icons/ar.svg', valueLang: 'fr',)) ,
                PopupMenuItem(  value: 'en',child: ItemListMenu(title: 'en', icon:  'assets/icons/ar.svg', valueLang: 'en',)) ,

              ]  ,
              );
            }
          ),

        //},) ,

        BlocBuilder<BlocTheme , List >(
          builder: (context, state) {
            //print('state[0] === ${state[0]}') ;
            return CostomListTimeSwitch(valur: state[0] == ThemeMode.dark ,icon: Icons.brightness_3, title: 'Dark Mode', onChanged: (valuer){
              BlocProvider.of<BlocTheme>(context).add(EventsChangeThemeMode(
                value: valuer ,
              )) ;
            },);
          }
        ),
        CostomListTile(title: 'FeedBack' , icon: Icons.star,onTap: (){},) ,
        CostomListTile(title: 'Accept Private' , icon: Icons.security,onTap: (){},) ,
        CostomListTile(title: 'About me' , icon: Icons.info,onTap: (){},) ,

      ],
    );
  }
}

