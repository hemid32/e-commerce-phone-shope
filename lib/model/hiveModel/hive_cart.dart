//import 'dart:io';

import 'package:hive/hive.dart';
//import 'package:phoneshop/model/cart/cart.dart';

//part 'hive_cart.g.dart';

@HiveType(typeId: 1)
class CartHive {
  CartHive({ this.modelCart});
  @HiveField(0)
   Map<String , dynamic>  modelCart;
  @override
  String toString() {
    return '$modelCart';
  }
}

