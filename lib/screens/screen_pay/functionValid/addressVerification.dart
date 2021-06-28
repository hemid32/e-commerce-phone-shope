



import 'package:phoneshop/model/getModelFirebase/getUser/modelUserGet.dart';
import 'package:phoneshop/model/puy/address.dart';

ModelAdress verificationFormAddressIsCompleted(stateNome , statePhone , stateEmain , nome ,prenom ,  phone , email
    , wilaya , address1 , address2 , daira , codPost    ){
  ModelAdress  addresComplete ;

  if(stateEmain != null || stateNome != null || statePhone != null ||

  wilaya == null || address1 == null  || address2 == null || codPost == null
  ){
    return null  ;
  }else {

    addresComplete = ModelAdress.fromJson({
      'nome': nome  ,
      'prenome':  prenom ,
      'nomberPhone': phone ,
      'address2': address2 ,
      'adress1': address1 ,
      'codPostal': codPost ,
      'wilaya': wilaya ,
      'daira': daira ,
      'email':email ,
      'fine': true

    }) ;
    return addresComplete ;
  }

}

/*

Future<bool>  verificationNombrePhoneIsConfermed(String nombre ) async  {
  var _userDate = await userDataFireBase.getUser() ;
  String nompreUser = _userDate.nombrePhon ;

  if(_codConteryDeleted(nombre) == _codConteryDeleted(nompreUser)     ){
    return true ;
  }else {
    return false ;
  }
}

_codConteryDeleted( String  nombre){
  if(nombre.contains('+213')){
    String nmdrNew = '0'+nombre.substring(4) ;
    return nmdrNew ;
  }else{
    return nombre ;
  }
}
 */