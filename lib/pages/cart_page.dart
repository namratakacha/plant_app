import 'package:flutter/material.dart';

import '../constants/colors_titles.dart';
import '../models/plants_model.dart';
import '../widgets/new_plants_view.dart';

class CartPage extends StatefulWidget {
  final List<Plant> addedToCartPlants;
  const CartPage({Key? key, required this.addedToCartPlants}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int total = 0;

  @override
  void initState() {
    widget.addedToCartPlants.forEach((element) {
      total = total+element.price;
    });
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.addedToCartPlants.isEmpty
          ? Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              'assets/images/add-cart.png',
              height: 80,
              width: 80,
            ),),
          SizedBox(height: 10),
          Text('Your cart is empty', style: TextStyle(color: Constants.primaryColor, fontSize: 16),)
        ],
      )
          : Container(
        padding: EdgeInsets.only(left: 12, right: 12, bottom: 20),
        //  height: size.height * 0.5,
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: widget.addedToCartPlants.length,
                  itemBuilder: (context, index) {
                    return NewPlantsView(index: index, plantList: widget.addedToCartPlants,);
                  }),
            ),
            Divider(thickness: 1,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total', style: TextStyle(color: Constants.primaryColor, fontSize: 20),),
                Text('$total', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
              ],
            ),
            SizedBox(height: 10),
          ],

        ),
      ),
    );
  }
}