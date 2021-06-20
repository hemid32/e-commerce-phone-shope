

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/bloc/laodingCirceler/bloc.dart';
import 'package:phoneshop/bloc/laodingCirceler/events.dart';
import 'package:phoneshop/bloc/register/bloc.dart';
import 'package:phoneshop/bloc/register/event.dart';
import 'package:phoneshop/model/user/user.dart';
import 'package:toast/toast.dart';

Future<void> showMyDialogSandCod(contextt , nambre  , user) async {
  return showDialog<void>(
    context: contextt,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Send verification code'),
        content: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              //Text('This is a demo alert dialog.'),
              Text('We will send you a verification code to the number : $nambre'),



            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text('Cencel'),
            onPressed: () async   {
              //print('Cencel');
              Navigator.of(context).pop();


            },
          ),
          TextButton(
            child: Text('Sand'),
            onPressed: () async   {
              Navigator.of(context).pop();
              BlocProvider.of<BlocLoading>(contextt).add(EventLoadingStart()) ;

              await FirebaseAuth.instance.verifyPhoneNumber(
                phoneNumber: nambre,
                verificationCompleted: (PhoneAuthCredential credential) async  {print('verificationCompleted credential ====> ===> $credential') ; },
                verificationFailed: (FirebaseAuthException e) async  {
                  BlocProvider.of<BlocLoading>(contextt).add(EventLoadingStop()) ;
                  print('verificationId feild ===$e') ;
                  Toast.show( e.message,
                    context,
                    duration: 3,
                    gravity:  Toast.BOTTOM ,
                    border: Border.all(color: Colors.white) ,
                  );
                },
                codeSent: (String verificationId, int resendToken) async  {
                  print('cod is send resendToken ========> =====> ====> $resendToken') ;
                  //BlocProvider.of<BlocLoading>(contextt).add(EventLoadingStop()) ;
                  //BlocProvider.of<BlocLoading>(contextt).state == false ? showMyDialog(contextt, nambre) : print('null') ;
                  BlocProvider.of<BlocLoading>(contextt).add(EventLoadingStop()) ;
                  //_showMyDialog(contextt, nambre) ;
                  await Future.delayed(const Duration(seconds: 1), () => "1");
                  showMyDialog(contextt,verificationId ,  nambre , user) ;



                },
                codeAutoRetrievalTimeout: (String verificationId) async  {
                  print('codeAutoRetrievalTimeout verificationId ====> ===> $verificationId ') ;
                  //BlocProvider.of<BlocLoading>(contextt).add(EventLoadingStop()) ;
                  //_showMyDialog(contextt, nambre) ;
                  //await Future.delayed(const Duration(seconds: 1), () => "1");
                  //showMyDialog(contextt, nambre) ;
                },
              ) ;



            },
          ),
        ],
      );
    },
  );
}

Future<void> showMyDialog(contextt ,verificationId ,  nombre , user ) async {
  String  smsCode ;
  return showDialog<void>(
    context: contextt,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Verify the number'),
        content: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              //Text('This is a demo alert dialog.'),
              Text('*Type the code here'),

              TextFormField(
                onChanged: (text){
                  smsCode = text   ;
                },

                decoration: InputDecoration(
                    labelText: 'Type the code here' ,
                    labelStyle: Theme.of(context).textTheme.button.copyWith(
                        color: Colors.black.withOpacity(0.4)
                    )
                ),
              )

            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text('Cencel'),
            onPressed: () {
              print('Confirmed');
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text('Confirmed'),
            onPressed: ()  async   {
              //Navigator.of(context).pop();
              BlocProvider.of<BlocLoading>(contextt).add(EventLoadingStart()) ;
              FirebaseAuth auth = FirebaseAuth.instance;


              PhoneAuthCredential phonAuth =  PhoneAuthProvider.credential(
                  verificationId: verificationId, smsCode: smsCode );
              //print('phonAuth.token.isEven == ${phonAuth.token.isEven}');
              //print('phonAuth.token.isNaN == ${phonAuth.token.isNaN}');
              //print('phonAuth.providerId === ${phonAuth.providerId}');
              //print('phonAuth ===== ${phonAuth.token}');
              //UserLocalModel usr = UserLocalModel.fromJson(json) ;
              //Map<String , dynamic> user = UserLocalModel
              //var u = auth.signInWithCustomToken(phonAuth.providerId , ) ;

              try {
                await auth.signInWithCredential(phonAuth);
                BlocProvider.of<BlocRegisterUser>(contextt).add(EventsRegisters(
                  user: user ,
                  allFormIsCompletedTrue: true ,
                )) ;
              }catch(e){
                print(e.message) ;
                BlocProvider.of<BlocLoading>(contextt).add(EventLoadingStop()) ;
                Future.delayed(Duration(seconds: 1)) ;
                Toast.show( e.message,
                  context,
                  duration: 5,
                  gravity:  Toast.BOTTOM ,
                  border: Border.all(color: Colors.white) ,
                );
              }
              //print({'t ===== ${t.user.phoneNumber}');




            },
          ),
        ],
      );
    },
  );
}


