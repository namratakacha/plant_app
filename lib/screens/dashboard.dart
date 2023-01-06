import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:plant_app/constants/colors_titles.dart';
import 'package:plant_app/pages/cart_page.dart';
import 'package:plant_app/pages/favourite_page.dart';
import 'package:plant_app/pages/profile_page.dart';
import 'package:plant_app/pages/scan_page.dart';

import '../models/plants_model.dart';
import '../pages/home_page.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  int _navIndex = 0;
  List<Plant> favorites = [];
  List<Plant> myCart = [];
  List pages () {
    return [
      HomePage(),
      FavouritePage(favoritedPlants: favorites,),
      CartPage(addedToCartPlants: myCart,),
      ProfilePage(),
    ];
  }


  List titles = [
    'Home',
    'Favourite',
    'Cart',
    'Profile',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(titles[_navIndex], style: TextStyle(color: Constants.blackColor, fontSize: 24, fontWeight: FontWeight.w500),),
            Icon(Icons.notifications, color: Constants.blackColor,size: 30,)
          ],
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
      ),
      body: pages().elementAt(_navIndex),
      bottomNavigationBar: AnimatedBottomNavigationBar(
        onTap: (index) {
          setState(() {
            _navIndex = index;
             favorites = Plant.getFavoritedPlants();
             myCart = Plant.addedToCartPlants();
          });
        },
        icons: const [
          Icons.home,
          Icons.favorite,
          Icons.shopping_cart,
          Icons.person,
        ],
        notchSmoothness: NotchSmoothness.softEdge,
        gapLocation: GapLocation.center,
        activeIndex: _navIndex,
        activeColor: Constants.primaryColor,
        inactiveColor: Colors.grey,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Constants.primaryColor,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>ScanPage()));
        },
        child: Image.asset(
          'assets/images/code-scan-two.png',
          height: 20,
          width: 20,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
