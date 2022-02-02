import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:phoneshop/constant.dart';
import 'package:phoneshop/model/user/ServisecUser_Firebase.dart';
import 'package:phoneshop/screens/loginorRegester/componants/button_costom_login.dart';
import 'package:phoneshop/screens/loginorRegester/componants/costom_path.dart';
import 'package:phoneshop/screens/screen_pay/componants/field_text.dart';

class Body extends StatelessWidget {




   Body({Key? key,required this.emails }) : super(key: key);
   final String emails ;
   late String email  ;
   UserFire _user = UserFire(user: null) ;

  @override
  Widget build(BuildContext context) {
    email = emails ;
    Size size = MediaQuery.of(context).size ;
    return Stack(
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

              child:Column(
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
                    child: SvgPicture.asset('assets/icons/icons8-email.svg', width: 80,),
                  ),
                  SizedBox(height: 10,) ,
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Text('A link to change the password has been sent to the email' , style: Theme.of(context).textTheme.button?.copyWith(
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
                    FieldTextGet(title: 'Email',onChange: (valur){
                      email = valur.toString().trim() ;
                    }, initialValue: emails,              textInputeType: TextInputType.emailAddress,
                    ) ,

                    Spacer() ,

                    ButtonCotomLogIn(
                      title: 'Sand Email',
                      color: kPrimaryColor,
                      onTap: () async  {
                         print('emaail ==== $email') ;
                        if( email != null && EmailValidator.validate(email.trim()) ) {
                          var sand = await _user.restPasswordForget(email.trim());
                          if (sand == true) {
                            Navigator.pop(context);
                            Scaffold.of(context).showSnackBar(SnackBar(
                                content: Text(
                                  'A link to change the password has been sent to the email',
                                  style: TextStyle(color: Colors.white),)));
                          } else {
                            Scaffold.of(context).showSnackBar(SnackBar(
                                content: Text('$sand',
                                  style: TextStyle(color: Colors.white),)));
                          }
                        }else{
                          Scaffold.of(context).showSnackBar(SnackBar(
                              content: Text('Errur Email',
                                style: TextStyle(color: Colors.white),)));

                        }
                      },
                    )
                  ],
                ),

              ),
            )),

      ],
    );
  }
}
