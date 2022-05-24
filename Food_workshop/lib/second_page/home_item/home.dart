
import 'package:flutter/material.dart';

import 'package:food_workshop/second_page/home_item/search_bar.dart';
import 'package:food_workshop/second_page/home_item/tab_bar.dart';
import 'package:food_workshop/second_page/model/pizza_model.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> with TickerProviderStateMixin{

  late TabController _tabController ;
  List<PizzaModel> pizzaList = [
    PizzaModel(title: 'BBQ Chicken Beast', price: 100, image: 'assets/images/pizza1.png',),
    PizzaModel(title: 'Fajitta', price: 50, image: 'assets/images/pizza2.png'),
    PizzaModel(title: 'Cheesy Pizza', price: 150, image: 'assets/images/pizza3.png'),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5,vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height-85;
    double width = size.width;
    return SingleChildScrollView(
      primary: false,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SearchFood(height: height*.17,width: width,),
          MyTabBar(height: height*.08,width: width,tabController: _tabController,),
          MyTabView(height: height*.68,width: width,tabController: _tabController,pizzaList: pizzaList,),
          SizedBox(height: height*.07,),
        ],
      ),
    );
  }
}
