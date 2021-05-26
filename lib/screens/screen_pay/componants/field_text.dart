import 'package:flutter/material.dart';

class FieldTextGet extends StatelessWidget {
   FieldTextGet({
    Key key, this.title, this.onChange, this.validator, this.validErurr ,
  }) : super(key: key);
  final String  title ;
  final Function onChange ;
  final Function validator ;
  final String  validErurr ;


   final GlobalKey<FormState> formKey = GlobalKey<FormState>();





   @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(

        validator: validator ,
        onChanged: onChange,
        decoration: InputDecoration(
          errorText: validErurr ,
          labelText: '$title' ,
          labelStyle: Theme.of(context).textTheme.button.copyWith(color: Colors.black.withOpacity(0.4)) ,
        ),
      ),
    );
  }
}


