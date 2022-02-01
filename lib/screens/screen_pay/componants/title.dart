import 'package:flutter/material.dart';
class TitleTextAligns extends StatelessWidget {
  const TitleTextAligns({
    Key? key, required this.title,
  }) : super(key: key);
  final String title ;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20 , vertical:  10),

      child: Text('$title' ,style: Theme.of(context).textTheme.button, ),
    );
  }
}

