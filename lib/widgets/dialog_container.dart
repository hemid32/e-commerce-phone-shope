import 'package:flutter/material.dart';

class DialogContainer extends StatelessWidget {
  const DialogContainer({
    Key key, this.title, this.widgets, this.actions,
  }) : super(key: key);
  final String  title ;
  final List<Widget> widgets ;
  final List<Widget> actions ;


  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      backgroundColor:Colors.white,
      title: Text('Filter' , style: Theme.of(context).textTheme.button.copyWith(color: Colors.black.withOpacity(0.4) , fontSize: 20),),
      content: SingleChildScrollView(
        child: ListBody(
          children: widgets ,
        ),
      ),
      actions: actions,
    );
  }
}

