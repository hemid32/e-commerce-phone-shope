import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/bloc/manageScreenConfermCodSms/event.dart';
import 'package:phoneshop/bloc/verifeid_phon/event.dart';
import 'package:phoneshop/screens/mobilVerification/widgets/conferme.dart';
import 'package:phoneshop/screens/mobilVerification/widgets/sand_sms.dart';

class BlocScreenManageVerificationCodSms
    extends Bloc<EventManageConfermCodSms, Widget> {
  BlocScreenManageVerificationCodSms() : super(SandSms());

  @override
  Stream<Widget> mapEventToState(EventManageConfermCodSms event) async* {
    // TODO: implement mapEventToState
    //throw UnimplementedError();
    if (event.runtimeType == EventManageConfermCodSmsSandCod) {
      EventManageConfermCodSmsSandCod _smsSand = event;
      yield SandSms(user: _smsSand.user,);
    } else if (event.runtimeType == EventManageConfermCodSmsConfermed) {
      EventManageConfermCodSmsConfermed _user = event;

      yield ConfermSms(user: _user.user,);
    }
  }
}

class BlocDataConfermUserCreatedCodSms
    extends Bloc<EventManageConfermCodSms, dynamic> {
  BlocDataConfermUserCreatedCodSms() : super(null);

  @override
  Stream mapEventToState(EventManageConfermCodSms event) async* {
    // TODO: implement mapEventToState
    //throw UnimplementedError();
    if (event.runtimeType == EventSandCodeFromFirBas) {
      EventSandCodeFromFirBas _phoneNombre = event;
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: _phoneNombre.nombrePhone,
        verificationCompleted: (PhoneAuthCredential credential) async {
          print('verificationCompleted credential ====> ===> $credential');
        },
        verificationFailed: (FirebaseAuthException e) async {
          print('verificationId feild ===${e.message}');

          add(EventSandCodeFromFirBasField(messageErrur: e.message));
        },
        codeSent: (String verificationId, int resendToken) async {
          print('cod is send resendToken ========> =====> ====> $resendToken');

          add(EventSandCodeFromFirBasCodeSand(
            verificationId: verificationId
          ));
        },
        codeAutoRetrievalTimeout: (String verificationId) async {
          print(
              'codeAutoRetrievalTimeout verificationId ====> ===> $verificationId ');
        },
      );
      yield {'state': 'Wait', 'message': ' '};
    } else if (event.runtimeType == EventSandCodeFromFirBasField) {
      EventSandCodeFromFirBasField _errue = event;
      yield {'state': 'Errur', 'message': _errue.messageErrur};
    } else if (event.runtimeType == EventSandCodeFromFirBasCodeSand) {
      EventSandCodeFromFirBasCodeSand verificationId = event ;
      yield {'state': 'Sand', 'message': ' ' , 'verificationId' : verificationId.verificationId};
    }else if(event.runtimeType == EventSandCodeFromFirBasCodeConfermCodSmS){
      EventSandCodeFromFirBasCodeConfermCodSmS _cod = event ;
      String smsCod = _cod.codSms ;
      String verificationId = _cod.verificationId ;
      FirebaseAuth auth = FirebaseAuth.instance;
      PhoneAuthCredential phonAuth =  PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: smsCod );

      yield {'PhoneAuthCredential' : phonAuth , 'state' : 'confirmed' , 'message' : ' ' ,  'verificationId': ' '  } ;


    }
  }
}


/*
              FirebaseAuth auth = FirebaseAuth.instance;


              PhoneAuthCredential phonAuth =  PhoneAuthProvider.credential(
                  verificationId: verificationId, smsCode: smsCode );

 */