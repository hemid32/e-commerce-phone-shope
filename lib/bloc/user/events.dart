import 'package:phoneshop/model/getModelFirebase/getUser/modelUserGet.dart';
import 'package:phoneshop/model/user/user.dart';

class EventUser {}


class EventUserGet extends EventUser {
  late UserLocalModel user  ;
  GetUserFireBase _fireUser = GetUserFireBase() ;
  getUserFromFireBase() async {
    user = await _fireUser.getUser() ;
    print('user get fire ==== ${user.toMap()}') ;
    return user ;
  }


}