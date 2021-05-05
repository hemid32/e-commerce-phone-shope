import 'package:flutter/material.dart';
class TitleTextAligns extends StatelessWidget {
  const TitleTextAligns({
    Key key, this.title,
  }) : super(key: key);
  final String title ;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20 , vertical:  10),

      child: Text('$title' ,style: Theme.of(context).textTheme.button.copyWith(color: Colors.black.withOpacity(0.4)), ),
    );
  }
}

