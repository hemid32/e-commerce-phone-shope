import 'package:flutter/material.dart';
import 'package:phoneshop/constant.dart';
import 'package:phoneshop/widgets/dialog_container.dart';
import 'package:phoneshop/widgets/slider_title.dart';

class ButtomNavigatorBars extends StatelessWidget {
  const ButtomNavigatorBars({
    Key key, this.onTap,
  }) : super(key: key);
  final Function onTap ;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
          color: Colors.white
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap:()=> _showMyDialog(context),

            child: Container(
              height: double.infinity,
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width / 2 ,
              decoration: BoxDecoration(
                  color: kPrimaryColor ,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20)
                  )
              ),
              child: Text('FILTER' , style:  Theme.of(context).textTheme.button.copyWith(color: Colors.white , fontSize:  20),),
            ),
          )
        ],
      ),
    );
  }
}
Future<void> _showMyDialog(context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return DialogContainer(
        widgets: [
            SlideContainer(
              title: 'Ram' ,
              onChange: (double value) {

              },
              max: 16,
              min: 2,
              divisions: 2,
              label: '5',
              value: 6,

            ),
          SlideContainer(
            title: 'Price' ,
            onChange: (double value) {

            },
            max: 100000,
            min: 2000,
            divisions: 500,
            label: '500',
            value: 3000,

          ),
        ],

        actions: [
          TextButton(
            child: Text('Approve'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],

      );
    },
  );
}

