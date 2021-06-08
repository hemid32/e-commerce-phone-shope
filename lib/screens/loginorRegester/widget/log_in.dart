import 'package:flutter/material.dart';
import 'package:phoneshop/constant.dart';
import 'package:phoneshop/screens/loginorRegester/componants/button_costom_login.dart';
import 'package:phoneshop/screens/loginorRegester/componants/costom_path.dart';
import 'package:phoneshop/screens/loginorRegester/componants/logo_text_header.dart';
import 'package:phoneshop/screens/screen_pay/componants/field_text.dart';

class Login extends StatelessWidget {
  const Login({
    Key key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size ;

    return Container(
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

                child: TextTileHeader(
                  logo: 'assets/icons/icons8-samsung.svg',
                  title: 'Login !',
                  details: 'Log in to your account or create a new account on the store ',
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
                      FieldTextGet(title: 'Nombre Phone Or Email',onChange: (valur){

                      }, ) ,
                      SizedBox(height: 20,) ,

                      FieldTextGet(title: 'Password',onChange: (valur){

                      }, secure: true, ) ,
                      SizedBox(height: 20,) ,
                      ButtonCotomLogIn(
                        title: 'LOGIN',
                        color: kPrimaryColor,
                        onTap: (){},
                      ),

                      Spacer() ,
                      GestureDetector(
                        onTap: (){},
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
    );
  }
}

