import 'package:flutter/material.dart';
class DropDawen extends StatelessWidget {
  const DropDawen({
    Key key, this.valur, this.onTap, this.items,
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
        onChanged: onTap ,
        icon: Icon(Icons.arrow_drop_down , size:  30,),
        iconSize: 24,
        elevation: 16,
        style: Theme.of(context).textTheme.button.copyWith( fontSize: 20),
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

