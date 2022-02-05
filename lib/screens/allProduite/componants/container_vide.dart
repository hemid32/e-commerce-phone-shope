import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/bloc/manageScreen/home/bloc.dart';
import 'package:phoneshop/bloc/manageScreen/home/events.dart';
import 'package:phoneshop/constant.dart';
import 'package:phoneshop/screens/homescreen/componants/button_waith_80.dart';
import 'package:phoneshop/screens/search/search_screen.dart';

class ContainerProduitSearchVide extends StatelessWidget {
  const ContainerProduitSearchVide({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size ;

    return Container(
      child: Column(
        children: [
          Icon(Icons.search_off_outlined, size: 150, color: kPrimaryColor.withOpacity(0.4),) ,
          Container(
            width: size.width * 0.9,
            child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    children: [
                      TextSpan(
                          text: 'No results\n' ,
                          style: Theme.of(context).textTheme.headline1
                      ) ,
                      TextSpan(
                          text: 'There is no product that matches your search preferences. Try changing the filter settings or going back to the main page!' ,
                          style: Theme.of(context).textTheme.button
                      ) ,
                    ]
                )),
          ),
          SizedBox(height: 20,) ,

          ButtonSizeWath80(
            title: 'Back to Home',
            color: kPrimaryColor,
            onTap: (){
              //BlocProvider.of<BlocHomeButtomBar>(context).add(GoToHome());
               Navigator.pop(context) ;

              },
          ),
          SizedBox(height: 10,),
          /*
          ButtonSizeWath80(
            title: 'Find a product',
            color: Colors.black.withOpacity(0.1),
            onTap:  (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> Search())) ;

              },
          ),

           */

        ],
      ),


    );
  }
}
