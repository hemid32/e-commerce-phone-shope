import 'package:flutter/material.dart';

class NomeUser extends StatelessWidget {
  const NomeUser({
    Key key, this.name, this.email,
  }) : super(key: key);
  final String name ;
  final String email ;


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text('$name', style: Theme.of(context).textTheme.button.copyWith(
              color: Colors.black.withOpacity(0.8) ,
              fontSize: 20
          ),),
          Text('$email', style:  Theme.of(context).textTheme.button.copyWith(
              color: Colors.black.withOpacity(0.4) ,
              fontSize: 15
          ),),
        ],
      ),
    );
  }
}
