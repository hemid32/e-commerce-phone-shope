import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/bloc/manageData/puy/bloc.dart';
import 'package:phoneshop/bloc/manageScreen/puy_screen/bloc.dart';
import 'package:phoneshop/bloc/manageScreen/puy_screen/events.dart';
import 'package:phoneshop/model/puy/address.dart';
import 'package:phoneshop/screens/screen_pay/componants/ContainerShoiMethodSHoping.dart';
import 'package:phoneshop/screens/screen_pay/componants/footer_button_shopping.dart';
import 'package:phoneshop/screens/screen_pay/componants/title.dart';
enum BestTutorSite { javatpoint, w3schools, tutorialandexample }

class Shopping extends StatelessWidget {
  const Shopping({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleTextAligns(title: 'Methode Shoppin',) ,
        //Text('f')
        RadioButton(valure: BestTutorSite.javatpoint, title: 'Yalidin', price: 500,),
        RadioButton(valure: BestTutorSite.tutorialandexample, title: 'Fest Shoping',price:  200,),
        RadioButton(valure: BestTutorSite.w3schools, title: 'Algeria Post', price:  0,),
        FooterButton(back: (){}, textButton: 'Continu to  verefaid', backText: 'Return Shoping',buttonTap: (){


          //print(BlocProvider.of<AdressDataBloc>(context).state.nome) ;
          BlocProvider.of<PuyScreenBloc>(context).add(ContenuVarifeid()) ;

        },)

      ],
    );
  }
}

