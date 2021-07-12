import 'package:phoneshop/model/messages/model_messages.dart';

class EventGetMessages {}

class EventGetMessagesFromFire extends EventGetMessages {

  final  eventData ;

  EventGetMessagesFromFire({this.eventData});


  getMessages(){
    print('eventData==== $eventData}') ;
    List<Message> _msg  = [] ;
    eventData.docs.forEach((element) {
      //print('element.data() == ${element.data()}') ;
      _msg.add(Message.fromJsonFireBas(element.data())) ;
    });
    return _msg ;

  }




}
