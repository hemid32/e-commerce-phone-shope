

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/bloc/getMessageq/bloc.dart';
import 'package:phoneshop/bloc/getMessageq/events.dart';
import 'package:phoneshop/constant.dart';
import 'package:phoneshop/model/getModelFirebase/getMessages/getMessage.dart';
import 'package:phoneshop/model/getModelFirebase/getUser/modelUserGet.dart';
import 'package:phoneshop/model/messages/model_messages.dart';
import 'package:phoneshop/model/messages/services_messages.dart';
import 'container_messages.dart';
import 'heaser.dart';

class Body extends StatelessWidget {

  GetMessages getMsg =   GetMessages() ;
  GetUserFireBase getUser = GetUserFireBase() ;




  @override
  Widget build(BuildContext context) {
    String _textMessage ;
    Size size = MediaQuery.of(context).size ;
    return SingleChildScrollView(
      reverse: true,
      child: Column(
        children: [
          Header(),
          SizedBox(
            height: size.height *0.8,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: FutureBuilder(
                future: getUser.getDocUserFromFirebase() ,
                builder: (context, nan) {
                  print('uid ==== ${nan.data}') ;
                  return !nan.hasData ? Container() :   SingleChildScrollView(
                    child: StreamBuilder(
                      stream: FirebaseFirestore.instance.collection('users').doc(nan.data).collection('Chats').orderBy('date', descending: false).snapshots(),
                      builder: (context, snapshotEventNew ) {
                        print('snapshotEventNew.data ==== ${snapshotEventNew.data}')  ;
                        if(snapshotEventNew.hasData ){
                          BlocProvider.of<BlocMassegersGet>(context).add(EventGetMessagesFromFire(
                            eventData: snapshotEventNew.data ,
                          )) ;
                        }

                        //print(snapshotEventNew.data)  ;
                        return BlocBuilder<BlocMassegersGet ,  List<Message>>(
                          builder: (context, snapshot) {
                            print('getMsg.getMesag() === $snapshot') ;
                            return Column(
                              children: [
                                for(var i = 0 ; i< snapshot.length ; i++ )
                                  buildMessages(snapshot[i]) ,
                                  //Container(child: Text(snapshot.data.toString()),)
                              ],
                            );
                          }
                        );
                      }
                    ),
                  );
                }
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
                    onChanged: (text){
                      _textMessage = text ;
                    },
                    decoration: InputDecoration(
                      border:InputBorder.none ,
                      hintText: 'Create message here .... '

                    ),

                  ),

                ),
                //Icon(Icons.email) ,
                Container(
                  height: double.infinity,
                  child: MaterialButton(
                    onPressed: () async  {
                      //BlocProvider.of<BlocMassegersGet>(context).add(EventGetMessagesFromFire()) ;

                      var mesg = Message(
                          type : 'user' , text : _textMessage , uidUser :  FirebaseAuth.instance.currentUser.uid ,
                         date: DateTime.now()
                      ) ;
                      var save  = ServesicesImage(
                          mesgae: mesg
                      ) ;
                      await save.saveToFireBase() ;
                       //getMsg.getMesag();
                  } ,

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

  Widget buildMessages(Message message){
    if(message.type == 'admin'){
      return  MessageAdmin(
          text:  message.text,
      );
    }else {
      return  MessageUser(
            text: message.text,
      );
    }


  }
}

