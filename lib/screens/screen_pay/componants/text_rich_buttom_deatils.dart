import 'package:flutter/material.dart';
class TextRichTitleDetails extends StatelessWidget {
  const TextRichTitleDetails({
    Key key, this.title, this.detail,
  }) : super(key: key);
  final String title  ;
  final String detail ;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20 , vertical:  20 ),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
            children: [
              TextSpan(text: '$title \n ' , style: Theme.of(context).textTheme.button.copyWith(fontSize: 18 , fontWeight: FontWeight.bold)),
              TextSpan(text: '$detail  ' ,
                  style: Theme.of(context).textTheme.button.copyWith(fontSize: 12)
              ),
            ]
        ),
      ),
    );
  }
}

