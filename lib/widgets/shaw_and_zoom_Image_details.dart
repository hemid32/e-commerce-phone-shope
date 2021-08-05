import 'package:flutter/material.dart';

class ImageViews extends StatelessWidget {
  final image ;
  const ImageViews({Key key, this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          GestureDetector(
            onTap: ()=> Navigator.pop(context),
            child: Container(
              margin: EdgeInsets.only(top: 40 , left: 20 , right:  20),
              child: Row(
                children: [
                  Icon(Icons.close , color: Colors.black.withOpacity(0.6), size: 30,)
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: Center(
                child: InteractiveViewer(
                    minScale: 0.1,
                    maxScale: 3,
                    child: Image.network(image)
                ),
              ),
            ),
          ),
        ],
      ),

    );

  }
}
