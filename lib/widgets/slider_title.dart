import 'package:flutter/material.dart';
import 'package:phoneshop/constant.dart';


class SlideContainer extends StatelessWidget {
  const SlideContainer({
    Key? key,required this.title,required this.min,required this.max,
    required this.value,
    required this.divisions,
    required this.label,
    required this.onChange,
  }) : super(key: key);
  final String title ;
  final double min ;
  final double max ;
  final double value ;
  final int divisions ;
  final String label ;
  final Function onChange ;


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('$title : $label ' , style: Theme.of(context).textTheme.button?.copyWith(color: Colors.black.withOpacity(0.4) , fontSize: 15),  ) ,
          Slider(
            inactiveColor: kPrimaryColor.withOpacity(0.15),
            activeColor: kPrimaryColor,
            value: value,
            min: min,
            max: max,
            divisions: divisions,
            label: label,
            onChanged: (v){onChange(v);},
          )
        ],
      ),
    );
  }
}

