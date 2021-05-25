import 'package:flutter/material.dart';

class FieldTextGet extends StatelessWidget {
  const FieldTextGet({
    Key key, this.title, this.onChange,
  }) : super(key: key);
  final String  title ;
  final Function onChange ;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        
        onChanged: onChange,
        decoration: InputDecoration(
          labelText: '$title' ,
          labelStyle: Theme.of(context).textTheme.button.copyWith(color: Colors.black.withOpacity(0.4)) ,
        ),
      ),
    );
  }
}

