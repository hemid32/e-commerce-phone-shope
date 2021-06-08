import 'package:flutter/material.dart';
import 'package:phoneshop/constant.dart';
import 'package:phoneshop/screens/loginorRegester/componants/costom_path.dart';
import 'package:phoneshop/screens/loginorRegester/componants/icon_sotial.dart';
import 'package:phoneshop/screens/loginorRegester/componants/logo_text_header.dart';

class RigesterOrLogin extends StatelessWidget {
  const RigesterOrLogin({
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
                  title: 'Login Or Register !',
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

                child: IconSotialAndButtons(),
              )),

        ],
      ),
    );
  }
}
