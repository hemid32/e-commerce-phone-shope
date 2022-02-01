import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:phoneshop/bloc/search/bloc.dart';
import 'package:phoneshop/bloc/search/event.dart';






class FieldTextAndIconSearch extends StatelessWidget {
  const FieldTextAndIconSearch({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40 , left: 10 , right:  10 ),
      child: Row(
        children: [
          Hero(
            tag: 'search',
            child: SvgPicture.asset(
              'assets/icons/search.svg',width: 25,
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              padding: EdgeInsets.symmetric(horizontal: 10),
              height: 45,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).buttonColor
              ),
              child: TextFormField(
                onChanged: (text){
                  BlocProvider.of<BlocEventSearch>(context).add(EventListSearch(text));
                },
                autofocus: true,
                decoration: InputDecoration(
                    hintText: 'Search produit' ,
                    hintStyle:
                    Theme.of(context).textTheme.button?.copyWith(
                    ) ,
                  border: InputBorder.none
                ),
              ),
            ),
          ) ,
          Expanded(
              child: GestureDetector(
                onTap: ()=> Navigator.pop(context),
                child: Icon(Icons.close
                ),
              )
          )

        ],
      ),
    );
  }
}
