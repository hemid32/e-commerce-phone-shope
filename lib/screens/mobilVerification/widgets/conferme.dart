import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:phoneshop/bloc/editUser/bloc.dart';
import 'package:phoneshop/bloc/editUser/event.dart';
import 'package:phoneshop/bloc/manageScreenConfermCodSms/bloc.dart';
import 'package:phoneshop/bloc/manageScreenConfermCodSms/event.dart';
import 'package:phoneshop/bloc/register/bloc.dart';
import 'package:phoneshop/bloc/register/event.dart';
import 'package:phoneshop/bloc/timer/timer_bloc.dart';
import 'package:phoneshop/constant.dart';
import 'package:phoneshop/model/user/user.dart';
import 'package:phoneshop/screens/homescreen/homescreen.dart';
import 'package:phoneshop/screens/loginorRegester/componants/costom_path.dart';
import 'package:phoneshop/screens/mobilVerification/componants/button.dart';
import 'package:phoneshop/screens/mobilVerification/componants/card_small_cod.dart';

class ConfermSms extends StatefulWidget {
  ConfermSms({
    Key? key,
    required this.user, this.isUpdate = false ,
  }) : super(key: key);

  final UserLocalModel user;
  final isUpdate  ;

  @override
  _ConfermSmsState createState() => _ConfermSmsState();
}

class _ConfermSmsState extends State<ConfermSms> {
  late String codSms;

  late String verificationId;

  TextEditingController cod1 = TextEditingController();

  TextEditingController cod2 = TextEditingController();

  TextEditingController cod3 = TextEditingController();

  TextEditingController cod4 = TextEditingController();

  TextEditingController cod5 = TextEditingController();

  TextEditingController cod6 = TextEditingController();

  late  FocusNode text1, text2, text3, text4, text5, text6;

  @override
  void initState() {
    super.initState();
    text1 = FocusNode();
    text2 = FocusNode();
    text3 = FocusNode();
    text4 = FocusNode();
    text5 = FocusNode();
    text6 = FocusNode();
  }

  @override
  void dispose() {
    text1.dispose();
    text2.dispose();
    text3.dispose();
    text4.dispose();
    text5.dispose();
    text6.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _timer(context) ;
    Size size = MediaQuery.of(context).size;
    verificationId = BlocProvider.of<BlocDataConfermUserCreatedCodSms>(context)
        .state['verificationId'];
    return SizedBox(
      width: size.width,
      height: size.height,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            child: ClipPath(
              clipper: CostomPath1(),
              child: Container(
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
                      child: SvgPicture.asset('assets/icons/sms_authentication.svg', width: 80,),
                    ),
                    SizedBox(height: 10,) ,
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Text('Enter the verification code consisting of i digits' , style: Theme.of(context).textTheme.button?.copyWith(
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SmallCardCod(
                            focusNode: text1,
                            codControl: cod1,
                            //autoFecos:  snapshot == 'cod1' ,
                            onChnaged: (text) {
                              if (text.toString().trim() != '' && text != null) {
                                FocusScope.of(context).requestFocus(text2);
                              }
                            },
                          ),
                          SmallCardCod(
                            focusNode: text2,

                            codControl: cod2,
                            //autoFecos:  snapshot == 'cod2',
                            onChnaged: (text) {
                              if (text.toString().trim() != '' && text != null) {
                                FocusScope.of(context).requestFocus(text3);
                              }
                            },
                          ),
                          SmallCardCod(
                            focusNode: text3,

                            codControl: cod3,
                            //autoFecos:  snapshot == 'cod3',
                            onChnaged: (text) {
                              if (text.toString().trim() != '' && text != null) {
                                FocusScope.of(context).requestFocus(text4);
                              }
                            },
                          ),
                          SmallCardCod(
                            focusNode: text4,
                            codControl: cod4,
                            //autoFecos:  snapshot == 'cod4',
                            onChnaged: (text) {
                              if (text.toString().trim() != '' && text != null) {
                                FocusScope.of(context).requestFocus(text5);
                              }
                            },
                          ),
                          SmallCardCod(
                            focusNode: text5,

                            codControl: cod5,
                            //autoFecos:  snapshot == 'cod5',
                            onChnaged: (text) {
                              if (text.toString().trim() != '' && text != null) {
                                FocusScope.of(context).requestFocus(text6);
                              }
                            },
                          ),
                          SmallCardCod(
                            focusNode: text6,

                            codControl: cod6,
                            //autoFecos:  snapshot == 'cod6',
                            onChnaged: (text) {
                              if (text.toString().trim() != '' && text != null) {
                                FocusScope.of(context).requestFocus(FocusNode());
                              }
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      BlocListener<BlocDataConfermUserCreatedCodSms, dynamic>(
                        listener: (context, stateListen) {
                          if (stateListen != null) {
                            if (stateListen['state'] == 'Errur') {
                              //print('erurr******************************************') ;
                              ScaffoldMessenger.of(Scaffold.of(context).context)
                                  .showSnackBar(SnackBar(
                                  content: Text(
                                    '${stateListen['message']}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .button
                                        ?.copyWith(fontSize: 15, color: Colors.white),
                                  ),
                                  backgroundColor: Colors.red));
                            } else if (stateListen['state'] == 'Sand') {
                              ScaffoldMessenger.of(Scaffold.of(context).context)
                                  .showSnackBar(SnackBar(
                                  content: Text(
                                    'Code has been sent',
                                    style: Theme.of(context)
                                        .textTheme
                                        .button
                                        ?.copyWith(fontSize: 15, color: Colors.white),
                                  ),
                                  backgroundColor: kPrimaryColor));
                            }
                          }
                        },
                        child: GestureDetector(
                          onTap: () => _resand(context),
                          child: BlocBuilder<TimerBloc , TimerState>(
                              builder: (context, snapshot) {
                                return Container(
                                  margin: EdgeInsets.symmetric(horizontal: 20),
                                  child: Text(
                                    'Did you not get the code?\n Resend (${snapshot.duration})',
                                    style: Theme.of(context).textTheme.button?.copyWith(
                                      color: snapshot.duration > 0 ?  Colors.blue.withOpacity(0.3) : Colors.blue,
                                      fontSize: 15,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                );
                              }
                          ),
                        ),
                      ),
                      Spacer(),
                      BlocListener<BlocRegisterUser, dynamic>(
                        listener: (context, stateRegister) {
                          // do stuff here based on BlocA's state
                          //print('states === $state')  ;
                          if (stateRegister == true) {
                            //print('hemidibenameur') ;

                            //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Profile()));
                            //Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => Profile()));
                            ScaffoldMessenger.of(Scaffold.of(context).context)
                                .showSnackBar(SnackBar(
                                content: Text(
                                  !widget.isUpdate ? 'Account created successfully' : 'The number has been confirmed',
                                  style: Theme.of(context)
                                      .textTheme
                                      .button
                                      ?.copyWith(fontSize: 15, color: Colors.white),
                                ),
                                backgroundColor: kPrimaryColor));
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.rightToLeft,
                                      child: HomeScreen()),
                                      (Route<dynamic> route) => false);

                          } else {
                            //BlocProvider.of<BlocLoading>(context).add(EventLoadingStop()) ;
                            ScaffoldMessenger.of(Scaffold.of(context).context)
                                .showSnackBar(SnackBar(
                                content: Text(
                                  '$stateRegister',
                                  style: Theme.of(context)
                                      .textTheme
                                      .button
                                      ?.copyWith(fontSize: 15, color: Colors.white),
                                ),
                                backgroundColor: Colors.red));
                          }
                        },
                        child: BlocListener<BlocDataConfermUserCreatedCodSms, dynamic>(
                          listener: (context, stateListen) {
                            //print('stetListen ===== *** === ${stateListen['state']}') ;
                            if (stateListen['state'] == 'confirmed') {

                              if(!widget.isUpdate) {
                                BlocProvider.of<BlocRegisterUser>(context)
                                    .add(EventsRegisters(
                                  user: widget.user,
                                  allFormIsCompletedTrue: true,
                                  phonAuth: stateListen['PhoneAuthCredential'],
                                ));
                              }else{
                                BlocProvider.of<BlocEditUser>(context).add(EventEditProfileWithPhone(
                                  newUser: widget.user ,
                                  phonAuth: stateListen['PhoneAuthCredential']
                                ));
                                Navigator.pop(context) ;



                              }



                            }
                          },
                          child: ButtonBottom(
                            onTap: () {
                              codSms =
                              '${cod1.text}${cod2.text}${cod3.text}${cod4.text}${cod5.text}${cod6.text}';
                              //print('sms === $codSms');
                              BlocProvider.of<BlocDataConfermUserCreatedCodSms>(context)
                                  .add(EventSandCodeFromFirBasCodeConfermCodSmS(
                                codSms: codSms,
                                verificationId: verificationId,
                              ));
                            },
                            widget: Text(
                              'Conferme',
                              style: Theme.of(context)
                                  .textTheme
                                  .button
                                  ?.copyWith(fontSize: 18, color: Colors.white),
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),

                ),
              )),
        ],
      ),
    );
  }

  void _resand(BuildContext context) {
    print('resent cod******************************************************');

    if(context
        .read<TimerBloc>().state.duration ==  0 ) {
      BlocProvider.of<BlocDataConfermUserCreatedCodSms>(context)
          .add(EventSandCodeFromFirBasCodeResandCod(
        nombrePhone: BlocProvider
            .of<BlocDataConfermUserCreatedCodSms>(context)
            .state['phone'],
        token: BlocProvider
            .of<BlocDataConfermUserCreatedCodSms>(context)
            .state['token'],
      ));
      context
          .read<TimerBloc>()
          .add(TimerStarted(duration: 30 )) ;
    }else{
      ScaffoldMessenger.of(Scaffold.of(context).context)
          .showSnackBar(SnackBar(
          content: Text(
            'please wait',
            style: Theme.of(context)
                .textTheme
                .button
                ?.copyWith(fontSize: 15, color: Colors.white),
          ),
          backgroundColor: Colors.red));
    }
  }

  _timer(BuildContext context){
    context
        .read<TimerBloc>()
        .add(TimerStarted(duration: 30 )) ;

  }
}
