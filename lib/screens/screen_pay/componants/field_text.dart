import 'package:flutter/material.dart';

class FieldTextGet extends StatelessWidget {
   FieldTextGet({
    Key? key,required this.title,
     required this.onChange,
      this.validator,
      this.validErurr,
      this.secure = false,
      this.initialValue,
     required this.textInputeType ,
  }) : super(key: key);
  final String  title ;
  final Function onChange ;
  final Function? validator ;
  final String?  validErurr ;
  final bool secure ;
  final String? initialValue ; // user sur edit profile  ;

   final TextInputType textInputeType ;


   final GlobalKey<FormState> formKey = GlobalKey<FormState>();





   @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        initialValue: initialValue,
        validator: (v){validator!(v);} ,
        onChanged: (v){onChange(v);},
        obscureText: secure,
        keyboardType: textInputeType,
        decoration: InputDecoration(

          errorText: validErurr ,
          labelText: '$title' ,
          labelStyle: Theme.of(context).textTheme.button ,
        ),
      ),
    );
  }
}


