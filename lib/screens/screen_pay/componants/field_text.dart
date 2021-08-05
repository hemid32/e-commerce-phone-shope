import 'package:flutter/material.dart';

class FieldTextGet extends StatelessWidget {
   FieldTextGet({
    Key key, this.title, this.onChange, this.validator, this.validErurr, this.secure = false, this.initialValue ,
  }) : super(key: key);
  final String  title ;
  final Function onChange ;
  final Function validator ;
  final String  validErurr ;
  final bool secure ;
  final String initialValue ; // user sur edit profile  ;


   final GlobalKey<FormState> formKey = GlobalKey<FormState>();





   @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        initialValue: initialValue,
        validator: validator ,
        onChanged: onChange,
        obscureText: secure,
        decoration: InputDecoration(

          errorText: validErurr ,
          labelText: '$title' ,
          labelStyle: Theme.of(context).textTheme.button ,
        ),
      ),
    );
  }
}


