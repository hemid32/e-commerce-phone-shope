import 'package:flutter/material.dart';
import 'package:phoneshop/screens/homescreen/componants/button_waith_80.dart';
import 'package:phoneshop/screens/homescreen/homescreen.dart';

class WhenVide extends StatelessWidget {
  const WhenVide({
    Key? key, this.text = "There is no order shop now",required this.title,
  }) : super(key: key);
  final String text ;
  final String title ;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20,) ,
          Text('$text' , style: Theme.of(context).textTheme.button?.copyWith(
            fontSize: 20  ,
          ),),
          SizedBox(height: 20,) ,
          Icon(Icons.error_outline , size: 120) ,
          SizedBox(height: 20,) ,
          ButtonSizeWath80(
            color: Theme.of(context).accentColor,
            title: '$title',
            onTap: (){
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                  HomeScreen()), (Route<dynamic> route) => false) ;

            },
          )
        ],
      ),

    );
  }
}

