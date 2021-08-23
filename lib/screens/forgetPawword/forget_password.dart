import 'package:flutter/material.dart';

import 'componants/body.dart';

class ForgetPassword extends StatelessWidget {
  final String email ;
  const ForgetPassword({Key key, this.email}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(emails: email,),
    );
  }
}
