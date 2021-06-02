import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:phoneshop/bloc/allProduitFilter/bloc.dart';
import 'package:phoneshop/bloc/allProduitFilter/event.dart';
import 'package:phoneshop/screens/allProduite/all_produit.dart';

class ItemsMenu extends StatelessWidget {
  const ItemsMenu({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ItemMenu(
            icon: 'assets/icons/icons8-apple-logo.svg',
            title: 'Alg',
          ),
          ItemMenu(
            icon: 'assets/icons/icons8-huawei-logo.svg',
            title: 'samsung',
          ),
          ItemMenu(
            icon: 'assets/icons/icons8-samsung.svg',
            title: 'Samsung',
          ),
          ItemMenu(
            icon: 'assets/icons/icons8-xiaomi.svg',
            title: 'Xiaomi',
          ),
          ItemMenu(
            icon: 'assets/icons/Huawei_Honor_Logo.svg',
            title: 'Honor',
          ),
          ItemMenu(
            icon: 'assets/icons/OPPO_Logo.svg',
            title: 'Oppo',
          ),
        ],
      ),
    );
  }
}

class ItemMenu extends StatelessWidget {
  const ItemMenu({
    Key key,
    this.icon,
    this.title,
  }) : super(key: key);
  final String icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              BlocProvider.of<BlocAllProduitFilter>(context).add(EventAllProduitTypeFhone(
                phoneType:  title,
              ));
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => BlocProvider.value(
                            value:
                                BlocProvider.of<BlocAllProduitFilter>(context),
                            child: AllProduit(),
                          )));
            },
            child: Container(
              height: 70,
              width: 70,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset(
                icon,
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(title,
              style: Theme.of(context)
                  .textTheme
                  .button
                  .copyWith(color: Colors.black.withOpacity(0.5)))
        ],
      ),
    );
  }
}
