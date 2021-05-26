abstract class EventsTextFeild{

}

class TextFieldValidatorEventNome extends EventsTextFeild {
  final String valur ;
  final String titleErurr ;
  TextFieldValidatorEventNome({this.valur , this.titleErurr});
  validator(){
    //print('length ==== ${this.valur.length}') ;
    if(this.valur.length  < 5 ){
      return this.titleErurr ;
    }
    else
      return null ;
  }
}

class TextFieldValidatorEventPhoneNombre extends EventsTextFeild {
  final String valur ;
  final String titleErurr ;
  TextFieldValidatorEventPhoneNombre({this.valur , this.titleErurr});
  validator(){
    //print('length ==== ${this.valur.length}') ;
    if(this.valur.length  < 10 || !isNumeric(this.valur) ){
      return this.titleErurr ;
    }
    else
      return null ;
  }

  bool isNumeric(String s) {
    if(s == null) {
      return false;
    }
    return double.parse(s, (e) => null) != null;
  }
}


class TextFieldValidatorEventPhoneEmail extends EventsTextFeild {
  final String valur ;
  final String titleErurr ;
  TextFieldValidatorEventPhoneEmail({this.valur , this.titleErurr});
  validator(){
    //print('length ==== ${this.valur.length}') ;
    if( !this.valur.contains('@') ){
      return this.titleErurr ;
    }
    else
      return null ;
  }


}
