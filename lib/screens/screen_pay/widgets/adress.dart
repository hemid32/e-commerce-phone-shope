import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/bloc/manageData/puy/bloc.dart';
import 'package:phoneshop/bloc/manageData/puy/event.dart';
import 'package:phoneshop/bloc/manageScreen/puy_screen/bloc.dart';
import 'package:phoneshop/bloc/manageScreen/puy_screen/events.dart';
import 'package:phoneshop/bloc/validatorTaxtField/bloc.dart';
import 'package:phoneshop/bloc/validatorTaxtField/event.dart';
import 'package:phoneshop/model/puy/address.dart';
import 'package:phoneshop/screens/screen_pay/componants/container_text_And_icon.dart';
import 'package:phoneshop/screens/screen_pay/componants/drop_dawen.dart';
import 'package:phoneshop/screens/screen_pay/componants/field_text.dart';
import 'package:phoneshop/screens/screen_pay/componants/footer_buttons.dart';
import 'package:phoneshop/screens/screen_pay/componants/title.dart';

class Addres extends StatelessWidget {
  Addres({
    Key key,
  }) : super(key: key);

  String nome , prenome , nomberPhone , email , wilaya , daira , adress1 , address2    ;
  bool fine  ;
  int codPostal  ;





  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BlocBuilder<ValidatorTexxtBlocString , dynamic> (
          builder: (context, state) {
            return FieldTextGet(title: 'Nome', onChange: (valur){
              BlocProvider.of<ValidatorTexxtBlocString>(context).add(TextFieldValidatorEventNome(valur: valur  , titleErurr: 'erurr Nome short')) ;

              nome = valur;

              },validErurr: state ,  );
          }
        ) ,
        FieldTextGet(title: 'Prenome',onChange: (valur){  prenome = valur;}) ,
        FieldTextGet(title: 'Nombre Phone',onChange: (valur){  nomberPhone = valur;}) ,
        FieldTextGet(title: 'Email Adress',) ,
        ContainerAndIconAndText_Seach(title: 'Search Your Adress', icon:  Icon(Icons.location_searching_sharp),),
        ContainerAndIconAndText_Seach(title: 'Shoise Your Adress', icon:  Icon(Icons.account_box),) ,
        TitleTextAligns(title:  'Wilaya',) ,
        DropDawen(valur: 'hemidi', items: ['hemidi' , 'benameur' , 'yyy'], onTap: (valeur){wilaya = valeur ; },),
        FieldTextGet(title: 'Daira',onChange: (valur){  daira = valur;}) ,
        FieldTextGet(title: 'adress',onChange: (valur){  adress1 = valur;}) ,
        FieldTextGet(title: 'adress 2 ',onChange: (valur){  address2 = valur;}) ,
        FieldTextGet(title: 'Cod Postal',onChange: (valur){  codPostal = int.parse(valur);}) ,
        FooterButtons(titleButton1: 'Continu Shoping', titleButton2: 'Save Address', onTapButton1: (){

          ModelAdress  addres = ModelAdress.fromJson({
            'nome': nome  ,
            'prenome':  prenome ,
            'nomberPhone': nomberPhone ,
            'address2': address2 ,
            'adress1': adress1 ,
            'codPostal': codPostal ,
            'wilaya': wilaya ,
            'daira': daira ,
            'email':email ,
            'fine': true

          }) ;
          BlocProvider.of<AdressDataBloc>(context).add(AddAdressData(addres)) ;

          BlocProvider.of<PuyScreenBloc>(context).add(ContinuShopping()) ;

        }, onTapButton2: (){},)

      ],
    );
  }
}

