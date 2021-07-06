import 'package:flutter/material.dart';
import 'package:phoneshop/constant.dart';

Future<void> showMyDialogDeletOrder(contextOriginal, Function onTap) async {
  return showDialog<void>(
    context: contextOriginal,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0))),

            title: const Text('Cancelling order'),
        content: SingleChildScrollView(
          child: ListBody(
            children: const <Widget>[
              //Text('This is a demo alert dialog.'),
              Text('Do you want to cancel this order?'),
            ],
          ),
        ),
        actions: <Widget>[
          Container(
            height: 40,
            //width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: ()=> Navigator.pop(contextOriginal),
                  child: Container(
                    alignment: Alignment.center,
                    width:120,
                    decoration: BoxDecoration(
                      color: kPrimaryColor ,
                      borderRadius: BorderRadius.circular(20) ,
                    ),
                    child: Text('No', style: Theme.of(context).textTheme.button.copyWith(
                      color: Colors.white ,
                      fontSize:  15 ,
                    ),),
                  ),
                ) ,
                GestureDetector(
                  onTap: onTap,
                  child: Container(
                    alignment: Alignment.center,
                    width: 120,
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.23) ,
                        borderRadius: BorderRadius.circular(20) ,


                    ),
                    child: Text('cancel odrer', style: Theme.of(context).textTheme.button.copyWith(
                      color: Colors.white ,
                      fontSize:  15 ,
                    ),),
                  ),
                )

              ],
            ),
          )
        ],
      );
    },
  );
}

