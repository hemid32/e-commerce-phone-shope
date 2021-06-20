import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/bloc/userManagze/userVirifaid/bloc.dart';
import 'package:phoneshop/bloc/userManagze/userVirifaid/event.dart';
import 'package:phoneshop/constant.dart';
import 'package:phoneshop/screens/homescreen/componants/costom_listTile.dart';
import 'package:phoneshop/screens/profile/componants/image_user.dart';
import 'package:phoneshop/screens/profile/componants/name.dart';

import 'backgound_header.dart';

class Body extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size ;
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: size.width ,
            height: size.height,
            child: Stack(
              children: [
                BakcgroundHerader() ,
                Positioned(
                  top: size.height *0.4 - 60,
                  left: size.width *0.10,
                  //right: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10 , vertical: 20),
                    width: size.width *0.8,
                    height:size.height * 0.7,
                    decoration: BoxDecoration(
                      color: Colors.white , 
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.settings , size: 30,) ,
                            Spacer() ,
                            Icon(Icons.ac_unit_sharp , size: 30,)
                          ],
                        ),
                        SizedBox(height: 20,) ,

                        NomeUser(
                          name: FirebaseAuth.instance.currentUser.displayName,
                          email: FirebaseAuth.instance.currentUser.email,
                        ),
                        Divider() ,
                        CostomListTile(title: 'May Order' , icon: Icons.shopping_cart, onTap: (){},) ,
                        CostomListTile(title: 'Address' , icon: Icons.location_on, onTap: (){},) ,
                        CostomListTile(title: 'My favorite' , icon: Icons.favorite, onTap: (){},) ,
                        CostomListTile(title: 'LogOut' , icon: Icons.logout, onTap: ()async {
                          await FirebaseAuth.instance.signOut() ;
                          Navigator.pop(context) ;
                          BlocProvider.of<BlocUserVerifaid>(context).add(EventsUserVerified());

                        },) ,


                      ],
                    ),
                  ),
                ) ,
                Positioned(
                  top: size.height * 0.4 - 120,
                  left: 0,
                  right: 0,
                  child: ImageUser(
                    image: 'assets/images/user.png',
                  ),
                )
                
              ],
            ),
          )
        ],
      ),
    );

  }
}


