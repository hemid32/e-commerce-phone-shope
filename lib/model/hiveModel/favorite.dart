
import 'package:hive/hive.dart';
part 'favorite.g.dart';

@HiveType(typeId: 2)
class FavoriteHive {
  // id produit color
  FavoriteHive({ this.id});
  @HiveField(0)
  List<int> id ;
}


class ServisesFavoriteHive {

  final int id  ;

  ServisesFavoriteHive({this.id});

  addItemFavorite() async  {
    var box = await  Hive.openBox('FavoriteHive') ;
    List<int> oldList = await getItemFavorite() ;
    oldList.add(id) ;
     FavoriteHive  item = FavoriteHive()
    ..id = oldList  ;
    if(box.values.toList().isEmpty){
      box.add(item)
          .then((value) => print('add item etap1  $id to favorite  secsecuf'))
          .onError((error, stackTrace) => print('erur not add item $id erurr == $error')) ;
         }else{
      box.putAt(0 , item)
          .then((value) => print('add item  etap2 $id to favorite  secsecuf'))
          .onError((error, stackTrace) => print('erur not add item $id erurr == $error')) ;

    }
  }
  deletItemFavorite() async  {
    var box = await Hive.openBox('FavoriteHive') ;
    List<int> oldList = await getItemFavorite() ;
    oldList.remove(id) ;
    FavoriteHive  item = FavoriteHive()
      ..id = oldList  ;
    box.putAt(0,item)
        .then((value) => print('delet item $id secsecuf'))
        .onError((error, stackTrace) => print('erur not delet item $id == $error')) ;
  }
  Future<List<int>> getItemFavorite()async {
    try {
      //print('resutl from getItemFavorite === ******');

      var box2 = await Hive.openBox('FavoriteHive');
      //print('resutl from getItemFavorite === ===> ${box2.values.toList()}');

      List<int> result = box2.values.toList()[0].id;
      //print('resutl from getItemFavorite === $result');
      return result ?? [];
    }catch(e){
      return [] ;
    }
  }

}

