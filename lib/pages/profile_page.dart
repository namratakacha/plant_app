import 'package:flutter/material.dart';
import 'package:plant_app/constants/colors_titles.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
      height: size.height,
      width: size.width,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: 150,
              child: CircleAvatar(
                radius: 60,
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage('assets/images/profile.jpeg'),
              ),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: Constants.primaryColor.withOpacity(0.3),
                      width: 5)),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Namrata Tank',
                  style: TextStyle(fontSize: 20, color: Constants.blackColor),
                ),
                SizedBox(width: 5),
                Image.asset(
                  'assets/images/verified.png',
                  height: 23,
                  width: 23,
                )
              ],
            ),
            Text(
              'namrata.tank@indianic.com',
              style: TextStyle(
                  color: Constants.blackColor.withOpacity(0.3), fontSize: 14),
            ),
            SizedBox(height: 30),
            profileSections(icon: Icon(Icons.person), title: 'My Profile'),
            profileSections(icon: Icon(Icons.settings), title: 'Settings'),
            profileSections(
                icon: Icon(Icons.notifications), title: 'Notifications'),
            profileSections(icon: Icon(Icons.chat), title: 'Chat'),
            profileSections(icon: Icon(Icons.share), title: 'Share'),
            profileSections(icon: Icon(Icons.logout), title: 'Log Out'),
          ],
        ),
      ),
    ));
  }

  profileSections({required Widget icon, required String title}) {
    return ListTile(
      leading: icon,
      title: Text(
        title,
        style: TextStyle(color: Constants.blackColor),
      ),
      trailing: Icon(Icons.arrow_forward_ios),
    );
  }
}
