

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_workshop/second_page/second_page.dart';

import 'first page/first_page.dart';
import 'navigator/project_navigation.dart';



void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.grey,
    statusBarIconBrightness: Brightness.dark

  ));
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Demo',
      initialRoute: MyThem.PAGENAME,
      onGenerateRoute: ProjectNavigation.getRoutes,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,

      ),
      home: MyThem(),
    );
  }
}
