import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/bloc/manageAddress/state.dart';
import 'package:phoneshop/model/hiveModel/addres.dart';
import 'package:phoneshop/model/puy/address.dart';

class BlocManageAddress extends Cubit<StateManageAddress>{
  BlocManageAddress() : super(InitStateManageAdress()) ;


  static BlocManageAddress get(context)=> BlocProvider.of(context) ;


  List<ModelAdress> listAdderss = [] ;


  getAllAdress() async  {
    ServisesAdressHive servisesAdressHive = ServisesAdressHive() ;
    listAdderss = await  servisesAdressHive.getAddress() ;
    emit(StateManageAdressGetAllAddress()) ;
  }


  editAddres(ModelAdress address) async  {
    try {
      ServisesAdressHive servisesAdressHive = ServisesAdressHive(
          address: address);
      servisesAdressHive.saveNewAddress();
      emit(StateManageAdressEditeAddress()) ;
    }catch(e){
      emit(StateManageAdressHundleError(error: e.toString())) ;
    }
  }

  deletAddress(String id ) async {
    var result = await ServisesAdressHive.deletAddress(id) ;
    if(result){
      emit(StateManageAdressDeletAddress()) ;
      getAllAdress() ;
    }else{
      emit(StateManageAdressHundleError(error: result.toString())) ;
    }
  }



}