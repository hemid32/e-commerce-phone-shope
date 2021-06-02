import 'package:phoneshop/model/cart/cart.dart';
import 'package:phoneshop/model/cart/services.dart';

class EventBlocDataCart {}


class EventShowList extends EventBlocDataCart {

  showList() async  {
    List<ModelCart> models = await  getListModelCart() ;
    return models ;
  }
}

class EventDeletItemFromCart extends EventBlocDataCart {
  final int  indexItem ;

  EventDeletItemFromCart(this.indexItem);

  deleted() async  {
    await deleItemFromCart(indexItem);
    List<ModelCart> models = await  getListModelCart() ;
    print('length list ModelCart after deleted == ${models.length} ') ;
    return models ;
  }
}