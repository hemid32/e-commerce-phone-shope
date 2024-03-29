import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import 'package:phoneshop/bloc/laodingCirceler/bloc.dart';
import 'package:phoneshop/bloc/manageScreenConfermCodSms/bloc.dart';
import 'package:phoneshop/bloc/manageScreenConfermCodSms/event.dart';
import 'package:phoneshop/bloc/register/bloc.dart';
import 'package:phoneshop/bloc/userManagze/formerRegister/termAndCondition/bloc.dart';
import 'package:phoneshop/bloc/userManagze/formerRegister/termAndCondition/event.dart';
import 'package:phoneshop/bloc/userManagze/screenLoginRegister/bloc.dart';
import 'package:phoneshop/bloc/userManagze/screenLoginRegister/event.dart';
import 'package:phoneshop/bloc/validatorTaxtField/bloc.dart';
import 'package:phoneshop/bloc/validatorTaxtField/event.dart';
import 'package:phoneshop/constant.dart';
import 'package:phoneshop/model/user/user.dart';
import 'package:phoneshop/oitil/snack_bar.dart';
import 'package:phoneshop/screens/loginorRegester/componants/button_register.dart';
import 'package:phoneshop/screens/loginorRegester/componants/register_r_design.dart';
import 'package:phoneshop/screens/loginorRegester/function/verifiedFieldIsComplet.dart';
import 'package:phoneshop/screens/mobilVerification/mobilVerification.dart';
import 'package:phoneshop/screens/screen_pay/componants/field_text.dart';

import 'container_background.dart';
class Register extends StatelessWidget {
    Register({
    Key? key,
  }) : super(key: key);
   late String _email ;
   late String  _name ;
   late String _phone ;
   late String _password ;
   late bool _allFormIsCompleted ;
   late bool _allFormIsNotVide ;
   late UserLocalModel _user ;


    @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size ;
    //print(BlocProvider.of<BlocDataConfermUserCreatedCodSms>(context).state);
    return WillPopScope(
      child: Container(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [


            ContainerBackgrounds1(),
            ContainerBackground2(),
            Positioned(
              top: size.height * 0.15,
              left: 0,
              right: 0,
              child: logoRdesign(),
            ),
            Positioned(
              left: size.width *0.2 ,
              right: 10  ,
              top: size.height * 0.35 ,
              child: BlocBuilder<ValidatorTexxtBlocString , dynamic >(
                builder: (context, state) {
                  return FieldTextGet(title: 'Full name',onChange: (valur){

                    BlocProvider.of<ValidatorTexxtBlocString>(context).add(TextFieldValidatorEventNome(
                      valur: valur ,
                      titleErurr: 'a very short name ! '
                    )) ;
                    _name = valur ;
                  }, validErurr: state, textInputeType: TextInputType.text);
                }
              ),
            ) ,
            Positioned(
              left: size.width *0.2 ,
              right: 10  ,
              top: size.height * 0.35 + 60 ,
              child: BlocBuilder<ValidatorTexxtBlocPhoneNombre , dynamic >(
                builder: (context, state) {
                  return FieldTextGet(title: 'Nombre Phone',onChange: (valur){
                    BlocProvider.of<ValidatorTexxtBlocPhoneNombre>(context).add(TextFieldValidatorEventPhoneNombre(
                      valur: valur ,
                      titleErurr:  'wrong number !',

                    ) ) ;
                    _phone = valur ;
                  },validErurr: state ,textInputeType: TextInputType.number, );
                }
              ),
            ) ,
            Positioned(
              left: size.width *0.20 ,
              right: 10  ,
              top: size.height * 0.35 + 120 ,
              child: BlocBuilder<ValidatorTexxtBlocPhoneEmail , dynamic >(
                builder: (context, state) {
                  return FieldTextGet(title: 'Email',onChange: (valur){
                    //ValidatorTexxtBlocPhoneEmail
                    BlocProvider.of<ValidatorTexxtBlocPhoneEmail>(context).add(TextFieldValidatorEventPhoneEmail(
                      valur: valur.toString().trim() ,
                      titleErurr:  'Email error !',
                    )) ;
                    _email = valur.toString().trim() ;

                  }, validErurr: state,textInputeType: TextInputType.emailAddress );
                }
              ),
            ) ,
            Positioned(
              left: size.width *0.2,
              right: 10  ,
              top: size.height * 0.35 + 180 ,
              child: BlocBuilder<ValidatorTexxtBlocPassword  , dynamic >(
                builder: (context, state) {
                  return FieldTextGet(title: 'Password',onChange: (valur){

                    //ValidatorTexxtBlocPassword
                    BlocProvider.of<ValidatorTexxtBlocPassword>(context).add(TextFieldValidatorEventPassword(
                      valur: valur ,
                      titleErurr:  'At least 8 characters !',
                    )) ;
                    _password = valur ;
                  }, secure: true, validErurr: state,textInputeType: TextInputType.text );
                }
              ),
            ) ,

            Positioned(
              left: size.width *0.25,
              right: 10  ,
              top: size.height * 0.35 + 270 ,
              child: Container(

                child: Row(
                  children: [
                    BlocBuilder<BlocTermaAndConditionChek , bool >(
                      builder: (context, state) {

                        return  Checkbox(
                          activeColor: kPrimaryColor,
                            value: state, onChanged: (value){
                          BlocProvider.of<BlocTermaAndConditionChek>(context).add(EventChekTermsItem(
                            value!
                          )) ;
                        });
                      }
                    ) ,
                    Expanded(
                      child: Text('agree with Terms & conditions', style: Theme.of(context).textTheme.button?.copyWith(
                          color: kPrimaryColor
                      ),),
                    )
                  ],
                ),

              ),
            ),


            Positioned(
              //left: size.width *0.25,
              right: 20  ,
              bottom: 20 ,
              child: BlocListener<BlocLoading , bool>(
                listener: (context, states){

                  if(states== true  ){
                    showDialogloding(context) ;
                  }else if(states == false ) {
                    Navigator.pop(context);
                    //_showMyDialogSandCod(context , _phone) ;

                  }


                },
                child: ButtonRegister(
                  onTap: ()async {
                    //BlocPhoneAuth.get(context).formatFone(_phone) ;

                    _user = UserLocalModel.fromJson({
                      'name' : _name ,
                      'email' : _email ,
                      'password' : _password ,
                      'nombrePhon' : _phone ,
                      'image' : 'null'
                    });
                    /*
                    allFormIsCompleted = true ;

                    BlocProvider.of<BlocRegisterUser>(context).add(EventsRegisters(
                      user: _user ,
                      allFormIsCompletedTrue: allFormIsCompleted ,
                    )) ;

                     */
                    //virifeidFormRegisterIsCompletIsNoteVide
                    //BlocProvider.of<BlocLoading>(context).add(EventLoadingStart()) ;
                    _allFormIsCompleted = virifeidFormRegisterIsCompletallFormIsCompletedTrue(
                        BlocProvider.of<ValidatorTexxtBlocString>(context).state ,   BlocProvider.of<ValidatorTexxtBlocPhoneNombre>(context).state , BlocProvider.of<ValidatorTexxtBlocPhoneEmail>(context).state , BlocProvider.of<ValidatorTexxtBlocPassword>(context).state , BlocProvider.of<BlocTermaAndConditionChek>(context).state
                    ) ;

                    _allFormIsNotVide = virifeidFormRegisterIsCompletallFormIsCompletedNotVide(_name, _phone, _email, _password,BlocProvider.of<BlocTermaAndConditionChek>(context).state ) ;

                    if((_allFormIsNotVide && _allFormIsCompleted  )){
                       print('all info is true !! ') ;
                      //showMyDialogSandCod(context , _phone , _user) ;

                       BlocProvider.of<BlocScreenManageVerificationCodSms>(context).add(EventManageConfermCodSmsSandCod(user: _user)) ;

                       Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, child: BlocProvider.value(
                           value: BlocProvider.of<BlocScreenManageVerificationCodSms>(context),
                           child: BlocProvider.value(
                               value: BlocProvider.of<BlocRegisterUser>(context),
                               child: MobilVarification()))));



                    }else {
                      print('all info is true  false ******* !! ') ;
                      /*
                      Toast.show( 'Errur !! ',
                        context,
                        duration: 3,
                        gravity:  Toast.BOTTOM ,
                        border: Border.all(color: Colors.white) ,
                      );

                       */
                      showInSnackBar(context ,'Errur !! ') ;


                    }

                    //await Future.delayed(const Duration(seconds: 3), () => "1");
                     //BlocProvider.of<BlocLoading>(context).add(EventLoadingStop()) ;








                  },
                ),
              ),
            ) ,
            Positioned(
              top: 0,
              child: GestureDetector(
                onTap: ()=> BlocProvider.of<BlocScreenLoginRegisterManage>(context).add(EventScreenRegisterOrLogin()),
                child: Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(top: 40 , left: 20 , right:  20 ),
                  child: Icon(Icons.arrow_back , size: 30, color: Colors.white,),
                ),
              ),
            ),



          ],
        ),
      ),
      onWillPop: () async {
        BlocProvider.of<BlocScreenLoginRegisterManage>(context).add(EventScreenRegisterOrLogin());
        return false ;
      },
    );
  }



}

