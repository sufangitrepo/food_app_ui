


import 'package:flutter/material.dart';
import 'package:food_workshop/second_page/model/pizza_model.dart';
import 'package:food_workshop/third_page/third_page.dart';


class MyTabBar extends StatelessWidget {

  final double height ;
  final double width;
  final TabController tabController;
  const MyTabBar({required this.tabController,required this.width,required this.height,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height:height,width: width,child:Align(
      alignment: Alignment.center,
      child: TabBar(
        tabs: const [
          Tab(child: Text('PIZZA', )),
          Text('BURGER',),
          Text('DRINKS'),
          Text('SAUCES'),
          Text('COMBO'),
        ],controller:tabController,unselectedLabelColor: Colors.black26,labelColor: Colors.black,
        indicator: BoxDecoration(color: Colors.black12,borderRadius: BorderRadius.circular(10)),
        labelStyle: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 13 ),
        isScrollable: true,labelPadding:const  EdgeInsets.only(left: 12,right: 12),),
    ) );
  }
}

List<PizzaModel> burgerList = [
  PizzaModel(title: 'chispy Burger', price: 70, image: 'assets/images/burger1.png',),
  PizzaModel(title: 'Zinger burger', price: 50, image: 'assets/images/burger2.png'),
  PizzaModel(title: 'Cheesy Burger', price: 150, image: 'assets/images/burger3.png'),
];

List<PizzaModel> drinksList = [
  PizzaModel(title: 'Cocacola', price: 70, image: 'assets/images/drink1.png',),
  PizzaModel(title: 'TeenPack Cola', price: 50, image: 'assets/images/drink2.png'),
  PizzaModel(title: 'Cheesy Burger', price: 150, image: 'assets/images/drink3.png'),
];
List<PizzaModel> sauceList = [
  PizzaModel(title: 'Tomato sauce', price: 70, image: 'assets/images/sauce1.png',),
  PizzaModel(title: 'raddish sauce', price: 50, image: 'assets/images/sauce2.png'),
];
List<PizzaModel> comboList = [
  PizzaModel(title: 'Burger Cock Chips', price: 170, image: 'assets/images/combo1.png',),
  PizzaModel(title: 'Pizza cold drink', price: 150, image: 'assets/images/combo2.png'),
  PizzaModel(title: 'Pizza cold drink', price: 220, image: 'assets/images/combo3.png'),

];


class MyTabView extends StatelessWidget {
  final double height ;
  final double width;
  final  pizzaList;
  final TabController tabController;
  bool isFavourite = true;
  MyTabView({required this.pizzaList,required this.tabController,required this.width,required this.height,Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height,width: width,
        child: TabBarView(children: [
          pizzaTab(pizzaList,context),
          pizzaTab(burgerList,context),
          pizzaTab(drinksList,context),
          pizzaTab(sauceList,context),
          pizzaTab(comboList,context),
        ],
          controller:tabController,)
    );
  }

  Widget pizzaTab(List<PizzaModel> pizzaList,BuildContext context){
    return SizedBox(child: Column(children: [
      Expanded(flex:40 ,child:Container(
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: BoxDecoration(
            color: Colors.pink,borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(offset: Offset(3, 3),color: Colors.black26,blurRadius: 3),
              BoxShadow(offset: Offset(-3, -3),color: Colors.black26,blurRadius: 3),]
        ),
        child: ClipRRect(borderRadius: BorderRadius.circular(10) ,child: const Image(image:AssetImage('assets/images/pizza.png',),fit: BoxFit.fill,)),
        margin:const  EdgeInsets.only(left: 15,right: 15,top: 13,bottom: 15),) ,),
      Expanded(flex: 60,child:ListView.builder(itemBuilder: (BuildContext context , int index){
        PizzaModel model = pizzaList[index];
        return PizzaListItem(model: model);
      },itemCount: pizzaList.length,scrollDirection: Axis.horizontal,),),
    ],),);
  }
}


class PizzaListItem extends StatefulWidget {
  
  
  
  final PizzaModel model ; 
  const PizzaListItem({required  this.model,Key? key}) : super(key: key);

  @override
  State<PizzaListItem> createState() => _PizzaListItemState(model: model);
}

class _PizzaListItemState extends State<PizzaListItem> {
  PizzaModel model; 
  bool isFavoutirte = false;
  _PizzaListItemState({required this.model});
  
  @override
  Widget build(BuildContext context) {
    return item(context,model );
  }

  Widget item(BuildContext Context,PizzaModel model){
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, DetailScreen.PAGENAME,arguments: model);
      },
      child: Container(
        height: 50,width: 160,
        margin: EdgeInsets.only(left: 13,top: 10,bottom: 20),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white,
            boxShadow:const  [
              BoxShadow(offset: Offset(3,3),color: Colors.black12,blurRadius: 3),
              BoxShadow(offset: Offset(-3,-3),color: Colors.black12,blurRadius: 3),
            ]),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(flex: 27,child: Align(alignment: Alignment.topRight,
              child: isFavoutirte?
              IconButton(onPressed: (){
                //ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$isFavoutirte'),));
                setState(() {
                  isFavoutirte = false;
                });
              },
                  icon: Icon(Icons.favorite_border_outlined),color: Colors.red):
              IconButton(onPressed: (){
               // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$isFavoutirte'),));
                setState(() {
                  isFavoutirte = true;
                });
              },
                  icon: Icon(Icons.favorite_border_outlined,)), ),),
            Expanded(flex: 40,child: Align(alignment: Alignment(0,-1),
              child:Image(image: AssetImage('${model.image}'),
                height: 150,width: 150,fit: BoxFit.cover,) ,)
            ),
            Expanded(flex: 8,child: Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text('${model.title}',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.black87,fontSize: 12,fontWeight: FontWeight.bold),),
              ),
            ),),
            Expanded(flex: 10,child: Padding(
              padding:  EdgeInsets.only(left: 12.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  const [
                  Image(image: AssetImage('assets/images/rating_fill.png'),height: 18,width: 13,color: Colors.yellow,),
                  SizedBox(width: 2,),
                  Image(image: AssetImage('assets/images/rating_fill.png'),height:18,width: 13,color: Colors.yellow),
                  SizedBox(width: 2,),
                  Image(image: AssetImage('assets/images/rating_fill.png'),height: 18,width:13, color: Colors.yellow ),
                  SizedBox(width: 2,),
                  Image(image: AssetImage('assets/images/rating_fill.png'),height: 18,width: 13,color: Colors.white),
                  SizedBox(width: 2,),
                  Image(image: AssetImage('assets/images/rating_fill.png'),height: 18,width: 13,color: Colors.white),
                  Spacer()
                ],),
            ),),
            Expanded(flex: 15,child: Padding(
              padding:  EdgeInsets.only(left: 15.0,top: 5),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children:  [
                  Expanded(flex:70 ,child: Align(alignment: Alignment.topLeft,child: Text('\$${model.price}')),),
                  Expanded(flex: 30,child: Align(alignment: Alignment(0.5,-1),
                    child: CircleAvatar(child: Center(child: Icon(Icons.add,size: 13,)),radius: 8,backgroundColor: Colors.brown,),),),

                ],
              ),
            ),),
          ],
        ),
      ),
    );
  }
}

