import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/bloc/languge/bloc.dart';
import 'package:phoneshop/bloc/languge/state.dart';
import 'package:phoneshop/bloc/manageScreen/home/bloc.dart';
import 'package:phoneshop/bloc/notification/bloc.dart';
import 'package:phoneshop/bloc/slideFilter/bloc.dart';
import 'package:phoneshop/bloc/theme/bloc.dart';
import 'package:phoneshop/bloc/theme/event.dart';
import 'package:phoneshop/model/hiveModel/hive_cart.dart';
import 'package:phoneshop/screens/homescreen/homescreen.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:phoneshop/services/lang/appLocat.dart';
import 'bloc/fatchAllData/bloc.dart';
import 'bloc/favorite/bloc/bloc.dart';
import 'bloc/userManagze/userVirifaid/bloc.dart';
import 'model/getModelFirebase/getMayOrder/my_order.dart';
import 'model/hiveModel/addres.dart';
import 'model/hiveModel/favorite.dart';
import 'oitil/theme/theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  //Bloc.observer = SimpleBlocObserver();
  await Hive.initFlutter();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  //await FirebaseAuth.instance.signOut() ;
  //await testCreatModelFromFireBase() ;
  //var r = GetProduitTotalFromFirebas()  ;
  //print(await r.getLiistProduitColorsFromFireBase() ) ;

  Hive
    ..registerAdapter(FavoriteHiveNewModelAdapter())
    ..registerAdapter(CartHiveAdapter())
    ..registerAdapter(AssressHiveAdapter());

  //var t = GetProduitTotalFromFirebas() ;
  //int u = await t.nombreProduitFromFireBase('352bbfb0-f515-11eb-aa94-a7d781b6bab6', 2) ;
  //print(u) ;
  //var email = "hemidi@gmail.h";

  //print(EmailValidator.validate(email));

  //print(itemsCart()[0].produit) ;
  //var box5 = await  Hive.openBox('FavoriteHive') ;
  //await box5.deleteFromDisk() ;
  //print() ;
  //var a = GetMyOrder() ;
  //ListDomands l = await a.getListDomandsSendRequest() ;
  //print('**********/*/*/*/*/**======${l.domands.length}' )  ;
  //var l = CancelDomandSanded(uidDomand: '9fe787c0-de46-11eb-aeaa-b52aeaa89fb0') ;
  //print( await l.getIdDecDomand()) ;
  /*
  var a = Message(
    type : 'admin' , text : 'hello hemidi' , uidUser :  FirebaseAuth.instance.currentUser.uid
  ) ;
  var b  = ServesicesImage(
    mesgae: a
  ) ;
  await b.saveToFireBase() ;

    */

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
var o = GetMyOrder() ;

  DomandProduit r = await o.getItemDOmand('11e55480-e011-11eb-9cd8-e7a3ea99e2dc') ;
  print(r.date) ;
   */

  //ThemeMode.dark  ;

  GetMyOrder getOrder = new GetMyOrder();
  getOrder.getListDomandsSendRequest();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(builder: (context, snapshot) {
      return MultiBlocProvider(
        //providers[] : (context) => BlocTheme()..add(EventsThemeChangedInitilis()) ,
        providers: [
          BlocProvider<BlocUserVerifaid>(
            create: (BuildContext context) => BlocUserVerifaid(),
          ),
          BlocProvider(
              create: (context) =>
                  BlocTheme()..add(EventsThemeChangedInitilis())),
          BlocProvider(create: (context) => BlocNotification()),
          BlocProvider(create: (context) => BlocFavorite()..intiStateData()),
          BlocProvider(create: (context) => BlocLanguage()..intialValue()),
          BlocProvider(
              create: (context) =>
                  BlocFatchData()..getDataProduitCoolorFromFireBase()),
          BlocProvider(
            create: (_) => BlocSlideFilter(),
          ),
        ],
        child: BlocBuilder<BlocTheme, List>(builder: (context, state) {
          return BlocConsumer<BlocLanguage, StateBlocLanguage>(
              listener: (context, state) {},
              builder: (context, snapshot) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: 'Flutter Demo',
                  theme: themeLigth,
                  darkTheme: themeDark,
                  themeMode: state[0],
                  home: BlocProvider.value(
                      value: BlocProvider.of<BlocTheme>(context),
                      child: HomeScreen()),

                  locale: BlocLanguage.get(context).locale, // _local
                  localizationsDelegates: [
                    AppLocale.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    //DefaultCupertinoLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  supportedLocales: [
                    Locale("en", ""),
                    Locale("ar", ""),
                    Locale("fr", ""),
                  ],
                  localeResolutionCallback: (locale, supportedLocales) {
                    //print('lang 17 == ${widget.lang}');

                    if ('lang' == 'from story')
                      return Locale('ar', ""); // from story
                    for (var supportedLocale in supportedLocales) {
                      if (supportedLocale.languageCode ==
                              locale!.languageCode &&
                          supportedLocale.countryCode == locale.countryCode) {
                        //suportat lang

                        return supportedLocale;
                      }
                    }

                    return supportedLocales.first;
                  },
                );
              });
        }),
      );
    });
  }
}
