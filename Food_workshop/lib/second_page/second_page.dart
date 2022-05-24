
import 'package:flutter/material.dart';
import 'package:food_workshop/second_page/home_item/home.dart';
import 'package:food_workshop/second_page/message_item/message_item.dart';
import 'package:food_workshop/second_page/notification_item/notification_item.dart';
import 'package:food_workshop/second_page/second_item/second_item.dart';
import 'package:food_workshop/second_page/second_page_appbar.dart';


class SecondScreen extends StatefulWidget {


  const SecondScreen({Key? key}) : super(key: key);
  static const   String PageName = 'second screen';


  @override
  SecondScreenState createState() => SecondScreenState();
}

class SecondScreenState extends State<SecondScreen> with TickerProviderStateMixin{
  int currentIndex = 0 ;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double height = size.height-85;
    double width = size.width;
    return  Scaffold(
      appBar: const SecondPageAppbar(),
      body:listOItems[currentIndex],
     bottomNavigationBar: BottomNavigationBar(
         currentIndex:currentIndex,
         onTap: (int index){
           setState(() {
             currentIndex = index;
           });
         },
         elevation: 5,
         items:  const [
           BottomNavigationBarItem(icon: Icon(Icons.home),label: '',),
           BottomNavigationBarItem(icon: Icon(Icons.apps_rounded),label: '',),
           BottomNavigationBarItem(icon: Icon(Icons.home),label: ''),
           BottomNavigationBarItem(icon: Icon(Icons.message),label: '',),
           BottomNavigationBarItem(icon: Icon(Icons.notifications_active_outlined),label: ''),
         ],
       backgroundColor: Colors.white,
       selectedIconTheme: Theme.of(context).iconTheme.copyWith(color: Colors.brown),
       unselectedIconTheme:Theme.of(context).iconTheme.copyWith(color: Colors.black26) ,


     ),
    );
  }


  List<Widget> listOItems = [
       Home(),
       SecondItem(),
       Container(),
       MessageItem(),
       NotificationItem(),
  ];

}
