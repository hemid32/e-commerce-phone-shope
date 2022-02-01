import 'package:flutter/material.dart';

class FieldNotes extends StatelessWidget {
  const FieldNotes({
    Key? key,required this.onChanged,required this.hintText,
  }) : super(key: key);
  final Function onChanged ;
  final String hintText ;

  @override
  Widget build(BuildContext context) {
    return Container(
      height:  120,
      margin: EdgeInsets.symmetric(horizontal: 20 , vertical:  10),
      decoration: BoxDecoration(
          color: Theme.of(context).accentColor ,
          border: Border.all(color: Colors.black.withOpacity(0.09))
      ),
      child: TextField(

        onChanged: (v){onChanged(v);},
        maxLines: 5,




        decoration: InputDecoration(
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,

            hintText:  '$hintText' ,
            hintStyle: Theme.of(context).textTheme.button?.copyWith(color: Theme.of(context).textTheme.button!.color!.withOpacity(0.4))
        ),
      ),
    );
  }
}

