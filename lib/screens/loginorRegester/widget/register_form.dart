import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/bloc/register/bloc.dart';
import 'package:phoneshop/bloc/register/event.dart';
import 'package:phoneshop/bloc/userManagze/formerRegister/termAndCondition/bloc.dart';
import 'package:phoneshop/bloc/userManagze/formerRegister/termAndCondition/event.dart';
import 'package:phoneshop/bloc/userManagze/screenLoginRegister/bloc.dart';
import 'package:phoneshop/bloc/userManagze/screenLoginRegister/event.dart';
import 'package:phoneshop/bloc/validatorTaxtField/bloc.dart';
import 'package:phoneshop/bloc/validatorTaxtField/event.dart';
import 'package:phoneshop/constant.dart';
import 'package:phoneshop/model/user/user.dart';
import 'package:phoneshop/screens/loginorRegester/componants/button_register.dart';
import 'package:phoneshop/screens/loginorRegester/componants/costom_path.dart';
import 'package:phoneshop/screens/loginorRegester/componants/register_r_design.dart';
import 'package:phoneshop/screens/loginorRegester/componants/test_fiald_and_button_verifaid.dart';
import 'package:phoneshop/screens/screen_pay/componants/field_text.dart';

class Register extends StatelessWidget {
   const Register({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserLocalModel _user ;
    String _email ;
    String  _name ;
    String _phone ;
    String _password ;
    bool allFormIsCompleted ;
    Size size = MediaQuery.of(context).size ;

    return Container(
      width: size.width,
      height: size.height,
      child: Stack(
        children: [


          ClipPath(
            clipper: CostomPath10(),
            child: Container(
              width: size.width,
              height: size.height,
              decoration: BoxDecoration(
                color: kPrimaryColor.withOpacity(0.6),
              ),
            ),
          ),
          ClipPath(
            clipper: CostomPath11(),
            child: Container(
              width: size.width,
              height: size.height,
              decoration: BoxDecoration(
                color: kPrimaryColor.withOpacity(0.23),
              ),
            ),
          ),
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
                }, validErurr: state, );
              }
            ),
          ) ,
          Positioned(
            left: size.width *0.2 ,
            right: 10  ,
            top: size.height * 0.35 + 60 ,
            child: BlocBuilder<ValidatorTexxtBlocPhoneNombre , dynamic >(
              builder: (context, state) {
                return FieldTextGetAndVerifeid(title: 'Nombre Phone',onChange: (valur){
                  BlocProvider.of<ValidatorTexxtBlocPhoneNombre>(context).add(TextFieldValidatorEventPhoneNombre(
                    valur: valur ,
                    titleErurr:  'wrong number !',
                  )) ;
                  _phone = valur ;
                },validErurr: state , color: kPrimaryColor, titleButton: 'verifaid', onTapButton: ()=>_showMyDialogSandCod(context, '545454'),);
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
                    valur: valur ,
                    titleErurr:  'Email error !',
                  )) ;
                  _email = valur ;

                }, validErurr: state, );
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
                }, secure: true, validErurr: state, );
              }
            ),
          ) ,

          Positioned(
            left: size.width *0.25,
            right: 10  ,
            top: size.height * 0.35 + 250 ,
            child: Container(

              child: Row(
                children: [
                  BlocBuilder<BlocTermaAndConditionChek , bool >(
                    builder: (context, state) {

                      return  Checkbox(
                        activeColor: kPrimaryColor,
                          value: state, onChanged: (value){
                        BlocProvider.of<BlocTermaAndConditionChek>(context).add(EventChekTermsItem(
                          value
                        )) ;
                      });
                    }
                  ) ,
                  Text('agree with Terms & conditions', style: Theme.of(context).textTheme.button.copyWith(
                      color: kPrimaryColor
                  ),)
                ],
              ),

            ),
          ),


          Positioned(
            //left: size.width *0.25,
            right: 20  ,
            bottom: 20 ,
            child: ButtonRegister(
              onTap: (){
                _user = UserLocalModel.fromJson({
                  'name' : _name ,
                  'email' : _email ,
                  'password' : _password ,
                  'nombrePhon' : _phone ,
                  'image' : 'null'
                });
                allFormIsCompleted = true ;

                BlocProvider.of<BlocRegisterUser>(context).add(EventsRegisters(
                  user: _user ,
                  allFormIsCompletedTrue: allFormIsCompleted ,
                )) ;




              },
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
    );
  }
}


Future<void> _showMyDialog(contextt , nombre) async {
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
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}


Future<void> _showMyDialogSandCod(contextt , nambre ) async {
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
            child: Text('sand'),
            onPressed: () {
              print('Cencel');
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text('Sand'),
            onPressed: () {
              Navigator.of(context).pop();
              _showMyDialog(contextt, nambre) ;

            },
          ),
        ],
      );
    },
  );
}

