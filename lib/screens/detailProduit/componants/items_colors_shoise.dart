import 'package:flutter/material.dart';

import 'smail_image_shois_color.dart';

class ItemsColorShoise extends StatelessWidget {
  const ItemsColorShoise({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          SmailImageShoiColor(image:'assets/images/497-4975081_samsung-galaxy-a70-2020-hd-png-download.png',),
          SmailImageShoiColor(image:'assets/images/iphone-x-samsung-galaxy-s8-iphone-7-smartphone-png-favpng-7ke4DBbj5kLrbQftMD6XuN56h.jpg',),
          SmailImageShoiColor(image:'assets/images/poco.png',),
          SmailImageShoiColor(image:'assets/images/iphone-x-samsung-galaxy-s8-iphone-7-smartphone-png-favpng-7ke4DBbj5kLrbQftMD6XuN56h.jpg',),
          SmailImageShoiColor(image:'assets/images/samsung-galaxy-s10-png-image.jpg',),
        ],
      ),
    );
  }
}

