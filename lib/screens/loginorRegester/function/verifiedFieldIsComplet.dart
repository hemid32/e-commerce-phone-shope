


virifeidFormRegisterIsCompletallFormIsCompletedTrue(fullName ,  nombre , email , password , termCondition ){

  if(fullName == null && nombre == null && email == null && password == null && termCondition == true ){
    return true ;
  }else {
    return false ;
  }
}


virifeidFormRegisterIsCompletallFormIsCompletedNotVide(fullName ,  nombre , email , password , termCondition ){

  if(fullName != null && nombre != null && email != null && password != null && termCondition == true ){
    return true ;
  }else {
    return false ;
  }
}


