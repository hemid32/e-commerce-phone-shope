import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/bloc/manageScreen/detailProduit/bloc.dart';
import 'package:phoneshop/bloc/manageScreen/detailProduit/event.dart';
import 'package:phoneshop/constant.dart';

class RowPriceANDContitus extends StatelessWidget {
  const RowPriceANDContitus(
      {Key? key,
      required this.price,
      required this.priceOld,
      required this.contitu})
      : super(key: key);

  final double price;
  final double priceOld;
  final int contitu;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('$price DZ  ',
            style: Theme.of(context)
                .textTheme
                .button
                ?.copyWith(fontSize: 20, color: kPrimaryColor)),
        priceOld != null
            ? Text('$priceOld DZ ',
                style: Theme.of(context).textTheme.button?.copyWith(
                      fontSize: 15,
                      decoration: TextDecoration.lineThrough,

                    ))
            : SizedBox(),
        Spacer(),
        GestureDetector(
          onTap: () {
            BlocProvider.of<BlocMinusAddProduitFromDetail>(context).add(
                EventMinus(
                    totalProduit: contitu,
                    courentContitu:
                        BlocProvider.of<BlocMinusAddProduitFromDetail>(context)
                            .state));
          },
          child: Container(
            height: 25,
            width: 25,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              //color: kBackgroundColor ,
              border: Border.all(color: Theme.of(context).iconTheme.color!),
            ),
            child: Container(
              height: 2.5,
              width: 7,
              decoration: BoxDecoration(color: Theme.of(context).iconTheme.color),
            ),
          ),
        ),
        SizedBox(
          width: 15,
        ),
        BlocBuilder<BlocMinusAddProduitFromDetail , int >(
          builder: (context, state) {
            return Text(
              '$state',
              style: Theme.of(context).textTheme.button?.copyWith(fontSize: 20),
            );
          }
        ),
        SizedBox(
          width: 15,
        ),
        GestureDetector(
          onTap: () {
            BlocProvider.of<BlocMinusAddProduitFromDetail>(context).add(
                EventAdd(
                    totalProduit: contitu,
                    courentContitu:
                        BlocProvider.of<BlocMinusAddProduitFromDetail>(context)
                            .state));
          },
          child: Container(
            height: 25,
            width: 25,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              //color: kBackgroundColor ,
              border: Border.all(color: Theme.of(context).iconTheme.color!),
            ),
            child: Icon(
              Icons.add,
              size: 15,
            ),
          ),
        ),
      ],
    );
  }
}
