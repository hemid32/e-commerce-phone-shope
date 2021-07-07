

import 'package:flutter/material.dart';
import 'package:phoneshop/constant.dart';

import 'container_messages.dart';
import 'heaser.dart';

class Body extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size ;
    return SingleChildScrollView(
      child: Column(
        children: [
          Header(),
          SizedBox(
            height: size.height *0.8,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    MessageAdmin(),
                    MessageUser(),
                    MessageAdmin(),
                    MessageUser(),
                    MessageAdmin(),
                    MessageUser(),
                    MessageAdmin(),
                    MessageUser(),
                    MessageAdmin(),
                    MessageUser(),
                    MessageAdmin(),
                    MessageUser(),
                    MessageAdmin(),
                    MessageUser(),
                    MessageAdmin(),
                    MessageUser(),
                    MessageAdmin(),
                    MessageUser(),
                    MessageAdmin(),
                    MessageUser(),
                    MessageAdmin(),
                    MessageUser(),
                  ],
                ),
              ),
            ),
          ),

          Container(
            margin: EdgeInsets.symmetric(horizontal: 20 ),
            padding: EdgeInsets.only(left: 10),
            height: 50,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20) , 
              color: kPrimaryColor.withOpacity(0.1)
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      border:InputBorder.none ,
                      hintText: 'Create message here .... '

                    ),

                  ),

                ),
                //Icon(Icons.email) ,
                Container(
                  height: double.infinity,
                  child: MaterialButton(onPressed: (){} ,

                  child: Icon(Icons.send , color: Colors.white,),
                    color: kPrimaryColor,
                  ),
                )

              ],
            ),
          )



        ],
      ),
    );

  }
}

