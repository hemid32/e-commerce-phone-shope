import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/bloc/manageScreen/puy_screen/bloc.dart';
import 'package:phoneshop/bloc/manageScreen/puy_screen/events.dart';
import 'package:phoneshop/screens/screen_pay/componants/text_return_back.dart';

import 'button_costom_wight_infinty.dart';

class NostatSepurtShopping extends StatelessWidget {
  const NostatSepurtShopping({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          children: [
            Icon(Icons.error_outline , size: 100, color: Colors.black.withOpacity(0.4),) ,
            RichText(
                textAlign: TextAlign.center,
                text : TextSpan(
                  text: 'There is no state-supported shipping method \n '
                      'Change the shipping address to a supported state' ,
                  style: Theme.of(context).textTheme.button.copyWith(
                    color: Colors.black.withOpacity(0.4) ,
                    fontSize: 18 ,

                  ),
                )) ,


            SizedBox(height: 20,) ,
            //TextBack(text: 'Return Address ', onTap: (){



            Container(
              margin: EdgeInsets.symmetric(horizontal: 2),
              child: ButtonCostomWithInfiniti(
                title:'Return Address' ,
                onTap: (){
                  BlocProvider.of<PuyScreenBloc>(context).add(FirstAddAdress()) ;

                },
              ),
            )





          ],
        ),



      ),
    );
  }
}

