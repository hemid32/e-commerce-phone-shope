import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/bloc/myOrder/bloc.dart';
import 'package:phoneshop/bloc/myOrder/event.dart';
import 'package:phoneshop/constant.dart';
import 'package:phoneshop/screens/myOrder/widgets/order_send_domand.dart';
import 'package:phoneshop/screens/myOrder/widgets/recoved_order.dart';
import 'package:phoneshop/screens/myOrder/widgets/shopping_order.dart';

class HeaderMyOrder extends StatelessWidget {
  const HeaderMyOrder({
    Key key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size ;

    return Column(
      children: [
        Container(
          //alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 20),
          width: size.width,
          height: 100 ,
          decoration: BoxDecoration(
              color: kPrimaryColor
          ),
          child: Row(
            children: [
              GestureDetector(
                   onTap: ()=> Navigator.pop(context),
                  child: Icon(Icons.arrow_back , color: Colors.white ,size: 30,)) ,
              Expanded(
                child: Center(
                  child: Text('My Order' , style: Theme.of(context).textTheme.button.copyWith(
                      color: Colors.white ,
                      fontSize: 25
                  ),),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: size.width,
          height: 60,
          decoration: BoxDecoration(
              color: Colors.white
          ),
          child:Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BlocBuilder<BlocMyOrder , Widget >(
                builder: (context, state) {
                  return ButtonBarTob(
                    title: 'order domand',
                    active: state.runtimeType == OrderSendSomand,
                    onTap: ()=> BlocProvider.of<BlocMyOrder>(context).add(EventScreenMyOrderSandDomand()),

                  );
                }
              ),
              BlocBuilder<BlocMyOrder , Widget >(
                builder: (context, state) {
                  return ButtonBarTob(
                    title: 'Order Shopping',
                    active: state.runtimeType == ShoppingOrder,
                    onTap: ()=> BlocProvider.of<BlocMyOrder>(context).add(EventScreenMyOrderSoppingDomand()),

                  );
                }
              ),
              BlocBuilder<BlocMyOrder , Widget >(
                builder: (context, state) {
                  return ButtonBarTob(
                    title: 'Order Received',
                    active: state.runtimeType == ReceivedOrder ,
                    onTap: ()=> BlocProvider.of<BlocMyOrder>(context).add(EventScreenMyOrderRecovredDomand()),

                  );
                }
              ),

            ],
          ),
        )
      ],
    );
  }
}

class ButtonBarTob extends StatelessWidget {
  const ButtonBarTob({
    Key key,
    this.title, this.active, this.onTap,
  }) : super(key: key);
  final String title ;
  final bool active ;
  final Function onTap ;


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size ;

    return InkWell(
      onTap: onTap,
      child: Container(
        width: size.width *0.33,
        height: 60,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
                margin: EdgeInsets.only(top: 20),
                alignment: Alignment.center,
                child: Text('$title' , style: Theme.of(context).textTheme.button.copyWith(
                    color: active ? kPrimaryColor : Colors.black.withOpacity(0.4),

                    fontSize:  12
                ),)
            ),
            SizedBox(height: 10,) ,
            Container(
              width: double.infinity,
              height: 3,
              decoration: BoxDecoration(
                  color: active ?  kPrimaryColor : Colors.white

              ),
            )
          ],
        ),
      ),
    );
  }
}
