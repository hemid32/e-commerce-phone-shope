import 'package:flutter/material.dart';

class NomeUser extends StatelessWidget {
  const NomeUser({
    Key? key,required this.name,required this.email,
  }) : super(key: key);
  final String name ;
  final String email ;


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text('$name ', style: Theme.of(context).textTheme.button?.copyWith(
              fontSize: 20 , fontWeight: FontWeight.bold
          ),),
          Text('$email', style:  Theme.of(context).textTheme.button?.copyWith(
              fontSize: 15
          ),),
        ],
      ),
    );
  }
}
