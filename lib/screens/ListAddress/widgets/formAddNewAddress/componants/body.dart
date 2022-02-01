import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/bloc/manageAddress/bloc.dart';
import 'package:phoneshop/bloc/ropDowenWilayat/bloc.dart';
import 'package:phoneshop/bloc/ropDowenWilayat/event.dart';
import 'package:phoneshop/bloc/validatorTaxtField/bloc.dart';
import 'package:phoneshop/bloc/validatorTaxtField/event.dart';
import 'package:phoneshop/model/hiveModel/addres.dart';
import 'package:phoneshop/oitil/wilayat.dart';
import 'package:phoneshop/screens/screen_pay/componants/button_costom_wight_infinty.dart';
import 'package:phoneshop/screens/screen_pay/componants/drop_dawen.dart';
import 'package:phoneshop/screens/screen_pay/componants/field_text.dart';
import 'package:phoneshop/screens/screen_pay/componants/title.dart';
import 'package:phoneshop/screens/screen_pay/functionValid/addressVerification.dart';
import 'package:toast/toast.dart';

class Body extends StatelessWidget {
   Body({Key? key}) : super(key: key);




  late String _nome , _prenom , _nomberPhone , _email , _wilaya = 'El Bayadh' , _daira , _adress1 , _address2    ;
  late int _codPostal  ;


  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Column(
        children: [
          BlocBuilder<ValidatorTexxtBlocString , dynamic> (
              builder: (_, state) {
                return FieldTextGet(title: 'Nome', onChange: (valur){
                  BlocProvider.of<ValidatorTexxtBlocString>(context).add(TextFieldValidatorEventNome(valur: valur  , titleErurr: 'erurr Nome short')) ;
                  _nome = valur;
                },validErurr: state , textInputeType: TextInputType.name,
                );
              }
          ) ,
          FieldTextGet(title: 'Prenome',onChange: (valur){
            _prenom = valur;},              textInputeType: TextInputType.name,

          ) ,
          BlocBuilder<ValidatorTexxtBlocPhoneNombre , dynamic>(
              builder: (_, state) {
                return FieldTextGet(title: 'Nombre Phone',onChange: (valur){
                  BlocProvider.of<ValidatorTexxtBlocPhoneNombre>(context).add(TextFieldValidatorEventPhoneNombre(valur: valur  , titleErurr: 'erurr from nombre')) ;

                  _nomberPhone = valur;
                },validErurr: state , textInputeType: TextInputType.phone);
              }
          ) ,
          BlocBuilder<ValidatorTexxtBlocPhoneEmail , dynamic>(
              builder: (_, state) {
                return FieldTextGet(title: 'Email Adress',onChange: (valur){
                  BlocProvider.of<ValidatorTexxtBlocPhoneEmail>(context).add(TextFieldValidatorEventPhoneEmail(valur: valur.toString().trim()  , titleErurr: 'erurr email')) ;

                  _email = valur;
                },validErurr: state ,  textInputeType: TextInputType.emailAddress,
                );
              }
          ) ,
          TitleTextAligns(title:  'Wilaya',) ,


          BlocBuilder<BlocDropDowenWilayat , String >(
              builder: (context, state) {
                return Container(
                  color: Theme.of(context).accentColor,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: DropDawen(valur: state, items: getListWilayat(), onTap: (valeur){

                    _wilaya = valeur ;
                    BlocProvider.of<BlocDropDowenWilayat>(context).add(EveneDropDowenValue(
                        valeur
                    )) ;

                  },),
                );
              }
          ),



          FieldTextGet(title: 'Daira',onChange: (valur){  _daira = valur;}, textInputeType: TextInputType.text) ,
          FieldTextGet(title: 'adress',onChange: (valur){  _adress1 = valur;},textInputeType: TextInputType.text) ,
          FieldTextGet(title: 'adress 2 ',onChange: (valur){  _address2 = valur;},textInputeType: TextInputType.text) ,
          FieldTextGet(title: 'Cod Postal',onChange: (valur){  _codPostal = int.parse(valur);},textInputeType: TextInputType.number) ,
          ButtonCostomWithInfiniti(
            title: 'save',
            onTap: ()async  {
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
                  BlocManageAddress.get(context).getAllAdress() ;
                  Navigator.pop(context) ;

                  Toast.show("Saved address successful", context, duration: 5, gravity:  Toast.BOTTOM);
                }else {
                  Toast.show("${_save.message}", context, duration: 5, gravity:  Toast.BOTTOM);

                }

              }else {
                Toast.show("Error . Incomplete fields", context, duration: 5, gravity:  Toast.BOTTOM);
              }

            }
          ,)


        ],
      ),
    );

  }
}
