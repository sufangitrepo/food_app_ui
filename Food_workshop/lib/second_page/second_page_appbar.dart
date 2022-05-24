

import 'package:flutter/material.dart';

class SecondPageAppbar extends StatelessWidget implements PreferredSizeWidget{
  const SecondPageAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
    decoration: const BoxDecoration(
      color: Colors.white,
      boxShadow: [
        //BoxShadow(color: Colors.black12,offset: Offset(0, 3),blurRadius: 3,)
      ]
    ) ,
    child: Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(child: Padding(
          padding: const EdgeInsets.only(top: 28.0),
          child: InkWell(onTap: (){ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Drawer'),));},child: Icon(Icons.menu,color: Colors.black.withOpacity(.8),)),
        ),flex: 2,),
        Expanded(child: Center(child:  Padding(
          padding: const EdgeInsets.only(top: 25.0),
          child: Text('Home',style: Theme.of(context).textTheme.headline6!.copyWith(color: Colors.black87,fontSize: 18),),
        )),flex: 6,),
         Expanded(child: Padding(padding: EdgeInsets.only(top: 28),child: InkWell(onTap: (){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Drawer'),));
        },child: Icon(Icons.lock_open_outlined))),flex: 2,),
      ],),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size(double.maxFinite, kToolbarHeight);
}
