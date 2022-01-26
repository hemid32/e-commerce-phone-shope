import 'package:bloc/bloc.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/bloc/notification/state.dart';
import 'package:phoneshop/oitil/storeageManage/storageManage.dart';

class BlocNotification extends Cubit<StateBlocNotification>{
  BlocNotification() : super(StateBlocNotificationInitState()) ;



  static BlocNotification get(context) =>  BlocProvider.of(context) ;

  bool notificationIsActive = true ;


  initialisation()
  async  {
    var notification = await  StorageManager.readData('notification') ;
    if( notification == false ){
      notificationIsActive = false ;
    }
    emit(StateBlocNotificationInitState()) ;
  }

  subscribe()
  {
    StorageManager.saveData('notification', true) ;
    notificationIsActive = true ;
    FirebaseMessaging.instance.subscribeToTopic('app') ;
    emit(StateBlocNotificationSubscrip()) ;
  }

  unSubscribe()
  {
    StorageManager.saveData('notification', false) ;
    notificationIsActive = false ;
    FirebaseMessaging.instance.unsubscribeFromTopic('app') ;
    emit(StateBlocNotificationUnsubscrip()) ;

  }

}