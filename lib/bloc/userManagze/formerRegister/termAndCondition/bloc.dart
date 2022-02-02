

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/bloc/userManagze/formerRegister/termAndCondition/event.dart';

class BlocTermaAndConditionChek extends Bloc<EventTermAndCondition , bool >{
  BlocTermaAndConditionChek() : super(false){
    on((event, emit) {
      if(event is EventChekTermsItem  ) {
        emit( event.value) ;
      }

    });
  }

}