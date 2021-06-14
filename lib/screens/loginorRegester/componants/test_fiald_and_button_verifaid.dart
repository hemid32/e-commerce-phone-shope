import 'package:flutter/material.dart';
import 'package:phoneshop/constant.dart';

class FieldTextGetAndVerifeid extends StatelessWidget {
  FieldTextGetAndVerifeid({
    Key key, this.title, this.onChange, this.validator, this.validErurr, this.secure = false, this.onTapButton, this.titleButton, this.color ,
  }) : super(key: key);
  final String  title ;
  final Function onChange ;
  final Function validator ;
  final String  validErurr ;
  final bool secure ;
  final Function onTapButton ;
  final String titleButton ;
  final Color color ;


  final GlobalKey<FormState> formKey = GlobalKey<FormState>();





  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size ;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        child: Row(
          children: [
            SizedBox(
              width: size.width - (size.width *0.2 + 130 )  ,
              child: TextFormField(

                validator: validator ,
                onChanged: onChange,
                obscureText: secure,
                decoration: InputDecoration(

                  errorText: validErurr ,
                  labelText: '$title' ,
                  labelStyle: Theme.of(context).textTheme.button.copyWith(color: Colors.black.withOpacity(0.4)) ,
                ),
              ),
            ),

            Expanded(
              child: GestureDetector(
                onTap: onTapButton,
                child: SizedBox(
                  width: 130,
                  height: 30,
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(10) ,
                    ),
                    child: Text('$titleButton' , style: Theme.of(context).textTheme.button.copyWith(
                      color: Colors.white ,
                    ),),
                  ),
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}
