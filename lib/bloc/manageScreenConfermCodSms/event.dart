import 'package:flutter/cupertino.dart';
import 'package:phoneshop/model/user/user.dart';

class EventManageConfermCodSms {}




class EventManageConfermCodSmsSandCod extends EventManageConfermCodSms {

  final UserLocalModel user ;
  final bool isUpdate ;

  EventManageConfermCodSmsSandCod({required this.user , this.isUpdate = false });


}




class EventManageConfermCodSmsConfermed extends EventManageConfermCodSms {

  final UserLocalModel user ;
  final bool isUpdate ;

  EventManageConfermCodSmsConfermed({required this.user , this.isUpdate = false });


}

class EventSandCodeFromFirBas extends EventManageConfermCodSms{
   String nombrePhone  ;
  EventSandCodeFromFirBas({required this.nombrePhone});
}

class EventSandCodeFromFirBasField extends EventManageConfermCodSms{
 final String messageErrur ;

  EventSandCodeFromFirBasField({required this.messageErrur});
}


class EventSandCodeFromFirBasCodeSand extends EventManageConfermCodSms{
   final  String verificationId ;
   final int token ;
   final String nomprePhone ;

  EventSandCodeFromFirBasCodeSand({required this.verificationId ,required this.token ,required this.nomprePhone});
}


class EventSandCodeFromFirBasCodeConfermCodSmS extends EventManageConfermCodSms{
  final  String codSms ;
  final String  verificationId ;
  EventSandCodeFromFirBasCodeConfermCodSmS({required this.codSms ,required  this.verificationId});
}

class EventSandCodeFromFirBasCodeResandCod extends EventManageConfermCodSms{
  final  int token ;
  final String nombrePhone  ;

  EventSandCodeFromFirBasCodeResandCod({required this.token,required  this.nombrePhone});
}