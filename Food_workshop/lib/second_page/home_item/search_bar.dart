
import 'dart:ui';

import 'package:flutter/material.dart';

class SearchFood extends StatefulWidget {
  final double height ;
  final double width ;

  const SearchFood({required this.width,required this.height,Key? key}) : super(key: key);

  @override
  State<SearchFood> createState() => _SearchFoodState();
}

class _SearchFoodState extends State<SearchFood> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: widget.height,width: widget.width,
     child: Row(
       mainAxisSize: MainAxisSize.max,
       crossAxisAlignment: CrossAxisAlignment.stretch,
       children: [
             const Spacer(flex: 4,),
             Expanded(flex:78 ,child: Center(
             child: Container(
               height: 53,
               padding: EdgeInsets.only(top: 2),
               decoration:  BoxDecoration(
                   color: Colors.white,
                 borderRadius: BorderRadius.circular(10),
                 boxShadow: const [
                   BoxShadow(color: Colors.black26,offset: Offset(0, 3),blurRadius: 5),]
               ),
               child: TextField(
                 cursorColor: Colors.black26,
                 cursorHeight: 20,
                 onTap: (){
                   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Tap'),));

                 },
                 decoration: InputDecoration(
                   errorBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                     prefixIcon: Icon(Icons.search_outlined,color: Colors.black54,),
                     border: InputBorder.none,hintText: 'search',
                     hintStyle: Theme.of(context).textTheme.headline6!.copyWith(fontSize: 18,color: Colors.black26)),
               ),
             ),
           ) ,),
             Expanded(flex: 18,child:Center(
             child: Container(decoration: BoxDecoration(color: Colors.black87,
                 borderRadius: BorderRadius.circular(8)),height: 52,width: 44,
             child: const Center(child: Icon(Icons.stacked_bar_chart,color: Colors.white,size: 35,),),
             ),
             ),),
       ],
     ),
    );

  }
}
