

/*
import 'package:firebase_auth/firebase_auth.dart';

class VerifeidNombre {
  final String   codSms ;
  final String  nombrePhone  ;

  VerifeidNombre({this.codSms , this.nombrePhone});

  varifaidNombres() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+213665489218',
      verificationCompleted: (PhoneAuthCredential credential) async  {print('verificationCompleted credential ====> ===> $credential') ; },
      verificationFailed: (FirebaseAuthException e) async  {print('verificationId feild ===$e') ; },
      codeSent: (String verificationId, int resendToken) async  {print('cod is send verificationId ========> =====> ====> $verificationId') ; },
      codeAutoRetrievalTimeout: (String verificationId) async  { print('codeAutoRetrievalTimeout verificationId ====> ===> $verificationId ') ; },
    );

  }







}

 */