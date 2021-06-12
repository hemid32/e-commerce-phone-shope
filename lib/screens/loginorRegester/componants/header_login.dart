import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:phoneshop/bloc/userManagze/screenLoginRegister/bloc.dart';
import 'package:phoneshop/bloc/userManagze/screenLoginRegister/event.dart';

class TextTileHeaderLogin extends StatelessWidget {
  const TextTileHeaderLogin({
    Key key, this.title, this.details,
  }) : super(key: key);
  final String title ;
  final String details ;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: ()=> BlocProvider.of<BlocScreenLoginRegisterManage>(context).add(EventScreenRegisterOrLogin()),
          child: Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(top: 40 , left: 20 , right:  20 ),
            child: Icon(Icons.arrow_back , size: 30, color: Colors.white,),
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.only(top: 20 , left: 20 , right:  20 ),
          child: RichText(
              text: TextSpan(
                  text: '$title' ,
                  style:  Theme.of(context).textTheme.headline3.copyWith(color: Colors.white,fontWeight: FontWeight.bold)
              )),
        ),
        Container(
          margin: EdgeInsets.only(top: 10 , left: 20 , right:  20 ),

          child: RichText(text: TextSpan(
              text: '$details' ,
              style:  Theme.of(context).textTheme.button.copyWith(color: Colors.white,fontWeight: FontWeight.bold)
          )),
        )
      ],
    );
  }
}

