import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/bloc/cartScreenManage/bloc.dart';
import 'package:phoneshop/bloc/cartScreenManage/event.dart';
import 'package:phoneshop/bloc/manageData/puy/bloc.dart';
import 'package:phoneshop/bloc/manageData/puy/event.dart';
import 'package:phoneshop/bloc/manageScreen/puy_screen/bloc.dart';
import 'package:phoneshop/bloc/manageScreen/puy_screen/events.dart';
import 'package:phoneshop/bloc/validatorTaxtField/bloc.dart';
import 'package:phoneshop/bloc/validatorTaxtField/event.dart';
import 'package:phoneshop/model/hiveModel/addres.dart';
import 'package:phoneshop/model/puy/address.dart';
import 'package:phoneshop/screens/screen_pay/componants/container_text_And_icon.dart';
import 'package:phoneshop/screens/screen_pay/componants/drop_dawen.dart';
import 'package:phoneshop/screens/screen_pay/componants/field_text.dart';
import 'package:phoneshop/screens/screen_pay/componants/footer_buttons.dart';
import 'package:phoneshop/screens/screen_pay/componants/title.dart';
import 'package:phoneshop/screens/screen_pay/functionValid/addressVerification.dart';
import 'package:toast/toast.dart';

class Addres extends StatelessWidget {
  Addres({
    Key key,
  }) : super(key: key);
  String _nome , _prenom , _nomberPhone , _email , _wilaya , _daira , _adress1 , _address2    ;
  bool _fine  ;
  int _codPostal  ;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BlocBuilder<ValidatorTexxtBlocString , dynamic> (
          builder: (_, state) {
            return FieldTextGet(title: 'Nome', onChange: (valur){
              BlocProvider.of<ValidatorTexxtBlocString>(context).add(TextFieldValidatorEventNome(valur: valur  , titleErurr: 'erurr Nome short')) ;
              _nome = valur;
              },validErurr: state ,  );
          }
        ) ,
         FieldTextGet(title: 'Prenome',onChange: (valur){
              _prenom = valur;},
        ) ,
        BlocBuilder<ValidatorTexxtBlocPhoneNombre , dynamic>(
          builder: (_, state) {
            return FieldTextGet(title: 'Nombre Phone',onChange: (valur){
              BlocProvider.of<ValidatorTexxtBlocPhoneNombre>(context).add(TextFieldValidatorEventPhoneNombre(valur: valur  , titleErurr: 'erurr from nombre')) ;

              _nomberPhone = valur;
              },validErurr: state , );
          }
        ) ,
        BlocBuilder<ValidatorTexxtBlocPhoneEmail , dynamic>(
          builder: (_, state) {
            return FieldTextGet(title: 'Email Adress',onChange: (valur){
              BlocProvider.of<ValidatorTexxtBlocPhoneEmail>(context).add(TextFieldValidatorEventPhoneEmail(valur: valur  , titleErurr: 'erurr email')) ;

              _email = valur;
            },validErurr: state ,);
          }
        ) ,
        //ContainerAndIconAndText_Seach(title: 'Search Your Adress', icon:  Icon(Icons.location_searching_sharp),),
        ContainerAndIconAndText_Seach(title: 'Shoise Your Adress', icon:  Icon(Icons.account_box),) ,
        TitleTextAligns(title:  'Wilaya',) ,
        DropDawen(valur: 'hemidi', items: ['hemidi' , 'benameur' , 'yyy'], onTap: (valeur){_wilaya = valeur ; },),
        FieldTextGet(title: 'Daira',onChange: (valur){  _daira = valur;}) ,
        FieldTextGet(title: 'adress',onChange: (valur){  _adress1 = valur;}) ,
        FieldTextGet(title: 'adress 2 ',onChange: (valur){  _address2 = valur;}) ,
        FieldTextGet(title: 'Cod Postal',onChange: (valur){  _codPostal = int.parse(valur);}) ,
        FooterButtons(titleButton1: 'Continu Shoping', titleButton2: 'Save Address', onTapButton1: () async  {

          var  addres = verificationFormAddressIsCompleted(
              BlocProvider.of<ValidatorTexxtBlocString>(context).state ,
              BlocProvider.of<ValidatorTexxtBlocPhoneNombre>(context).state ,
              BlocProvider.of<ValidatorTexxtBlocPhoneEmail>(context).state ,
              _nome ,_prenom ,  _nomberPhone , _email
              , _wilaya , _adress1 , _address2 , _daira , _codPostal) ;

          if(addres != null){
              //print('completed*************************************') ;
              BlocProvider.of<BlocListDataCart>(context).add(EventShowList()) ;
              BlocProvider.of<AdressDataBloc>(context).add(AddAdressData(addres)) ;
              BlocProvider.of<PuyScreenBloc>(context).add(ContinuShopping()) ;
          }else {
            //print('nooot cpmleted ############################') ;
            Toast.show("Error . Incomplete fields", context, duration: 5, gravity:  Toast.BOTTOM);

          }

        }, onTapButton2: () async {
          var  addresSaved = verificationFormAddressIsCompleted(
              BlocProvider.of<ValidatorTexxtBlocString>(context).state ,
              BlocProvider.of<ValidatorTexxtBlocPhoneNombre>(context).state ,
              BlocProvider.of<ValidatorTexxtBlocPhoneEmail>(context).state ,
              _nome ,_prenom ,  _nomberPhone , _email
              , _wilaya , _adress1 , _address2 , _daira , _codPostal) ;
          if(addresSaved != null ){
            ServisesAdressHive adress = ServisesAdressHive(address: addresSaved) ;
            var _save =await adress.saveNewAddress() ;
            if(_save == true){
              Toast.show("Saved address successful", context, duration: 5, gravity:  Toast.BOTTOM);
            }else {
              Toast.show("${_save.message}", context, duration: 5, gravity:  Toast.BOTTOM);

            }

          }else {
            Toast.show("Error . Incomplete fields", context, duration: 5, gravity:  Toast.BOTTOM);
          }


        },)

      ],
    );
  }
}

