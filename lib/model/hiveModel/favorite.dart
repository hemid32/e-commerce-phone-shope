
import 'package:hive/hive.dart';
part 'favorite.g.dart';




@HiveType(typeId: 2)
class FavoriteHiveNewModel {
  // id produit color
  FavoriteHiveNewModel({  this.favoretModelMap});
  @HiveField(0)
  Map<String , dynamic >? favoretModelMap ;
}
