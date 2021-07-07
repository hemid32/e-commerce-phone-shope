import 'package:flutter/material.dart';
import 'package:phoneshop/constant.dart';

import 'container_messages.dart';
import 'heaser.dart';

class Body extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Header(),

          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                MessageAdmin(),
                MessageUser(),
              ],
            ),
          )

        ],
      ),
    );

  }
}

