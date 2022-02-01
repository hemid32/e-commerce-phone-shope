import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/bloc/manageScreen/home/bloc.dart';
import 'package:phoneshop/bloc/manageScreen/home/events.dart';
import 'package:phoneshop/constant.dart';
import 'package:phoneshop/screens/homescreen/componants/button_waith_80.dart';
import 'package:phoneshop/screens/search/search_screen.dart';

class ContainerFavVide extends StatelessWidget {
  const ContainerFavVide({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size ;

    return Container(
      child: Column(
        children: [
          Icon(Icons.favorite, size: 150, color: kPrimaryColor.withOpacity(0.4),) ,
          Container(
            width: size.width * 0.9,
            child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    children: [
                      TextSpan(
                          text: 'I don\'t have a wishlist \n' ,
                          style: Theme.of(context).textTheme.headline1
                      ) ,
                      TextSpan(
                          text: 'Click on the icon next to the product to add it to my favorites list. Save it here!' ,
                          style: Theme.of(context).textTheme.button
                      ) ,
                    ]
                )),
          ),
          SizedBox(height: 20,) ,

          ButtonSizeWath80(
            title: 'Start shopping',
            color: kPrimaryColor,
            onTap: (){ BlocProvider.of<BlocHomeButtomBar>(context).add(GoToHome()); },
          ),
          SizedBox(height: 10,),
          ButtonSizeWath80(
            title: 'Find a product',
            color: Colors.black.withOpacity(0.1),
            onTap:  ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> Search())),
          ),

        ],
      ),


    );
  }
}


