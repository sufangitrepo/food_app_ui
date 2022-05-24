

import 'package:flutter/material.dart';

import '../second_page/second_page.dart';

class MyThem extends StatefulWidget {

  static const   String PAGENAME = 'MyTheme';

  const MyThem({Key? key}) : super(key: key);


  @override
  State<MyThem> createState() => _MyThemState();
}

class _MyThemState extends State<MyThem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Column(
            children: [
              const Spacer(
                flex: 10,
              ),
              Expanded(flex: 40, child: Image.asset('assets/images/piza.jpeg')),
              const Expanded(
                flex: 10,
                child: Text(
                    'The fast\n food delivery',textAlign: TextAlign.center,
                    style: TextStyle(letterSpacing: 1,
                        color: Colors.black, fontSize: 30.0, fontWeight: FontWeight.bold)
                ),
              ),

              const Expanded(
                flex: 15,
                child: Text(
                  'lorem ipsum dolor sit\n amet consetetur sadipscing\n elitr sed diam nonumy',textAlign: TextAlign.center,
                  style: TextStyle(letterSpacing: 1,color: Colors.black, ),),
              ),
              Expanded(
                  child: RichText(
                      text: const TextSpan(
                          children: <TextSpan>[TextSpan(text: '...')]))),


              ElevatedButton(
                  style: ElevatedButton.styleFrom( primary: Colors.brown, padding: EdgeInsets.all(10),
                    onPrimary: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    minimumSize: const Size(200, 50),
                    maximumSize: const Size(200, 50),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context,SecondScreen.PageName);
                  },
                  child: const Text('Get Started',)),const Spacer(flex: 4,)
            ],
          ),
        ));
  }
}
