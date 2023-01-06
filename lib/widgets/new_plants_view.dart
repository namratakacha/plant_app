import 'package:flutter/material.dart';

import '../constants/colors_titles.dart';
import '../models/plants_model.dart';
import '../screens/plant_detail_page.dart';

class NewPlantsView extends StatefulWidget {
  final int index;
  final List<Plant> plantList;
  const NewPlantsView({Key? key, required this.index, required this.plantList}) : super(key: key);

  @override
  State<NewPlantsView> createState() => _NewPlantsViewState();
}

class _NewPlantsViewState extends State<NewPlantsView> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (builder) => PlantDetailPage(
                  plantId: widget.plantList[widget.index].plantId,
                ))).then((value) => setState(() {}));
      },
      child: Container(
        height: 80,
        width: size.width,
        padding: EdgeInsets.only(left: 10, top: 10),
        margin: EdgeInsets.only(top: 10, bottom: 10),
        decoration: BoxDecoration(
          color: Constants.primaryColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      color: Constants.primaryColor.withOpacity(0.7),
                      shape: BoxShape.circle),
                ),
                Positioned(
                  bottom: 5,
                  left: 0,
                  right: 0,
                  child: SizedBox(
                    height: 80,
                    child: Image.asset(widget.plantList[widget.index].imageURL),
                  ),
                ),
                Positioned(
                  bottom: 5,
                  left: 80,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.plantList[widget.index].category),
                      Text(
                        widget.plantList[widget.index].plantName,
                        style: TextStyle(
                            color: Constants.blackColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Text(
                '\u{20B9} ' + widget.plantList[widget.index].price.toString(),
                style: TextStyle(
                  fontSize: 18,
                  color: Constants.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
