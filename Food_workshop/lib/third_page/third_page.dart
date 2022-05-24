
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_workshop/second_page/model/pizza_model.dart';

class DetailScreen extends StatefulWidget {

  static const String PAGENAME = 'detailed scree';
  const DetailScreen({ Key? key}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
   bool isFavourite = false ;
   late String detail ;
   late String image ;
   late String foodName ;
   late double price;

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    PizzaModel model = ModalRoute.of(context)!.settings.arguments as PizzaModel;
    price = model.price;
    detail = model.detail;
    image = model.image;
    foodName = model.title;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:  [
                IconButton(icon:Icon(Icons.arrow_back),onPressed:(){
                  Navigator.pop(context);
                } ,),
               isFavourite?IconButton(
                 onPressed: (){
                   setState(() {
                     isFavourite=false;
                   });
                 },
                   icon:Icon(Icons.favorite_outline,size: 20,color: Colors.red,)
               ):IconButton(
                   onPressed: (){
                     setState(() {
                       isFavourite=true;
                     });
                   },
                   icon:Icon(Icons.favorite_outline,size: 20,)
               )
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 30),
              padding: const EdgeInsets.all(6),
              height: 250,
              width: 250,
              decoration: const BoxDecoration(shape: BoxShape.rectangle),

              //food Image ________________________________
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('${image}'),
                      fit: BoxFit.cover),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'McDonald\'s \n',
                            style: TextStyle(
                              color: Colors.grey.shade900,
                            ),
                          ),
                          TextSpan(
                              text: '${foodName}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 20))
                        ],
                      ),
                    ),
                    // SmoothStarRating(
                    //   rating: 4,
                    //   color: Color(0xFFFFC61F),
                    // )
                  ],
                ),
                Text('\$${price}',
                    style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(
              height: 20,
            ),

            //food details ________________________________
            Text(
              "${detail}",
              style: TextStyle(letterSpacing: 1.0),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: (){
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Add to cart'),));
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 70),
                      decoration: BoxDecoration(
                        //  color: Colors.yellow.shade900,
                        color: Colors.brown.shade500,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Row(
                        children: [
                          Text(
                            'Add to cart',
                            style: Theme.of(context)
                                .textTheme
                                .button
                                ?.copyWith(color: Colors.white),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          // SvgPicture.asset(
                          //   'assets/icons/forward.svg',
                          //   height: 11,
                          // )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
