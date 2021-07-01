import 'package:flutter/material.dart';
import 'package:phoneshop/model/domand/model.dart';
import 'package:phoneshop/model/getModelFirebase/getMayOrder/my_order.dart';
import 'package:phoneshop/screens/myOrder/componants/container_my_order.dart';
import 'package:intl/intl.dart';
import 'package:phoneshop/screens/myOrder/componants/when_vide.dart';

class OrderSendSomand extends StatelessWidget {
  OrderSendSomand({
    Key key,
  }) :  super(key: key);

  GetMyOrder getOrder = new GetMyOrder() ;




  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ListDomands>(
        future: getOrder.getListDomandsSendRequest(),
        builder: (context, snapshot) {
          return snapshot.hasData ? Column(
            children: [
              for(var i = 0 ; i< snapshot.data.domands.length ; i++ ) ContainerMayOrder(
                icon: Icons.shopping_cart,
                date: DateFormat('yyyy-MM-dd – kk:mm').format(snapshot.data.domands[i].date),
                pay:  snapshot.data.domands[i].total.toString(),//total
                smilIcon: Icons.email,
                onTap: (){},
                state: 'sand domand',
              ),
              snapshot.data.domands.length == 0 ? WhenVide(
                text: 'No request has been sent',
                title: 'Shop',
              ) : Container()

            ],
          ) : Center(child: CircularProgressIndicator());
        }
    );
  }
}

