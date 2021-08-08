import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import 'package:phoneshop/bloc/manageScreenConfermCodSms/bloc.dart';
import 'package:phoneshop/bloc/manageScreenConfermCodSms/event.dart';
import 'package:phoneshop/bloc/register/bloc.dart';
import 'package:phoneshop/bloc/register/event.dart';
import 'package:phoneshop/constant.dart';
import 'package:phoneshop/model/user/user.dart';
import 'package:phoneshop/screens/homescreen/homescreen.dart';
import 'package:phoneshop/screens/homescreen/widgeets/home.dart';
import 'package:phoneshop/screens/loginorRegester/componants/header_verification.dart';
import 'package:phoneshop/screens/mobilVerification/componants/button.dart';

class ConfermSms extends StatelessWidget {
   ConfermSms({
    Key key, this.user,
  }) : super(key: key);

  final UserLocalModel user ;


  String codSms ;

  String verificationId ;


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size ;
    verificationId = BlocProvider.of<BlocDataConfermUserCreatedCodSms>(context).state['verificationId'] ;
    return SizedBox(
      width: size.width,
      height: size.height,
      child: Column(
        children: [
          Header(
            title: 'Mobil Verification',
            description: 'Please enter cod SmS',
          ) ,
          SizedBox(height: 40,) ,

          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
                color: Theme.of(context).accentColor ,
                border: Border.all(color: Theme.of(context).iconTheme.color)
            ),
            child: TextFormField(
              //initialValue: '+213665489218',
              //textDirection: TextDirection.rtl,
              onChanged: (text){
                codSms = text ;
              },

              style: Theme.of(context).textTheme.button.copyWith(
                  fontSize: 20 ,
                  fontWeight: FontWeight.bold
              ),
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  border: InputBorder.none ,
                  hintText: 'sms her' ,
                  hintStyle: Theme.of(context).textTheme.button.copyWith(
                      fontSize: 15
                  )
              ),

            ),
          ),
          Spacer() ,
          BlocListener<BlocRegisterUser , dynamic>(
            listener: (context , stateRegister){
                // do stuff here based on BlocA's state
                //print('states === $state')  ;
                if(stateRegister == true){
                  //print('hemidibenameur') ;



                  //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Profile()));
                  //Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => Profile()));
                  ScaffoldMessenger.of(Scaffold.of(context).context).showSnackBar(SnackBar(content: Text('Account created successfully', style: Theme.of(context).textTheme.button.copyWith(fontSize: 15 , color: Colors.white),) , backgroundColor: kPrimaryColor));
                  Navigator.pushAndRemoveUntil(
                      context,
                      PageTransition(type: PageTransitionType.rightToLeft ,  child: HomeScreen()),
                          (Route<dynamic> route) => false
                  );


                }else{
                  //BlocProvider.of<BlocLoading>(context).add(EventLoadingStop()) ;
                  ScaffoldMessenger.of(Scaffold.of(context).context).showSnackBar(SnackBar(content: Text('$stateRegister', style: Theme.of(context).textTheme.button.copyWith(fontSize: 15 , color: Colors.white),) , backgroundColor: Colors.red));


                }

            },
            child: BlocListener<BlocDataConfermUserCreatedCodSms , dynamic>(
              listener: (context , stateListen){
                //print('stetListen ===== *** === ${stateListen['state']}') ;
                if(stateListen['state'] == 'confirmed'){
                  BlocProvider.of<BlocRegisterUser>(context).add(EventsRegisters(
                    user: user ,
                    allFormIsCompletedTrue: true ,
                    phonAuth:  stateListen['PhoneAuthCredential'],
                  )) ;
                }
              },
              child: ButtonBottom(
                onTap: (){
                  BlocProvider.of<BlocDataConfermUserCreatedCodSms>(context).add(EventSandCodeFromFirBasCodeConfermCodSmS(
                    codSms: codSms ,
                    verificationId: verificationId ,
                  )) ;

                },
                widget: Text('Conferme', style: Theme.of(context).textTheme.button.copyWith(
                    fontSize: 18 ,
                    color: Colors.white
                ),),
              ),
            ),
          ),

          SizedBox(height: 20,)
        ],
      ),
    );
  }
}


