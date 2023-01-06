import 'package:flutter/material.dart';
import 'package:plant_app/widgets/new_plants_view.dart';

import '../constants/colors_titles.dart';
import '../models/plants_model.dart';
import '../screens/plant_detail_page.dart';

class FavouritePage extends StatefulWidget {
  final List<Plant> favoritedPlants;

  const FavouritePage({Key? key, required this.favoritedPlants})
      : super(key: key);

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.favoritedPlants.isEmpty
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                    child: Image.asset(
                  'assets/images/favorited.png',
                  height: 80,
                  width: 80,
                ),),
                SizedBox(height: 10),
                Text('Your favorited plants', style: TextStyle(color: Constants.primaryColor, fontSize: 16),)
              ],
            )
          : Container(
              padding: EdgeInsets.only(left: 12, right: 12, bottom: 20),
              //  height: size.height * 0.5,
              child: ListView.builder(
                  itemCount: widget.favoritedPlants.length,
                  itemBuilder: (context, index) {
                    return NewPlantsView(index: index, plantList: widget.favoritedPlants,);
                  }),
            ),
    );
  }
}
