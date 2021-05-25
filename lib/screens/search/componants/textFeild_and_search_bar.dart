import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FieldTextAndIconSearch extends StatelessWidget {
  const FieldTextAndIconSearch({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40 , left: 10 , right:  10 ),
      child: Row(
        children: [
          SvgPicture.asset(
            'assets/icons/search.svg',width: 25,
          ),
          Expanded(
            flex: 5,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              padding: EdgeInsets.symmetric(horizontal: 10),
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black.withOpacity(0.04)
              ),
              child: TextFormField(
                autofocus: true,
                decoration: InputDecoration(
                    hintText: 'Search produit' ,
                    hintStyle: Theme.of(context).textTheme.button.copyWith(
                        color: Colors.black.withOpacity(0.23)
                    )

                ),
              ),
            ),

          ) ,
          Expanded(
              child: GestureDetector(
                onTap: ()=> Navigator.pop(context),
                child: Icon(Icons.arrow_forward_ios , size:  30, color: Colors.black.withOpacity(0.4),
                ),
              ))

        ],
      ),
    );
  }
}
