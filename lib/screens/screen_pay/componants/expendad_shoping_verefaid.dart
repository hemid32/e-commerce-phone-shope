import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/bloc/manageData/puy/bloc.dart';
import 'package:phoneshop/screens/screen_pay/componants/title.dart';
class ExpendedShoppingVerefaid extends StatelessWidget {
  const ExpendedShoppingVerefaid({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20 , vertical: 20),
      child: ExpansionTile(
        //leading : Icon(Icons , size: 30, color: Colors.greenAccent),
          title: TitleTextAligns(title : 'Adress Shopping'),
          children: <Widget>[

            Container(
              margin: EdgeInsets.symmetric(horizontal: 20 , vertical:  10),
              child: Column(
                children: [
                  items_shoping_verefaid(text: 'Nome', reponse:  BlocProvider.of<AdressDataBloc>(context).state.nome,),
                  items_shoping_verefaid(text: 'Prenom', reponse:  BlocProvider.of<AdressDataBloc>(context).state.prenome,),
                  items_shoping_verefaid(text: 'Email', reponse:  BlocProvider.of<AdressDataBloc>(context).state.email,),
                  items_shoping_verefaid(text: 'Phone', reponse:  BlocProvider.of<AdressDataBloc>(context).state.nomberPhone,),
                  items_shoping_verefaid(text: 'Wilaya', reponse:  BlocProvider.of<AdressDataBloc>(context).state.wilaya,),
                  items_shoping_verefaid(text: 'Daira', reponse:  BlocProvider.of<AdressDataBloc>(context).state.daira,),
                  items_shoping_verefaid(text: 'Adress1', reponse:  BlocProvider.of<AdressDataBloc>(context).state.adress1,),
                  items_shoping_verefaid(text: 'Adress2', reponse:  BlocProvider.of<AdressDataBloc>(context).state.address2,),
                  items_shoping_verefaid(text: 'cod Postal', reponse:  BlocProvider.of<AdressDataBloc>(context).state.codPostal.toString(),),
                  items_shoping_verefaid(text: 'Method shopping', reponse:  BlocProvider.of<ShoppingDataBloc>(context).state.method.titleMethod,),
                ],
              ),
            )

          ]
      ),
    );
  }
}

class items_shoping_verefaid extends StatelessWidget {
  const items_shoping_verefaid({
    Key key, this.text, this.reponse,
  }) : super(key: key);
  final String text ;
  final String reponse ;


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10 ),
      child: Row(
        children: [
          Text('$text : ' , style: Theme.of(context).textTheme.button,) ,
          SizedBox(width: 40,) ,
          Text('$reponse' , style: Theme.of(context).textTheme.button,) ,
        ],
      ),
    );
  }
}

