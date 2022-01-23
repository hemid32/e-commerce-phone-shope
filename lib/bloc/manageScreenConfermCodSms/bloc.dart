import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/bloc/manageScreenConfermCodSms/event.dart';
//import 'package:phoneshop/bloc/verifeid_phon/event.dart';
import 'package:phoneshop/screens/mobilVerification/widgets/conferme.dart';
import 'package:phoneshop/screens/mobilVerification/widgets/sand_sms.dart';

class BlocScreenManageVerificationCodSms
    extends Bloc<EventManageConfermCodSms, Widget> {
  BlocScreenManageVerificationCodSms() : super(SandSms());

  @override
  Stream<Widget> mapEventToState(EventManageConfermCodSms event) async* {
    // TODO: implement mapEventToState
    //throw UnimplementedError();
    if (event is  EventManageConfermCodSmsSandCod) {
      yield SandSms(user: event.user, isUpdate: event.isUpdate,);
    } else if (event is EventManageConfermCodSmsConfermed) {
      yield ConfermSms(user: event.user, isUpdate: event.isUpdate,);
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
    if(event is  EventSandCodeFromFirBasCodeResandCod){
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
            add(EventSandCodeFromFirBasField(messageErrur: e.message));
          },
          codeSent: (String verificationId, int resendToken) async {
            //print('cod is send resendToken ========> =====> ====> $resendToken');
            add(EventSandCodeFromFirBasCodeSand(
                verificationId: verificationId ,
                token: resendToken ,
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

    if (event is  EventSandCodeFromFirBas) {
      try{
      await FirebaseAuth.instance.verifyPhoneNumber(
        //forceResendingToken: 1,
        phoneNumber: event.nombrePhone,
        verificationCompleted: (PhoneAuthCredential credential) async {
          print('verificationCompleted credential ====> ===> $credential');
        },
        verificationFailed: (FirebaseAuthException e) async {
          print('verificationId feild ===${e.message}');

          add(EventSandCodeFromFirBasField(messageErrur: e.message));
        },
        codeSent: (String verificationId, int resendToken) async {
          //print('cod is send resendToken ========> =====> ====> $resendToken');

          add(EventSandCodeFromFirBasCodeSand(
            verificationId: verificationId ,
            token: resendToken ,
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
      yield {'state': 'Wait', 'message': ' '  };
    } else if (event is  EventSandCodeFromFirBasField) {
      yield {'state': 'Errur', 'message': event.messageErrur};
    } else if (event is  EventSandCodeFromFirBasCodeSand) {
      yield {'state': 'Sand', 'message': ' ' , 'verificationId' : event.verificationId , 'token' : event.token , 'phone' : event.nomprePhone};
    }else if(event is  EventSandCodeFromFirBasCodeConfermCodSmS){
      FirebaseAuth auth = FirebaseAuth.instance;
      PhoneAuthCredential phonAuth =  PhoneAuthProvider.credential(
          verificationId: event.verificationId, smsCode: event.codSms );

      yield {'PhoneAuthCredential' : phonAuth , 'state' : 'confirmed' , 'message' : ' ' ,  'verificationId': ' '  } ;


    }
  }
}


/*
              FirebaseAuth auth = FirebaseAuth.instance;


              PhoneAuthCredential phonAuth =  PhoneAuthProvider.credential(
                  verificationId: verificationId, smsCode: smsCode );

 */