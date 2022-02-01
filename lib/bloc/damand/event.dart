import 'package:phoneshop/model/domand/model.dart';
import 'package:phoneshop/model/domand/servisec_domand.dart';

class EventDomands {
}


class EventSandDomand extends EventDomands {
  final DomandProduit domandData ;
  EventSandDomand({ required this.domandData});
  sand() async {
    SandDmndToFireBase _sands = SandDmndToFireBase(domandData) ;
    var  _result = await _sands.toFireBase() ;
    return _result ;
  }




}