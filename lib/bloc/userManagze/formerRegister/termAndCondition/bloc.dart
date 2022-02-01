

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/bloc/userManagze/formerRegister/termAndCondition/event.dart';

class BlocTermaAndConditionChek extends Bloc<EventTermAndCondition , bool >{
  BlocTermaAndConditionChek() : super(false);

  @override
  Stream<bool> mapEventToState(EventTermAndCondition event) async* {
    // TODO: implement mapEventToState
    if(event is EventChekTermsItem  ) {
      EventChekTermsItem _result = event;
      yield _result.value;
    }
  }
}