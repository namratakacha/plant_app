import 'package:flutter/material.dart';
import 'package:plant_app/constants/colors_titles.dart';
import 'package:plant_app/screens/dashboard.dart';

import '../models/plants_model.dart';

class PlantDetailPage extends StatefulWidget {
  final int plantId;

  const PlantDetailPage({Key? key, required this.plantId}) : super(key: key);

  @override
  State<PlantDetailPage> createState() => _PlantDetailPageState();
}

class _PlantDetailPageState extends State<PlantDetailPage> {
  List<Plant> _plants = Plant.plantList;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        toolbarHeight: 70,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  color: Constants.primaryColor.withOpacity(0.15),
                  shape: BoxShape.circle),
              child: IconButton(
                  onPressed: () {
                     Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.close,
                    color: Constants.primaryColor,
                  )),
            ),
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  color: Constants.primaryColor.withOpacity(0.15),
                  shape: BoxShape.circle),
              child: IconButton(
                  onPressed: () {
                    setState(() {
                      _plants[widget.plantId].isFavorated =
                          !_plants[widget.plantId].isFavorated;
                    });
                  },
                  icon: Icon(
                    _plants[widget.plantId].isFavorated
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: Constants.primaryColor,
                  )),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            left: 20,
            right: 20,
            child: Container(
              width: size.width * 0.8,
              height: size.height * 0.8,
              padding: EdgeInsets.only(right: 20),
              child: Stack(
                children: [
                  Positioned(
                    top: 10,
                    right: 0,
                    child: SizedBox(
                      height: 200,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          plantFeature(
                              title: 'Size',
                              feature: _plants[widget.plantId].size),
                          plantFeature(
                              title: 'Humidity',
                              feature:
                                  _plants[widget.plantId].humidity.toString()),
                          plantFeature(
                              title: 'Temperature',
                              feature: _plants[widget.plantId].temperature),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    left: 0,
                    child: Container(
                      height: 350,
                      child: Image.asset(_plants[widget.plantId].imageURL),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: size.height * 0.45,
              width: size.width,
              padding: EdgeInsets.only(top: 60, right: 30, left: 30),
              decoration: BoxDecoration(
                color: Constants.primaryColor.withOpacity(0.4),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _plants[widget.plantId].plantName,
                            style: TextStyle(
                                color: Constants.primaryColor,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10),
                          Text(
                            '\u{20B9} ' +
                                _plants[widget.plantId].price.toString(),
                            style: TextStyle(
                                color: Constants.blackColor,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            _plants[widget.plantId].rating.toString(),
                            style: TextStyle(
                                fontSize: 30, color: Constants.primaryColor),
                          ),
                          Icon(
                            Icons.star,
                            color: Constants.primaryColor,
                            size: 30,
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  Expanded(
                      child: Column(
                    children: [
                      Text(
                        _plants[widget.plantId].decription,
                        style: TextStyle(
                            color: Constants.blackColor,
                            fontSize: 18,
                            height: 1.5),
                      )
                    ],
                  ))
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Container(
        width: size.width,
        margin: EdgeInsets.only(left: 45),
        height: 50,
        child: Row(
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  color: _plants[widget.plantId].isSelected ?Constants.primaryColor.withOpacity(0.8): Colors.white  ,
                  shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 1),
                  blurRadius: 5,
                  color: Constants.primaryColor.withOpacity(0.3),
                )
              ]
              ),
              child: IconButton(
                onPressed: () {
                  _plants[widget.plantId].isSelected ? Container() : ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Added to cart')));
                  setState(() {
                    _plants[widget.plantId].isSelected =
                        !_plants[widget.plantId].isSelected;
                  });
                },
                icon: Icon(
                  Icons.shopping_cart,
                  color:_plants[widget.plantId].isSelected ?Colors.white:Constants.primaryColor   ,
                ),
              ),
            ),
            SizedBox(width: 20),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Constants.primaryColor.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 1),
                        blurRadius: 5,
                        color: Constants.primaryColor.withOpacity(0.3),
                      )
                    ]
                ),
                child: Center(
                  child: Text('BUY NOW', style: TextStyle(fontSize: 20, color: Colors.white),),
                )
              ),
            ),
          ],
        ),
      ),
    );
  }

  plantFeature({required String title, required String feature}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(color: Colors.black),
        ),
        Text(
          feature,
          style: TextStyle(
              color: Constants.primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 18),
        )
      ],
    );
  }
}
