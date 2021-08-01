import 'package:phoneshop/model/getModelFirebase/getUser/modelUserGet.dart';
import 'package:phoneshop/model/user/user.dart';

class EventUser {}


class EventUserGet extends EventUser {
  UserLocalModel user = UserLocalModel() ;
  GetUserFireBase _fireUser = GetUserFireBase() ;

  getUserFromFireBase() async {
    user = await _fireUser.getUser() ;
    return user ;
  }


}