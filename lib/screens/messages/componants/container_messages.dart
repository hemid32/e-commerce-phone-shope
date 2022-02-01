import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/bloc/getMessageq/bloc.dart';
import 'package:phoneshop/constant.dart';

class MessageUser extends StatelessWidget {
  const MessageUser({
    Key? key,required this.text,required this.date, this.activeDate = false,required this.onTap, required this.id ,
  }) : super(key: key);
  final String text ;
  final String date ;
  final bool activeDate  ;
  final Function  onTap ;
  final String id ;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: (){onTap();},
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                    color: kPrimaryColor.withOpacity(0.23) ,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8) ,
                      topRight: Radius.circular(8) ,
                      bottomLeft: Radius.circular(8) ,
                    )

                ),
                child: Text('$text' , style: Theme.of(context).textTheme.button?.copyWith(
                    fontSize: 18
                ),),
              ),
            BlocProvider.of<BlocMessagesActiveDate>(context).state[1] == id  && activeDate ? Container(
              alignment: Alignment.centerRight,
              child: Text('$date'),
            ) : Container()
          ],
        ),
      ),

    );
  }
}

class MessageAdmin extends StatelessWidget {
  const MessageAdmin({
    Key? key,required  this.text,required  this.date, this.activeDate = false,required this.onTap,required this.id ,
  }) : super(key: key);
  final String text ;
  final String date ;
  final bool activeDate ;
  final Function onTap ;
  final String id ;


  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          GestureDetector(
            onTap: (){onTap();},
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                  color: Colors.white ,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8) ,
                    topRight: Radius.circular(8) ,
                    bottomRight: Radius.circular(8) ,
                  )

              ),
              child: Text('$text' , style: Theme.of(context).textTheme.button?.copyWith(
                  fontSize: 18
              ),),
            ),
          ),
          BlocProvider.of<BlocMessagesActiveDate>(context).state[1] == id  && activeDate ? Container(
            alignment: Alignment.centerLeft,
            child: Text('$date'),
          ) : Container() ,
        ],
      ),
    );
  }
}

