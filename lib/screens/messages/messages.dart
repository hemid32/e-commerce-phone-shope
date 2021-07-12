import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/bloc/getMessageq/bloc.dart';

import 'componants/body.dart';

class Messages extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BlocMessagesActiveDate>(
            create: (BuildContext context) => BlocMessagesActiveDate()
        )
      ],
      child: Scaffold(
        body: Body(),


      ),
    );
  }
}
