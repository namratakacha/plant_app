import 'package:flutter/material.dart';

import '../constants/colors_titles.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({Key? key}) : super(key: key);

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  @override
  Widget build(BuildContext context) {
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
                  onPressed: () {},
                  icon: Icon(
                    Icons.share,
                    color: Constants.primaryColor,
                  )),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/code-scan.png', height: 80, width: 80,),
            SizedBox(height: 20),
            Text('Tap to scan', style: TextStyle(color: Constants.primaryColor, fontSize: 16),)
          ],
        ),
      ),
    );
  }
}
