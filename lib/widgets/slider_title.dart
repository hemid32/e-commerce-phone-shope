import 'package:flutter/material.dart';


class SlideContainer extends StatelessWidget {
  const SlideContainer({
    Key key, this.title, this.min, this.max, this.value, this.divisions, this.label, this.onChange,
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
          Text('$title : $label DZ' , style: Theme.of(context).textTheme.button.copyWith(color: Colors.black.withOpacity(0.4) , fontSize: 15),  ) ,
          Slider(
            value: value,
            min: min,
            max: max,
            divisions: divisions,
            label: label,
            onChanged: onChange,
          )
        ],
      ),
    );
  }
}

