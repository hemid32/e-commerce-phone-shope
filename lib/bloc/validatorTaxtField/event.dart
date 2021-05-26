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
