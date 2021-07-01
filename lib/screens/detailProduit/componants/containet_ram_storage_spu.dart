import 'package:flutter/material.dart';

class ContainerRamStockagColors extends StatelessWidget {
  const ContainerRamStockagColors({
    Key key, this.ram, this.stockag, this.spu, this.camera,
  }) : super(key: key);
  final int ram ;
  final int   stockag ;
  final String spu ;
  final  int camera ;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      padding: EdgeInsets.symmetric(horizontal: 20 , vertical: 10),
      width: double.infinity,
      //height: 60,
      decoration: BoxDecoration(
          color: Colors.white ,
          borderRadius: BorderRadius.circular(20) ,
          border:Border.all(color: Colors.black.withOpacity(0.13)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1) ,
              blurRadius: 10 ,
              offset: Offset(0,10) ,

            )
          ]

      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              Icon(Icons.aspect_ratio, color: Colors.black.withOpacity(0.3),) ,
              Text('SPU' ,  style: Theme.of(context).textTheme.button.copyWith(
                  color: Colors.black.withOpacity(0.4)
              ),) ,
              Text('$spu' , style:  Theme.of(context).textTheme.button.copyWith(color: Colors.black.withOpacity(0.6)),)
            ],
          ) ,
          Container(
            height:  40,
            width:  1,
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(.2)
            ),
          ),
          Column(
            children: [
              Icon(Icons.filter_frames_outlined, color: Colors.black.withOpacity(0.3),) ,
              Text('RAM' ,  style: Theme.of(context).textTheme.button.copyWith(
                color: Colors.black.withOpacity(0.4)
              ),) ,
              Text('$ram GB' , style:  Theme.of(context).textTheme.button.copyWith(color: Colors.black.withOpacity(0.6)),)
            ],
          ),
          Container(
            height:  40,
            width:  1,
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(.2)
            ),
          ),
          Column(
            children: [
              Icon(Icons.storage, color: Colors.black.withOpacity(0.3),) ,
              Text('Storage' ,  style: Theme.of(context).textTheme.button.copyWith(
                  color: Colors.black.withOpacity(0.4)
              ),) ,
              Text('$stockag GB' , style:  Theme.of(context).textTheme.button.copyWith(color: Colors.black.withOpacity(0.6)),)
            ],
          ),
          Container(
            height:  40,
            width:  1,
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(.2)
            ),
          ),
          Column(
            children: [
              Icon(Icons.camera , color: Colors.black.withOpacity(0.3),) ,
              Text('Camera' ,  style: Theme.of(context).textTheme.button.copyWith(
                  color: Colors.black.withOpacity(0.4)
              ),) ,
              Text('$camera MP' , style:  Theme.of(context).textTheme.button.copyWith(color: Colors.black.withOpacity(0.6)),)
            ],
          ),
        ],
      ),
    );
  }
}

