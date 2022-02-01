import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/bloc/allProduitFilter/bloc.dart';
import 'package:phoneshop/bloc/allProduitFilter/event.dart';
import 'package:phoneshop/bloc/filterAllProduit/bloc.dart';
import 'package:phoneshop/bloc/filterAllProduit/event.dart';
import 'package:phoneshop/bloc/filterAllProduit/slideFilterManage/bloc.dart';
import 'package:phoneshop/bloc/filterAllProduit/slideFilterManage/events.dart';
import 'package:phoneshop/bloc/laodingCirceler/bloc.dart';
import 'package:phoneshop/bloc/laodingCirceler/events.dart';
import 'package:phoneshop/constant.dart';
//import 'package:phoneshop/model/produit/produit_colors.dart';
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
  late double _ram ;
  late double _strorage ;
  late double _price ;
  late double _camera ;
  return showDialog<void>(
    context: contextOrigin,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return MultiBlocProvider(
        providers: [
          BlocProvider<BlocSliderRam>(
            create: (BuildContext context) => BlocSliderRam(),
          ),
          BlocProvider<BlocSliderStorage>(
            create: (BuildContext context) => BlocSliderStorage(),
          ),
          BlocProvider<BlocSliderPrice>(
            create: (BuildContext context) => BlocSliderPrice(),
          ),
          BlocProvider<BlocSliderCamera>(
            create: (BuildContext context) => BlocSliderCamera(),
          ),
        ],
        child: DialogContainer(
          title: '',
          widgets: [
            BlocBuilder<BlocSliderRam, double>(
                builder: (context, value) {
              return SlideContainer(
                title: 'Ram',
                onChange: (double value) {
                  BlocProvider.of<BlocSliderRam>(context)
                      .add(EventSliderFilterRam(value));
                  _ram = value ;
                },
                max: 16,
                min: 2,
                divisions: 2,
                label: '$value GB',
                value: value ,
              );
            }),
            BlocBuilder<BlocSliderStorage , double>(
              builder: (context, value) {
                return SlideContainer(
                  title: 'Storage',
                  onChange: (double value) {
                    BlocProvider.of<BlocSliderStorage>(context)
                        .add(EventSliderFilterStorage(value));
                    _strorage = value ;
                  },
                  max: 180,
                  min: 5,
                  divisions: 5,
                  label: '$value GB',
                  value: value,
                );
              }
            ),
            BlocBuilder<BlocSliderCamera , double>(
                builder: (context, value) {
                  return SlideContainer(
                    title: 'Camera',
                    onChange: (double value) {
                      BlocProvider.of<BlocSliderCamera>(context)
                          .add(EventSliderFilterCamera(value));
                      _camera = value ;
                    },
                    max: 108,
                    min: 8,
                    divisions: 4,
                    label: '$value MP',
                    value: value,
                  );
                }
            ),
            BlocBuilder<BlocSliderPrice , double>(
                builder: (context, value) {
                  return SlideContainer(
                    title: 'Price',
                    onChange: (double value) {
                      BlocProvider.of<BlocSliderPrice>(context)
                          .add(EventSliderFilterPrice(value));
                      _price = value ;
                    },
                    max: 100000,
                    min: 2000,
                    divisions: 500,
                    label: '$value DZ',
                    value: value,
                  );
                }
            ),
          ],
          actions: [
            TextButton(
              child: Text('Approve'),
              onPressed: () async  {
                //print('produitsColors.produits.length ===${} }') ;
                BlocProvider.of<BlocLoading>(contextOrigin).add(EventLoadingStart()) ;

                BlocProvider.of<BlocFiltersAllProduits>(contextOrigin).add(EventsFilterAllProduitsevnts(
                  ram: _ram ,
                  storage: _strorage ,
                  camera: _camera,
                  price: _price ,
                  produitsColors:  BlocProvider.of<BlocAllProduitFilter>(contextOrigin).state  ,
                )) ;
                await Future.delayed(Duration(seconds: 1)) ;
                //print('lenth produit after filter === ${BlocProvider.of<BlocFiltersAllProduits>(contextOrigin).state.produits.length}') ;

                BlocProvider.of<BlocAllProduitFilter>(contextOrigin).add(EventAllProduitAfterFillter(
                  dataFilter: BlocProvider.of<BlocFiltersAllProduits>(contextOrigin).state
                ));





                Navigator.of(context).pop();
                BlocProvider.of<BlocLoading>(contextOrigin).add(EventLoadingStop()) ;



              },
            ),
          ],
        ),
      );
    },
  );
}

/// BlocFiltersAllProduits
