import 'package:flutter/material.dart';
import 'package:plant_app/constants/colors_titles.dart';
import 'package:plant_app/screens/login_page.dart';
import 'package:plant_app/widgets/onboarding_view.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: TextButton(
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LoginPage()));
                },
                child: Text(
                  'Skip',
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                )),
          )
        ],
      ),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(left: 50, right: 50, top: 40),
            child: PageView(
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  currentIndex = page;
                });
              },
              children: [
                OnBoardingViewPage(
                  image: 'assets/images/plant-one.png',
                  title: Constants.titleOne,
                  description: Constants.descriptionOne,
                ),
                OnBoardingViewPage(
                  image: 'assets/images/plant-two.png',
                  title: Constants.titleTwo,
                  description: Constants.descriptionTwo,
                ),
                OnBoardingViewPage(
                  image: 'assets/images/plant-three.png',
                  title: Constants.titleThree,
                  description: Constants.descriptionThree,
                ),
              ],
            ),
          ),
          Positioned(
              left: 30,
              bottom: 30,
              child: Row(
                children: _buildIndicators(),
              ),),
          Positioned(
              right: 30,
              bottom: 20,
              child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: Constants.primaryColor,
              shape: BoxShape.circle,
            ),
            child: IconButton(onPressed: (){
              if(currentIndex < 2){
                currentIndex++;
                if(currentIndex<3){
                  _pageController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
                }
              }else{
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LoginPage()));
              }
            }, icon: Icon(Icons.arrow_forward, color: Colors.white,)),
          ))
        ],
      ),
    );
  }

  List<Widget> _buildIndicators() {
    List<Widget> indicators = [];
    for (int i = 0; i < 3; i++) {
      if (currentIndex == i) {
        indicators.add(_indicators(true));
      } else {
        indicators.add(_indicators(false));
      }
    }
    return indicators;
  }

  // indicator decoration
  Widget _indicators(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: 10,
      width: isActive ? 20 : 10,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          color: Constants.primaryColor,
          borderRadius: BorderRadius.circular(5)),
    );
  }
}
