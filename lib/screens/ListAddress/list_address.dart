import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/bloc/manageAddress/bloc.dart';
import 'package:phoneshop/constant.dart';
import 'package:phoneshop/screens/ListAddress/widgets/formAddNewAddress/form_add_new_address.dart';

import 'componants/body.dart';

class ListAddress extends StatelessWidget {
  const ListAddress({Key  key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=> BlocManageAddress(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: kPrimaryColor,
            ),
            body: Body(),

          floatingActionButton: FloatingActionButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (_)=> BlocProvider.value(
                  value: BlocManageAddress.get(context),
                  child: FormAddNewAddress())));
            },
            child: Icon(Icons.add),
          ),
          );
        }
      ),

    );
  }
}
