import 'package:flutter/material.dart';

class FieldTextGet extends StatelessWidget {
  const FieldTextGet({
    Key key, this.title,
  }) : super(key: key);
  final String  title ;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        decoration: InputDecoration(
          labelText: '$title' ,
          labelStyle: Theme.of(context).textTheme.button.copyWith(color: Colors.black.withOpacity(0.4)) ,
        ),
      ),
    );
  }
}

