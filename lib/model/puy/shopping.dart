

class ShoppingModelMethod {

  final String titleMethod ;
  final double price ;
  final List<String> wilayaSupport  ;

  ShoppingModelMethod({this.titleMethod, this.price, this.wilayaSupport});

  factory ShoppingModelMethod.fromJson(Map<String , dynamic> jsnData){
    return ShoppingModelMethod(
      titleMethod : jsnData['titleMethod'],
      price : jsnData['price'],
      wilayaSupport : jsnData['wilayaSupport'],
    ) ;
  }


}


class TotalShoppingMethod {
  final  List<ShoppingModelMethod> methods ;
  TotalShoppingMethod({this.methods});
  factory TotalShoppingMethod.fromJson(Map<String , List<ShoppingModelMethod> > jsnData){
    return TotalShoppingMethod(
        methods : jsnData['methods']
    ) ;
  }
}



// exemple
Map<String ,List<ShoppingModelMethod> >  t = {
  'methods': [
    ShoppingModelMethod.fromJson({
      'titleMethod' : 'yaliden' ,
      'price' : 200.0 ,
      'wilayaSupport' : ['elbayad' , 'elgeria']

    } ),
    ShoppingModelMethod.fromJson({
      'titleMethod' : 'frihali' ,
      'price' : 500.0 ,
      'wilayaSupport' : ['telamsan' , 'tiarrt']

    } ),
    ShoppingModelMethod.fromJson({
      'titleMethod' : 'bahri' ,
      'price' : 800.0 ,
      'wilayaSupport' : ['nama' , 'flastin']
    } ),

  ]
};

 List testMetod(){
  TotalShoppingMethod  listMethodTest = TotalShoppingMethod.fromJson(t) ;
  print('metods == ${listMethodTest.methods}') ;
  return listMethodTest.methods ;
}

