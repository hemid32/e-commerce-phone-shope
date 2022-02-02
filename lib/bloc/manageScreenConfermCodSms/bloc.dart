import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/bloc/manageScreenConfermCodSms/event.dart';
import 'package:phoneshop/screens/mobilVerification/widgets/conferme.dart';
import 'package:phoneshop/screens/mobilVerification/widgets/sand_sms.dart';

class BlocScreenManageVerificationCodSms
    extends Bloc<EventManageConfermCodSms, Widget> {
  BlocScreenManageVerificationCodSms() : super(SandSms()){
    on((event, emit) {
      if (event is  EventManageConfermCodSmsSandCod) {
        emit( SandSms(user: event.user, isUpdate: event.isUpdate,));
      } else if (event is EventManageConfermCodSmsConfermed) {
        emit( ConfermSms(user: event.user, isUpdate: event.isUpdate,));
      }
    });
  }

}

class BlocDataConfermUserCreatedCodSms
    extends Bloc<EventManageConfermCodSms, dynamic> {
  BlocDataConfermUserCreatedCodSms() : super(null){
    on<EventSandCodeFromFirBasCodeResandCod>(_eventSandCodeFromFirBasCodeResandCod)  ;
    on<EventSandCodeFromFirBas>(_eventSandCodeFromFirBas) ;
    on<EventSandCodeFromFirBasField>(_eventSandCodeFromFirBasField) ;
    on<EventSandCodeFromFirBasCodeSand>(_eventSandCodeFromFirBasCodeSand) ;
    on<EventSandCodeFromFirBasCodeConfermCodSmS>(_eventSandCodeFromFirBasCodeConfermCodSmS) ;

  }

  void _eventSandCodeFromFirBasCodeResandCod(EventSandCodeFromFirBasCodeResandCod event , Emitter emit ) async {
    int token = event.token ;

    try{
      await FirebaseAuth.instance.verifyPhoneNumber(
        forceResendingToken: token,
        timeout: Duration(seconds: 60),
        phoneNumber: event.nombrePhone,
        verificationCompleted: (PhoneAuthCredential credential) async {
          print('verificationCompleted credential ====> ===> $credential');
        },
        verificationFailed: (FirebaseAuthException e) async {
          //print('verificationId feild ===${e.message}');
          add(EventSandCodeFromFirBasField(messageErrur: e.message! ));
        },
        codeSent: (String verificationId, int? resendToken) async {
          //print('cod is send resendToken ========> =====> ====> $resendToken');
          add(EventSandCodeFromFirBasCodeSand(
            verificationId: verificationId ,
            token: resendToken! ,
            nomprePhone:  event.nombrePhone ,
          ));
        },
        codeAutoRetrievalTimeout: (String verificationId) async {
          print(
              'codeAutoRetrievalTimeout verificationId ====> ===> $verificationId ');
        },
      );
    }catch(e){
      add(EventSandCodeFromFirBasField(messageErrur: e.toString())) ;
    }
  }
  void _eventSandCodeFromFirBas(EventSandCodeFromFirBas event , Emitter emit )async{
    try{
      await FirebaseAuth.instance.verifyPhoneNumber(
        //forceResendingToken: 1,
        phoneNumber: event.nombrePhone,
        verificationCompleted: (PhoneAuthCredential credential) async {
          print('verificationCompleted credential ====> ===> $credential');
        },
        verificationFailed: (FirebaseAuthException e) async {
          print('verificationId feild ===${e.message}');

          add(EventSandCodeFromFirBasField(messageErrur: e.message!));
        },
        codeSent: (String verificationId, int? resendToken) async {
          //print('cod is send resendToken ========> =====> ====> $resendToken');

          add(EventSandCodeFromFirBasCodeSand(
              verificationId: verificationId ,
              token: resendToken! ,
              nomprePhone:  event.nombrePhone
          ));
        },
        codeAutoRetrievalTimeout: (String verificationId) async {
          print(
              'codeAutoRetrievalTimeout verificationId ====> ===> $verificationId ');
        },
      );
    }catch(e){
      add(EventSandCodeFromFirBasField(messageErrur: e.toString())) ;
    }
    emit( {'state': 'Wait', 'message': ' '  });
  }
  void _eventSandCodeFromFirBasField(EventSandCodeFromFirBasField event , Emitter emit){
    emit({'state': 'Errur', 'message': event.messageErrur}) ;
  }
  void _eventSandCodeFromFirBasCodeSand(EventSandCodeFromFirBasCodeSand event , Emitter emit){
    emit({'state': 'Sand', 'message': ' ' , 'verificationId' : event.verificationId , 'token' : event.token , 'phone' : event.nomprePhone}) ;
  }
  void _eventSandCodeFromFirBasCodeConfermCodSmS(EventSandCodeFromFirBasCodeConfermCodSmS event , Emitter emit){
    FirebaseAuth auth = FirebaseAuth.instance;
    PhoneAuthCredential phonAuth =  PhoneAuthProvider.credential(
        verificationId: event.verificationId, smsCode: event.codSms );
    emit({'PhoneAuthCredential' : phonAuth , 'state' : 'confirmed' , 'message' : ' ' ,  'verificationId': ' '  }) ;
  }

}


/*
              FirebaseAuth auth = FirebaseAuth.instance;


              PhoneAuthCredential phonAuth =  PhoneAuthProvider.credential(
                  verificationId: verificationId, smsCode: smsCode );

 */