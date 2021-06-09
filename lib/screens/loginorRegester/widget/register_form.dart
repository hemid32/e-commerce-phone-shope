import 'package:flutter/material.dart';
import 'package:phoneshop/constant.dart';
import 'package:phoneshop/screens/loginorRegester/componants/costom_path.dart';
import 'package:phoneshop/screens/screen_pay/componants/field_text.dart';

class Register extends StatelessWidget {
  const Register({
    Key key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
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
            child: Container(
              padding: EdgeInsets.all(5),
              width: size.width *0.35,
              height:size.width *0.35 ,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.5) ,
                shape: BoxShape.circle ,
              ),
              child: Container(
                alignment: Alignment.center,
                decoration:BoxDecoration(
                  color: kPrimaryColor ,
                  shape: BoxShape.circle ,

                ),
                child: Text('R' , style: Theme.of(context).textTheme.button.copyWith(

                  color: Colors.white.withOpacity(0.23),
                  fontSize:  size.width *0.30 ,
                ),),
              ),
            ),
          ),
          Positioned(
            left: size.width *0.2 ,
            right: 10  ,
            top: size.height * 0.35 ,
            child: FieldTextGet(title: 'Full name',onChange: (valur){

            }, ),
          ) ,
          Positioned(
            left: size.width *0.2 ,
            right: 10  ,
            top: size.height * 0.35 + 60 ,
            child: FieldTextGet(title: 'Nombre Phone',onChange: (valur){

            }, ),
          ) ,
          Positioned(
            left: size.width *0.20 ,
            right: 10  ,
            top: size.height * 0.35 + 120 ,
            child: FieldTextGet(title: 'Email',onChange: (valur){

            }, ),
          ) ,
          Positioned(
            left: size.width *0.2,
            right: 10  ,
            top: size.height * 0.35 + 180 ,
            child: FieldTextGet(title: 'Password',onChange: (valur){

            }, ),
          ) ,

          Positioned(
            left: size.width *0.25,
            right: 10  ,
            top: size.height * 0.35 + 250 ,
            child: Container(

              child: Row(
                children: [
                  Checkbox(value: false, onChanged: (v){}) ,
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
            child: GestureDetector(
              onTap: (){},
              child: Container(
                alignment: Alignment.center,
                width: size.width *0.3 ,
                height: 40 ,
                decoration: BoxDecoration(
                  color: kPrimaryColor ,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.4) ,
                      blurRadius: 5 ,



                    )
                  ] ,
                  borderRadius:  BorderRadius.circular(20) ,

                ),
                child: Text('Register'
                  , style:
                  Theme.of(context).textTheme.button.copyWith(
                      color: Colors.white ,
                      fontSize: 20
                  )
                  ,
                ),
              ),
            ),
          )



        ],
      ),
    );
  }
}


