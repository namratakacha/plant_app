import 'package:flutter/material.dart';
import 'package:plant_app/constants/colors_titles.dart';
import 'package:plant_app/models/plants_model.dart';
import 'package:plant_app/widgets/new_plants_view.dart';

import '../screens/plant_detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _searchController = TextEditingController();
  int selectedIndex = 0;
  List<Plant> _plants = Plant.plantList;
  List<Plant> filterList = [];
  List<String> _plantTypes = [
    'All',
    'Recommended',
    'Indoor',
    'Outdoor',
    'Garden',
    'Cactus',
    'Herbs'
  ];


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    if(filterList.length==0){
      filterList = _plants;
    }
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        searchView(),
        tabsView(),
        plantView(),
        const Padding(
          padding: EdgeInsets.only(top: 20, left: 12, bottom: 15),
          child: Text(
            'New Plants',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        newPlantsView(),
      ],
    ));
  }

  searchView() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
          color: Constants.primaryColor.withOpacity(0.2),
          borderRadius: BorderRadius.circular(15)),
      child: Row(
        children: [
          Icon(Icons.search),
          SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: _searchController,
              cursorColor: Constants.primaryColor,
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: 'Search plant'),
              
            ),
          ),
          Icon(Icons.mic)
        ],
      ),
    );
  }

  tabsView() {
    return SizedBox(
      height: 40,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: _plantTypes.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: InkWell(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                    filterList =  _plants.where((element) =>_plantTypes[selectedIndex]==element.category).toList();
                  });
                },
                child: Text(
                  _plantTypes[index],
                  style: TextStyle(
                      fontWeight: selectedIndex == index
                          ? FontWeight.bold
                          : FontWeight.w300,
                      color: selectedIndex == index
                          ? Constants.primaryColor
                          : Constants.blackColor),
                ),
              ),
            );
          }),
    );
  }

  plantView() {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.3,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: filterList.length==0? _plants.length: filterList.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (builder) => PlantDetailPage(
                              plantId: _plants[index].plantId,
                            ))).then((value) => setState(() {}));
              },
              child: Container(
                width: 200,
                margin: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    color: Constants.primaryColor.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(20)),
                child: Stack(
                  children: [
                    Positioned(
                      top: 10,
                      right: 20,
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50)),
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              _plants[index].isFavorated =
                                  !_plants[index].isFavorated;
                            });
                          },
                          icon: Icon(
                            _plants[index].isFavorated == true
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: Constants.primaryColor,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 50,
                      right: 50,
                      bottom: 50,
                      top: 50,
                      child: Image.asset( filterList[index].imageURL),
                    ),
                    Positioned(
                      left: 20,
                      bottom: 15,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                             filterList[index].category,
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            _plants[index].plantName,
                            style: TextStyle(
                                color: Colors.white70,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                        bottom: 15,
                        right: 20,
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: Text(
                             '\u{20B9} ' + filterList[index].price.toString(),
                            style: TextStyle(
                                fontSize: 16, color: Constants.primaryColor),
                          ),
                        ))
                  ],
                ),
              ),
            );
          }),
    );
  }

  newPlantsView() {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(left: 12, right: 12, bottom: 20),
        child: ListView.builder(
            itemCount: _plants.length,
            itemBuilder: (context, index) {
              return NewPlantsView(index: index, plantList: _plants,);
            }),
      ),
    );
  }
}
