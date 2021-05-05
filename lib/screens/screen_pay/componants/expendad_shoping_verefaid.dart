import 'package:flutter/material.dart';
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
                  items_shoping_verefaid(text: 'Nome', reponse:  'Hemidi Benameur',),
                  items_shoping_verefaid(text: 'Email', reponse:  'HemidiBenameur@gmail.com',),
                  items_shoping_verefaid(text: 'Phone', reponse:  '0665489218',),
                  items_shoping_verefaid(text: 'Wilaya', reponse:  'El bayadh',),
                  items_shoping_verefaid(text: 'Daira', reponse:  'BosamGHon',),
                  items_shoping_verefaid(text: 'Adress1', reponse:  '0665489218',),
                  items_shoping_verefaid(text: 'Adress2', reponse:  '0665489218',),
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
          Text('$text : ' , style: Theme.of(context).textTheme.button.copyWith(color: Colors.black.withOpacity(0.3)),) ,
          SizedBox(width: 40,) ,
          Text('$reponse' , style: Theme.of(context).textTheme.button.copyWith(color: Colors.black.withOpacity(0.3)),) ,
        ],
      ),
    );
  }
}

