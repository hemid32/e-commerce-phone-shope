import 'package:flutter/material.dart';
import 'package:phoneshop/constant.dart';

import 'componants/body.dart';

class DetailProduit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Body(),
      bottomNavigationBar: Container(
        height: 60,
        decoration: BoxDecoration(
            color: Colors.white
        ),
        child: Row(
          children: [
            Container(
              height: double.infinity,
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width / 2 ,
              decoration: BoxDecoration(
                  color: kPrimaryColor ,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20)
                  )
              ),
              child: Text('BUY NOW' , style:  Theme.of(context).textTheme.button.copyWith(color: Colors.white , fontSize:  20),),
            ) ,
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: Text('ADD TO CART' , style:  Theme.of(context).textTheme.button.copyWith(color: kPrimaryColor , fontSize:  20),),
              ),
            )
         ],
        ),
      ),
    );
  }
}
