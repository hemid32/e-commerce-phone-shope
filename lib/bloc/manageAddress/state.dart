

import 'package:flutter/cupertino.dart';

abstract class StateManageAddress {

}


class InitStateManageAdress extends StateManageAddress {

}


class StateManageAdressGetAllAddress extends StateManageAddress {}
class StateManageAdressDeletAddress extends StateManageAddress {}
class StateManageAdressEditeAddress extends StateManageAddress {}
class StateManageAdressHundleError extends StateManageAddress {
  final String error ;

  StateManageAdressHundleError({@required this.error});
}
