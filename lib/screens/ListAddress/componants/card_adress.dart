import 'package:flutter/material.dart';
import 'package:phoneshop/constant.dart';
import 'package:phoneshop/model/puy/address.dart';

class CardAdress extends StatelessWidget {
  const CardAdress({
    Key? key,
    required this.adress,required this.onDelet,required this.onTap,
  }) : super(key: key);

  final ModelAdress adress;
  final Function onDelet ;
  final Function onTap ;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size ;
    return InkWell(
      onTap: (){onTap();},
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.symmetric(horizontal: 10 , vertical: 5),
        width: size.width,
        height: 90,
        decoration: BoxDecoration(
            color: Theme.of(context).accentColor ,
            borderRadius: BorderRadius.circular(5)  ,
            border: Border.all()
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.location_on) ,
                    SizedBox(width: 10,) ,
                    Text(adress.prenome + ' ' + adress.nome , style: TextStyle(color: kPrimaryColor , fontSize: 15 , fontWeight: FontWeight.bold),)
                  ],
                ),
                Text( adress.adress1 + ' ' + adress.address2) ,
                Text( 'N:' + adress.nomberPhone + ' , Cod:' + adress.codPostal.toString() ) ,
              ],
            ) ,
            Spacer() ,
            Container(
                child: Column(
                  children: [
                    InkWell( onTap: (){onDelet();},child: Icon(Icons.close , size: 30,)),
                    Spacer() ,
                    //Icon(Icons.mode_edit_outline , size: 25,),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
