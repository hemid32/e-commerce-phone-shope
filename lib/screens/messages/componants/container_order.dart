import 'package:flutter/material.dart';
import 'package:phoneshop/model/domand/model.dart';
import 'package:phoneshop/model/getModelFirebase/getMayOrder/my_order.dart';

class ContainerOrder extends StatelessWidget {
  ContainerOrder({
    Key? key,required  this.idOdere,required this.onTap,
  }) : super(key: key);
  final String idOdere ;
  final Function onTap ;

  GetMyOrder  _getOrder = GetMyOrder() ;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DomandProduit>(
        future: _getOrder.getItemDOmand(idOdere),
        builder: (context, snapshot) {
          return !snapshot.hasData ? Container() :  GestureDetector(
            onTap: (){onTap();},
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20 , vertical: 5),
              height: 80,
              decoration: BoxDecoration(
                color: Colors.white ,
                borderRadius: BorderRadius.circular(15) ,

              ),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.all(5),
                    width: 75,
                    height: 75,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                          image: NetworkImage(
                              snapshot.data!.listProduitBuy.itemCart[0].produit!.image!
                          ),
                          fit: BoxFit.contain
                      ),
                    ),
                  ) ,

                  Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 5 , vertical: 5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Text('number of items  : ${snapshot.data!.listProduitBuy.itemCart.length}' , style: Theme.of(context).textTheme.button?.copyWith(
                                color: Colors.black.withOpacity(0.4) ,
                                fontSize: 15
                            ),),
                          ),
                          Container(
                            child: Text('Shipping Method: ${snapshot.data!.methodSopping.method!.titleMethod}' , style: Theme.of(context).textTheme.button?.copyWith(
                                color: Colors.black.withOpacity(0.4) ,
                                fontSize: 15
                            ),),
                          ),
                          Container(
                            child: Text('Pay total: ${snapshot.data!.total}' , style: Theme.of(context).textTheme.button?.copyWith(
                                color: Colors.black.withOpacity(0.4) ,
                                fontSize: 15
                            ),),
                          ),


                        ],
                      ),
                    ),
                  )

                ],
              ),
            ),
          );
        }
    );
  }
}

