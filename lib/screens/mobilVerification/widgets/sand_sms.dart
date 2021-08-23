
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:phoneshop/bloc/manageScreenConfermCodSms/bloc.dart';
import 'package:phoneshop/bloc/manageScreenConfermCodSms/event.dart';
import 'package:phoneshop/constant.dart';
import 'package:phoneshop/model/user/user.dart';
import 'package:phoneshop/screens/loginorRegester/componants/costom_path.dart';
import 'package:phoneshop/screens/loginorRegester/componants/header_login.dart';
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
        child: Stack(
          children: [
            Positioned(
              top: 0,
              child: ClipPath(
                clipper: CostomPath1(),
                child: Container(
                  alignment: Alignment.center,
                  width: size.width,
                  height: size.height *0.5 ,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [kPrimaryColor ,  kPrimaryColor.withOpacity(0.2)] ,
                        begin: FractionalOffset.topRight ,
                        end:  FractionalOffset.bottomLeft


                    ),
                  ),

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 150,
                        height: 150,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white ,
                          shape: BoxShape.circle
                        ),
                        child: SvgPicture.asset('assets/icons/sms.svg', width: 80,),
                      ),
                      SizedBox(height: 10,) ,
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: Text('Send the verification code to the phone number' , style: Theme.of(context).textTheme.button.copyWith(
                          color: Colors.white  ,
                          fontSize: 15
                        ), textAlign: TextAlign.center,),
                      )
                    ],
                  ),



                ),

              ),
            ),
            Positioned(

                bottom: 0,
                child:  ClipPath(
                  clipper: CostomPath2(),

                  child: Container(
                    padding: EdgeInsets.only(bottom: 20),
                    width:  size.width,
                    height: size.height *0.55,
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2)
                    ),
                  ),
                )),
            Positioned(

                bottom: 0,
                child:  ClipPath(
                  clipper: CostomPath3(),

                  child: Container(
                    padding: EdgeInsets.only(bottom: 20 , top: 40 ),
                    width:  size.width,
                    height: size.height *0.50,
                    decoration: BoxDecoration(
                        color: Colors.white
                    ),

                    child: Column(
                      children: [
                        /*
                        Container(
                          child: Center(
                            child: SvgPicture.asset('assets/icons/sms.svg', width: 120,),
                          ),
                        ) ,

                         */
                        SizedBox(height: 20,) ,

                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Theme.of(context).accentColor ,
                              border: Border.all(color: Theme.of(context).iconTheme.color) ,
                              borderRadius: BorderRadius.circular(10)
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

                        ButtonBottom(
                          onTap: (){
                            if (BlocProvider.of<BlocDataConfermUserCreatedCodSms>(context).state != null ) {
                              if(BlocProvider.of<BlocDataConfermUserCreatedCodSms>(context).state['state'] == 'Sand'){
                                userNew = UserLocalModel(
                                  name: user.name ,
                                  password:  user.password ,
                                  email: user.email ,
                                  nombrePhon: nomprePhone ,
                                  image: user.image ,
                                ) ;
                                ScaffoldMessenger.of(Scaffold.of(context).context).showSnackBar(SnackBar(content: Text('Code has been sent', style: Theme.of(context).textTheme.button.copyWith(fontSize: 15 , color: Colors.white),) , backgroundColor: kPrimaryColor));
                                BlocProvider.of<BlocScreenManageVerificationCodSms>(context).add(EventManageConfermCodSmsConfermed(user: userNew)) ;

                              }else {
                                ScaffoldMessenger.of(Scaffold.of(context).context).showSnackBar(SnackBar(content: Text('Please send the verification code', style: Theme.of(context).textTheme.button.copyWith(fontSize: 15 , color: Colors.white),) , backgroundColor: Colors.red));
                              }
                            }else {
                              ScaffoldMessenger.of(Scaffold.of(context).context).showSnackBar(SnackBar(content: Text('Please send the verification code', style: Theme.of(context).textTheme.button.copyWith(fontSize: 15 , color: Colors.white),) , backgroundColor: Colors.red));

                            }
                          },
                          widget: Icon(Icons.arrow_forward , color: Colors.white,),
                        ),


                      ],
                    ),

                  ),
                )),

            /*
            Header(
              title: 'Mobil Verification',
              description: 'Please enter your phone number to create an account',
            ) ,
            
            SizedBox(height: 20,) ,
            
            Container(
              child: Center(
                child: SvgPicture.asset('assets/icons/sms.svg', width: 120,),
              ),
            ) ,
            SizedBox(height: 20,) ,

            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                  color: Theme.of(context).accentColor ,
                  border: Border.all(color: Theme.of(context).iconTheme.color) , 
                  borderRadius: BorderRadius.circular(10)
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

            ButtonBottom(
              onTap: (){
                if (BlocProvider.of<BlocDataConfermUserCreatedCodSms>(context).state != null ) {
                  if(BlocProvider.of<BlocDataConfermUserCreatedCodSms>(context).state['state'] == 'Sand'){
                    userNew = UserLocalModel(
                      name: user.name ,
                      password:  user.password ,
                      email: user.email ,
                      nombrePhon: nomprePhone ,
                      image: user.image ,
                    ) ;
                    ScaffoldMessenger.of(Scaffold.of(context).context).showSnackBar(SnackBar(content: Text('Code has been sent', style: Theme.of(context).textTheme.button.copyWith(fontSize: 15 , color: Colors.white),) , backgroundColor: kPrimaryColor));
                    BlocProvider.of<BlocScreenManageVerificationCodSms>(context).add(EventManageConfermCodSmsConfermed(user: userNew)) ;

                  }else {
                    ScaffoldMessenger.of(Scaffold.of(context).context).showSnackBar(SnackBar(content: Text('Please send the verification code', style: Theme.of(context).textTheme.button.copyWith(fontSize: 15 , color: Colors.white),) , backgroundColor: Colors.red));
                  }
                }else {
                  ScaffoldMessenger.of(Scaffold.of(context).context).showSnackBar(SnackBar(content: Text('Please send the verification code', style: Theme.of(context).textTheme.button.copyWith(fontSize: 15 , color: Colors.white),) , backgroundColor: Colors.red));

                }
              },
              widget: Icon(Icons.arrow_forward , color: Colors.white,),
            ),

             

            SizedBox(height: 30,)

             */

          ],
        ),
      ),
    );
  }
}

