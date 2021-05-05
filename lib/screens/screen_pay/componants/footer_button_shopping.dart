import 'package:flutter/material.dart';
import 'package:phoneshop/constant.dart';

class FooterButton extends StatelessWidget {
  const FooterButton({
    Key key, this.back, this.backText, this.textButton,
  }) : super(key: key);
  final Function back ;
  final String backText  ;
  final String  textButton ;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(horizontal: 20 , vertical:  20),
          height: 40,
          width: double.infinity,
          decoration: BoxDecoration(
              color: kPrimaryColor.withOpacity(0.8)
          ),
          child: Text('$textButton' , style: Theme.of(context).textTheme.button.copyWith(
              color: Colors.white , fontSize: 15
          ),),
        ),
        GestureDetector(
          onTap: back,
          child: Container(

            child: Text('$backText' , style:  Theme.of(context).textTheme.button.copyWith(
                decoration: TextDecoration.underline, color: Colors.black.withOpacity(0.4)
            ),),
          ),
        )
      ],
    );
  }
}


