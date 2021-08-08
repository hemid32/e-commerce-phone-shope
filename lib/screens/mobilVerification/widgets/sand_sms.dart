
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/bloc/manageScreenConfermCodSms/bloc.dart';
import 'package:phoneshop/bloc/manageScreenConfermCodSms/event.dart';
import 'package:phoneshop/constant.dart';
import 'package:phoneshop/model/user/user.dart';
import 'package:phoneshop/screens/loginorRegester/componants/header_verification.dart';
import 'package:phoneshop/screens/mobilVerification/componants/button.dart';
import 'package:phoneshop/screens/mobilVerification/componants/button_sand_Sms.dart';

class SandSms extends StatelessWidget {
   SandSms({
    Key key, this.user,
  }) : super(key: key);

  final UserLocalModel user ;
   UserLocalModel userNew ;

   String nomprePhone ;
  @override
  Widget build(BuildContext context) {
    nomprePhone = user.nombrePhon ;
    Size size = MediaQuery.of(context).size ;

    return SizedBox(
      width: size.width,
      height: size.height,
      child: Container(
        child: Column(
          children: [
            Header(
              title: 'Mobil Verification',
              description: 'Please enter your phone number to create an account',
            ) ,
            SizedBox(height: 50,) ,
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                  color: Theme.of(context).accentColor ,
                  border: Border.all(color: Theme.of(context).iconTheme.color)
              ),
              child: TextFormField(
                initialValue: nomprePhone,
                onChanged: (text){
                  nomprePhone = text ;
                },
                //textDirection: TextDirection.rtl,
                style: Theme.of(context).textTheme.button.copyWith(
                    fontSize: 20 ,
                    fontWeight: FontWeight.bold
                ),
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    border: InputBorder.none
                ),

              ),
            ),
            SizedBox(height: 15,) ,

            BlocListener<BlocDataConfermUserCreatedCodSms , dynamic>(
              listener: (context , stateListen){
                if(stateListen != null){
                  if(stateListen['state'] == 'Errur'){
                    //print('erurr******************************************') ;
                    ScaffoldMessenger.of(Scaffold.of(context).context).showSnackBar(SnackBar(content: Text('${stateListen['message']}', style: Theme.of(context).textTheme.button.copyWith(fontSize: 15 , color: Colors.white),) , backgroundColor: Colors.red));
                  }else if(stateListen['state'] == 'Sand'){
                    userNew = UserLocalModel(
                      name: user.name ,
                      password:  user.password ,
                      email: user.email ,
                      nombrePhon: nomprePhone ,
                      image: user.image ,
                    ) ;
                    ScaffoldMessenger.of(Scaffold.of(context).context).showSnackBar(SnackBar(content: Text('Code has been sent', style: Theme.of(context).textTheme.button.copyWith(fontSize: 15 , color: Colors.white),) , backgroundColor: kPrimaryColor));
                    BlocProvider.of<BlocScreenManageVerificationCodSms>(context).add(EventManageConfermCodSmsConfermed(user: userNew)) ;
                  }
                }
              },
              child: BlocBuilder<BlocDataConfermUserCreatedCodSms , dynamic>(
                builder: (context, state) {
                  return ButtonSandSms(
                    isSand: state == null ? false : state['state'] == 'Wait',
                    onTap: (){
                      BlocProvider.of<BlocDataConfermUserCreatedCodSms>(context).add(EventSandCodeFromFirBas(
                        nombrePhone: nomprePhone
                      )) ;

                    },
                  );
                }
              ),
            ),
            SizedBox(height: 20,) ,
            Spacer() ,
            /*
            ButtonBottom(
              onTap: (){

              },
              widget: Icon(Icons.arrow_forward , color: Colors.white,),
            ),

             */

            SizedBox(height: 30,)

          ],
        ),
      ),
    );
  }
}

