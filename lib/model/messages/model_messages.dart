

import 'package:phoneshop/model/puy/shopping.dart';

class Message {

  final String type  ; //user or admin or order
  final String text ;  //
  final String uidUser ;
  final DateTime date ;
  final String uidOrder ;

  Message({this.type, this.text, this.uidUser , this.date , this.uidOrder});  //

  factory Message.fromJson(Map<String , dynamic> json ){
    return Message(
      text: json['text'] ,
      uidUser: json['uidUser'] ,
      type: json['type'] ,
      date:  json['date'] ,
      uidOrder: json['uidOrder']
    );
  }

  factory Message.fromJsonFireBas(Map<String , dynamic> json ){
    return Message(
      text: json['text'] ,
      uidUser: json['uidUser'] ,
      type: json['type'] ,
      date:  DateTime.fromMicrosecondsSinceEpoch(json['date'].microsecondsSinceEpoch), //DateTime.fromMillisecondsSinceEpoch(json['date'] * 1000) ,
      uidOrder: json['uidOrder']
    );
  }
  Map<String , dynamic> toMap(){
    return {
      'text' : text ,
      'uidUser' : uidUser ,
      'type' : type ,
      'date' : date ,
      'uidOrder' : uidOrder
    };
  }

}


class ListMessages {
  final List<Message> messages ;

  ListMessages({this.messages}) ;

  factory ListMessages.fromJson(Map<String , List<Message>> json){
    return ListMessages(
      messages : json['messages']
    ) ;
  }


}