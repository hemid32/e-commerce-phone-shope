import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:phoneshop/constant.dart';
import 'package:phoneshop/model/hiveModel/hive_cart.dart';
import 'package:phoneshop/screens/homescreen/homescreen.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:phoneshop/screens/loginorRegester/login_or_regester.dart';
import 'bloc/allProduitFilter/event.dart';
import 'bloc/manageScreen/home/bloc.dart';
import 'model/cart/services.dart';
import 'model/favorite/model.dart';
import 'model/hiveModel/favorite.dart';


void main() async   {
  Bloc.observer = SimpleBlocObserver();
  await Hive.initFlutter();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();


  Hive
    ..registerAdapter(FavoriteHiveAdapter())
    ..registerAdapter(CartHiveAdapter()) ;

  //print(itemsCart()[0].produit) ;
  var box = await Hive.openBox('ModelCart');
  var box2 = await Hive.openBox('FavoriteHive');

  //print('resutl from getItemFavorite === ===> ${box2.values.toList()}');
  var a = ServisesFavoriteHive() ;
  //print(box2.values.toList().isEmpty);
  print( await   a.getItemFavorite()) ;
  //box2.deleteFromDisk() ;
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
      home:  HomeScreen(),
    );
  }
}

