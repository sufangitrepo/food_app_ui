


import 'package:flutter/material.dart';

import '../first page/first_page.dart';
import '../second_page/second_page.dart';
import '../third_page/third_page.dart';




class ProjectNavigation{

  static Route? getRoutes(RouteSettings setting){
     switch(setting.name){
       case SecondScreen.PageName:{
         return  SlideTransitionPageRouteBuilder(tween: Tween(begin: Offset( 0,1),end: Offset.zero), settings: setting, widget: SecondScreen());

       }
       case DetailScreen.PAGENAME:{
         return SlideTransitionPageRouteBuilder(tween: Tween(begin: Offset( 0,-1),end: Offset.zero),
             settings: setting, widget:DetailScreen());
       }
       case MyThem.PAGENAME:{
         return SlideTransitionPageRouteBuilder(tween: Tween(begin: Offset( -1,0),end: Offset.zero), settings: setting, widget: MyThem());
       }
     }
  }
}

class SlideTransitionPageRouteBuilder extends PageRouteBuilder{
  Widget widget;
  RouteSettings settings;
  Tween<Offset> tween;
  SlideTransitionPageRouteBuilder({required this.tween,required this.settings,required this.widget})
      : super(pageBuilder: (
      BuildContext context ,
      Animation<double> animation,
      Animation<double> secondaryAnimation ){
      return widget ; }
     ,transitionsBuilder: (
        BuildContext context ,
        Animation<double> animation ,
        Animation<double> secondaryAnimation,Widget child ,)
    {
        //Tween<Offset> tween  = Tween(begin: Offset(0,0),end: Offset.zero);
        return SlideTransition(position: tween.animate(animation),child:child,);
      },
    settings: settings,
    transitionDuration: Duration(seconds: 1),
    reverseTransitionDuration: Duration(seconds: 1),
  );
}
