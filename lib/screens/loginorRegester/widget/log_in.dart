import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import 'package:phoneshop/bloc/userManagze/screenLoginRegister/bloc.dart';
import 'package:phoneshop/bloc/userManagze/screenLoginRegister/event.dart';
import 'package:phoneshop/bloc/userManagze/userVirifaid/bloc.dart';
import 'package:phoneshop/bloc/userManagze/userVirifaid/event.dart';
import 'package:phoneshop/constant.dart';
import 'package:phoneshop/model/user/ServisecUser_Firebase.dart';
import 'package:phoneshop/screens/forgetPawword/forget_password.dart';
import 'package:phoneshop/screens/loginorRegester/componants/button_costom_login.dart';
import 'package:phoneshop/screens/loginorRegester/componants/costom_path.dart';
import 'package:phoneshop/screens/loginorRegester/componants/header_login.dart';
import 'package:phoneshop/screens/screen_pay/componants/field_text.dart';

class Login extends StatelessWidget {
   Login({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String email ;
    String password ;
    Size size = MediaQuery.of(context).size ;
    UserFire _user = UserFire(user: null);


    return WillPopScope(
      child: Container(
        color: kPrimaryColor.withOpacity(0.3),
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

                  child: TextTileHeaderLogin(
                    title: 'Login !',
                    details: 'Log in to your account or create a new account on the store ',
                    onTapBack: ()=> BlocProvider.of<BlocScreenLoginRegisterManage>(context).add(EventScreenRegisterOrLogin()),
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
                        FieldTextGet(title: 'Email',onChange: (valur){
                             email = valur ;
                        }, ) ,
                        SizedBox(height: 20,) ,

                        FieldTextGet(title: 'Password',onChange: (valur){
                          password = valur ;
                        }, secure: true, ) ,
                        SizedBox(height: 20,) ,
                        ButtonCotomLogIn(
                          title: 'LOGIN',
                          color: kPrimaryColor,
                          onTap: () async {

                            if (email != null  && password != null && email != '' && password != '') {
                              var logIn = await _user.login(
                                  email.trim(), password);
                              if (logIn['result'] == true) {
                                BlocProvider.of<BlocUserVerifaid>(context).add(EventUserVerifaid()) ;
                                Scaffold.of(context).showSnackBar(SnackBar(
                                    content: Text('Logged in',
                                      style: TextStyle(color: Colors.white),)));
                                Navigator.pop(context);
                              } else {
                                Scaffold.of(context).showSnackBar(SnackBar(
                                    content: Text('${logIn['message']}',
                                        style: TextStyle(
                                            color: Colors.white))));
                              }
                            }else{
                              Scaffold.of(context).showSnackBar(SnackBar(
                                  content: Text('There is an empty field',
                                    style: TextStyle(color: Colors.white),)));
                            }

                          }
                        ),

                        Spacer() ,
                        GestureDetector(
                          onTap: ()  {
                            //print('reset') ;
                            //await _user.restPasswordForget('benameurhemidi@gmail.com') ;
                            Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, child: ForgetPassword(email: email,)));

                          },
                          child: Container(
                            child: Text('Forget Password ? ' , style:
                            Theme.of(context).textTheme.button.copyWith(
                              color: Colors.blueAccent.withOpacity(0.7) ,
                              decoration: TextDecoration.underline,
                            )
                              ,),
                          ),
                        )


                      ],
                    ),

                  ),
                )),

          ],
        ),
      ),
      onWillPop: ()async{
        BlocProvider.of<BlocScreenLoginRegisterManage>(context).add(EventScreenRegisterOrLogin());

        return false ;
      },
    );
  }
}

