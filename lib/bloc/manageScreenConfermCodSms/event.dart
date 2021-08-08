import 'package:flutter/cupertino.dart';
import 'package:phoneshop/model/user/user.dart';

class EventManageConfermCodSms {}




class EventManageConfermCodSmsSandCod extends EventManageConfermCodSms {

  final UserLocalModel user ;

  EventManageConfermCodSmsSandCod({@required this.user});


}

class EventManageConfermCodSmsConfermed extends EventManageConfermCodSms {

  final UserLocalModel user ;

  EventManageConfermCodSmsConfermed({@required this.user});


}

class EventSandCodeFromFirBas extends EventManageConfermCodSms{
  final String nombrePhone  ;
  EventSandCodeFromFirBas({@required this.nombrePhone});

}

class EventSandCodeFromFirBasField extends EventManageConfermCodSms{
 final String messageErrur ;

  EventSandCodeFromFirBasField({this.messageErrur});
}


class EventSandCodeFromFirBasCodeSand extends EventManageConfermCodSms{
   final  String verificationId ;

  EventSandCodeFromFirBasCodeSand({this.verificationId});
}


class EventSandCodeFromFirBasCodeConfermCodSmS extends EventManageConfermCodSms{
  final  String codSms ;
  final String  verificationId ;
  EventSandCodeFromFirBasCodeConfermCodSmS({this.codSms , this.verificationId});
}