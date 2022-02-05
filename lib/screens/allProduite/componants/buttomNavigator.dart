import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/bloc/fatchAllData/bloc.dart';
import 'package:phoneshop/bloc/slideFilter/bloc.dart';
import 'package:phoneshop/bloc/slideFilter/state.dart';
import 'package:phoneshop/constant.dart';
import 'package:phoneshop/widgets/dialog_container.dart';
import 'package:phoneshop/widgets/slider_title.dart';

class ButtomNavigatorBars extends StatelessWidget {
  const ButtomNavigatorBars({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return Container(
      height: 60,
      decoration: BoxDecoration(color: Colors.white),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {

              _showMyDialogFilter(context)
              ;},
            child: Container(
              height: double.infinity,
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width / 2,
              decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius:
                      BorderRadius.only(topRight: Radius.circular(20))),
              child: Text(
                'FILTER',
                style: Theme.of(context)
                    .textTheme
                    .button
                    ?.copyWith(color: Colors.white, fontSize: 20),
              ),
            ),
          )
        ],
      ),
    );
  }
}

Future<void> _showMyDialogFilter(contextOrigin) async {
  return showDialog<void>(
    context: contextOrigin,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return BlocConsumer<BlocSlideFilter , StetSlideFilter>(
        listener: (context , state){},
        builder: (context, snapshot) {
          return DialogContainer(
            title: '',
            widgets: [
           SlideContainer(
                  title: 'Ram',
                  onChange: (double value) {
                       BlocSlideFilter.get(contextOrigin).changeRam(value) ;
                  },
                  max: 16,
                  min: 2,
                  divisions: 2,
                  label: '${BlocSlideFilter.get(contextOrigin).ram} GB',
                  value: BlocSlideFilter.get(contextOrigin).ram ,
                ),
           SlideContainer(
                    title: 'Storage',
                    onChange: (double value) {
                      BlocSlideFilter.get(contextOrigin).changeStorage(value);
                    },
                    max: 600,
                    min: 5,
                    divisions: 5,
                    label: '${BlocSlideFilter.get(contextOrigin).storage} GB',
                    value: BlocSlideFilter.get(contextOrigin).storage,


              ),
           SlideContainer(
                      title: 'Camera',
                      onChange: (double value) {
                        BlocSlideFilter.get(contextOrigin).changeCamera(value);
                      },
                      max: 108,
                      min: 8,
                      divisions: 4,
                      label: '${BlocSlideFilter.get(contextOrigin).camera} MP',
                      value: BlocSlideFilter.get(contextOrigin).camera,
                    ),
           SlideContainer(
                      title: 'Price',
                      onChange: (double value) {
                        BlocSlideFilter.get(contextOrigin).changePrice(value) ;
                      },
                      max: 100000,
                      min: 2000,
                      divisions: 500,
                      label: '${BlocSlideFilter.get(contextOrigin).price} DZ',
                      value: BlocSlideFilter.get(contextOrigin).price,

              ),
            ],
            actions: [
              TextButton(
                child: Text('Approve' , style: Theme.of(context).textTheme.button?.copyWith(
                  color: kPrimaryColor
                ),),
                onPressed: ()   {

                      BlocFatchData.get(context).filterBay(
                          BlocSlideFilter.get(context).ram,
                          BlocSlideFilter.get(context).storage,
                          BlocSlideFilter.get(context).camera,
                          BlocSlideFilter.get(context).price
                      );

                      Navigator.pop(context) ;

                },
              ),
            ],
          );
        }
      );
    },
  );
}

/// BlocFiltersAllProduits
