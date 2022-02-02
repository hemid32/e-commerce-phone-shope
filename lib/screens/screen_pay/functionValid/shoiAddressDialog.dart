import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/bloc/cartScreenManage/bloc.dart';
import 'package:phoneshop/bloc/cartScreenManage/event.dart';
import 'package:phoneshop/bloc/manageData/puy/bloc.dart';
import 'package:phoneshop/bloc/manageData/puy/event.dart';
import 'package:phoneshop/bloc/manageScreen/addressShoiRadio/bloc.dart';
import 'package:phoneshop/bloc/manageScreen/addressShoiRadio/event.dart';
import 'package:phoneshop/bloc/manageScreen/puy_screen/bloc.dart';
import 'package:phoneshop/bloc/manageScreen/puy_screen/events.dart';
import 'package:phoneshop/constant.dart';
import 'package:phoneshop/model/hiveModel/addres.dart';
import 'package:phoneshop/model/puy/address.dart';
import 'package:phoneshop/screens/screen_pay/componants/expanded_address_list.dart';

Future<void> showMyDialogShoiAddress(contextOriginal) async {
  ServisesAdressHive _addressServises = ServisesAdressHive();

   String? _index;

  return showDialog(
      //rootNavigator:true ,
      useRootNavigator: true,
      context: contextOriginal,
      builder: (contextDialog) {
        return BlocProvider(
          create: (BuildContext context) => AddressBlocRadio(),
          child: Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0))),
            child: FutureBuilder<List<ModelAdress>>(
                future: _addressServises.getAddress(),
                builder: (_, snapshot) {
                  return snapshot.hasData
                      ? SingleChildScrollView(
                          child: Column(
                            children: [
                              Center(
                                child: Container(
                                    margin: EdgeInsets.all(10),
                                    child: Text(
                                      'Choose your address',
                                      style: Theme.of(contextOriginal)
                                          .textTheme
                                          .button
                                          ?.copyWith(

                                              fontSize: 20),
                                    )),
                              ),
                              for (var i = 0; i < snapshot.data!.length; i++)
                                BlocBuilder<AddressBlocRadio, dynamic>(
                                    builder: (context, state) {
                                     // print('state =$state') ;
                                  return ExpandedColumnAddesses(
                                    address: snapshot.data![i],
                                    valure: i.toString(),
                                    groub: state,
                                    onChanged: (value) {
                                      _index = value ;
                                      BlocProvider.of<AddressBlocRadio>(context)
                                          .add(EvenstRadioAddres(value));
                                    },
                                  );
                                }),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  children: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(contextOriginal) ;
                                          if(_index != null ) {
                                            ModelAdress addres =
                                            snapshot.data![int.parse(_index!)];
                                            BlocProvider.of<BlocListDataCart>(
                                                contextOriginal).add(
                                                EventShowList());
                                            BlocProvider.of<AdressDataBloc>(
                                                contextOriginal).add(
                                                AddAdressData(addres));
                                            BlocProvider.of<PuyScreenBloc>(
                                                contextOriginal).add(
                                                ContinuShopping());
                                          }
                                          //print(addres.codPostal);
                                        },
                                        child: Text(
                                          'ok',
                                          style: Theme.of(contextOriginal)
                                              .textTheme
                                              .button
                                              ?.copyWith(
                                                color: kPrimaryColor,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        )),
                                    Spacer(),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(contextOriginal);
                                        },
                                        child: Text('cancel',
                                            style: Theme.of(contextOriginal)
                                                .textTheme
                                                .button
                                                ?.copyWith(
                                                  color: kPrimaryColor,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                )))
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      : Container();
                }),
          ),
        );
      });
}
