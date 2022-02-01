import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/bloc/dataDetailsOrder/bloc.dart';
import 'package:phoneshop/bloc/dataDetailsOrder/event.dart';
import 'package:phoneshop/constant.dart';
import 'package:phoneshop/model/cart/cartCalcul.dart';
import 'package:phoneshop/model/domand/model.dart';
import 'package:phoneshop/model/getModelFirebase/getMayOrder/my_order.dart';
import 'package:phoneshop/screens/datilOrder/detail_order.dart';
import 'package:phoneshop/screens/myOrder/componants/container_my_order.dart';
import 'package:intl/intl.dart';
import 'package:phoneshop/screens/myOrder/componants/when_vide.dart';

class OrderSendSomand extends StatelessWidget {
  OrderSendSomand({
    Key? key,
  }) :  super(key: key);

  GetMyOrder getOrder = new GetMyOrder() ;




  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ListDomands>(
        future: getOrder.getListDomandsSendRequest(),
        builder: (context, snapshot) {
          return snapshot.hasData ? Column(
            children: [
              for(var i = 0 ; i< snapshot.data!.domands.length ; i++ ) ContainerMayOrder(
                icon: Icons.shopping_cart,
                date: DateFormat('yyyy-MM-dd – kk:mm').format(snapshot.data!.domands[i].date),
                pay:  snapshot.data!.domands[i].total.toString(),//total
                smilIcon: Icons.email,
                onTap: () async {
                  //print('snapshot.data.domands[i].listProduitBuy.itemCart 37 **** == ${snapshot.data.domands[i].total}');
                  
                  BlocProvider.of<BlocDataOrderShow>(context).add(EventDataOdererShoawData(
                    listMedelCart: snapshot.data!.domands[i].listProduitBuy.itemCart ,
                    calulerBuy: ModelCartCalcul.FromJson({
                      'totalProduit' : snapshot.data!.domands[i].priceTotalProduit ,
                      'totalShopping' : snapshot.data!.domands[i].priceShopping ,
                      'total' : snapshot.data!.domands[i].total ,

                    }) ,
                    state: snapshot.data!.domands[i].stateDomand ,
                    address: snapshot.data!.domands[i].addres ,
                    methoShopping: snapshot.data!.domands[i].methodSopping ,
                    uidDomand: snapshot.data!.domands[i].uidDomand
                  ));
                  showDialogloding(context) ;
                  await Future.delayed(Duration(seconds: 1)) ;
                  Navigator.pop(context) ;
                  Navigator.push(context, MaterialPageRoute(builder: (_)=> BlocProvider.value(
                      value: BlocProvider.of<BlocDataOrderShow>(context),
                      child: DetailOrder()))
                  );


                },
                state: 'sand domand',
              ),
              snapshot.data!.domands.length == 0 ? WhenVide(
                text: 'No request has been sent',
                title: 'Shop',
              ) : Container()

            ],
          ) : Center(child: CircularProgressIndicator());
        }
    );
  }
}

