import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:phoneshop/constant.dart';
import 'package:phoneshop/model/hiveModel/hive_cart.dart';
import 'package:phoneshop/screens/homescreen/homescreen.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'bloc/allProduitFilter/event.dart';
import 'bloc/manageScreen/home/bloc.dart';
import 'model/cart/services.dart';


void main() async   {
  //Bloc.observer = SimpleBlocObserver();
  await Hive.initFlutter();
  //final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();

  Hive
    ..registerAdapter(CartHiveAdapter()) ;

  //print(itemsCart()[0].produit) ;
  var box = await Hive.openBox('ModelCart');
  //print('values ==${box.values}') ;
  //box.deleteFromDisk() ;
  /*
  for(var i =0 ; i< box.values.length ; i++){
        print(' elemene from home === ${box.values.toList()[i]}') ;
        print(box.values.toList()[i].modelCart['produit']);
  }

   */







  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: TextTheme(
      headline5: TextStyle(
      fontWeight: FontWeight.bold
      ) ,
        button: TextStyle(
            fontWeight: FontWeight.bold
        )

    ),
    primaryColor: kPrimaryColor,
    scaffoldBackgroundColor: kBackgroundColor,
    primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

