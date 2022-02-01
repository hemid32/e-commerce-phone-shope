import 'package:flutter/material.dart';
class DropDawen extends StatelessWidget {
  const DropDawen({
    Key? key,required this.valur,required this.onTap,required this.items,
  }) : super(key: key);
  final  String valur ;
  final Function onTap ;
  final List<String > items  ;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: DropdownButton(
        dropdownColor: Theme.of(context).accentColor,
        value: valur,
        onChanged: (v){onTap(v);} ,
        icon: Icon(Icons.arrow_drop_down , size:  30,),
        iconSize: 24,
        elevation: 16,
        style: Theme.of(context).textTheme.button?.copyWith( fontSize: 20),
        isExpanded: true,
        underline: SizedBox(),

        items: items
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}

