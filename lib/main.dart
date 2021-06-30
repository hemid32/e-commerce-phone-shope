import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:phoneshop/constant.dart';
import 'package:phoneshop/model/getModelFirebase/getUser/modelUserGet.dart';
import 'package:phoneshop/model/hiveModel/hive_cart.dart';
import 'package:phoneshop/model/produit/servises.dart';
import 'package:phoneshop/screens/homescreen/homescreen.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:phoneshop/screens/loginorRegester/login_or_regester.dart';
import 'bloc/allProduitFilter/event.dart';
import 'bloc/manageScreen/home/bloc.dart';
import 'model/cart/services.dart';
import 'model/favorite/model.dart';
import 'model/getModelFirebase/getMethodShopping/getMethod.dart';
import 'model/getModelFirebase/getTotalProduitColors.dart';
import 'model/getModelFirebase/theBestProduit/model.dart';
import 'model/hiveModel/addres.dart';
import 'model/hiveModel/favorite.dart';
import 'model/puy/shopping.dart';
import 'screens/profile/profile.dart';


void main() async   {
  Bloc.observer = SimpleBlocObserver();
  await Hive.initFlutter();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  //await FirebaseAuth.instance.signOut() ;
  //await testCreatModelFromFireBase() ;
  //var r = GetProduitTotalFromFirebas()  ;
  //print(await r.getLiistProduitColorsFromFireBase() ) ;


  Hive
    ..registerAdapter(FavoriteHiveAdapter())
    ..registerAdapter(CartHiveAdapter())
    ..registerAdapter(AssressHiveAdapter()) ;

  //print(itemsCart()[0].produit) ;
  //var box5 = await  Hive.openBox('FavoriteHive') ;
  //await box5.deleteFromDisk() ;
  //print() ;
  var a = GetMethodShopping() ;
  print(await a.getListMethodsFromFirebase() )  ;


  //var box = await Hive.openBox('ModelCart');
  //var box2 = await Hive.openBox('FavoriteHive');
  //await testCreatModelFromFireBase() ;
  //var y = await userDataFireBase.getUser() ;
  //print('y.name =============================== ${y.name}' ) ;

  //print('resutl from getItemFavorite === ===> ${box2.values.toList()}');
  //var a = GetTheBestProduits() ;

  //print(await a.getTheBestProduit()) ;
  //print(box2.values.toList().isEmpty);
  //print( await   a.getItemFavorite()) ;
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
      home:   HomeScreen(),
    );
  }
}

