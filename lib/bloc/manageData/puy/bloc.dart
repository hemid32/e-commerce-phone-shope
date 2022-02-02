import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/bloc/manageData/puy/event.dart';
import 'package:phoneshop/model/puy/address.dart';
import 'package:phoneshop/model/puy/shopping_method_is_shoi.dart';

class AdressDataBloc extends Bloc<AddAdressData, ModelAdress> {
  /// {@macro counter_bloc}
  AdressDataBloc()
      : super(ModelAdress(
            nome: 'nome',
            prenome: 'prenome',
            nomberPhone: 'nomberPhone',
            email: 'email',
            wilaya: 'wilaya',
            daira: 'daira',
            adress1: 'adress1',
            address2: 'address2',
            codPostal: 0000,
            id: 'id')){

    on<AddAdressData>(_adress) ;
  }

  void _adress(AddAdressData event  , Emitter<ModelAdress> emit){
    emit(event.adress) ;
  }

}

class ShoppingDataBloc extends Bloc<AddShoppingData, MethodShoppingShoi> {
  /// {@macro counter_bloc}
  ShoppingDataBloc() : super(MethodShoppingShoi()){

    on<AddShoppingData>(_adShop) ;

  }
  void _adShop(AddShoppingData event  , Emitter<MethodShoppingShoi> emit){
    emit(event.methodShopping) ;
  }

}


