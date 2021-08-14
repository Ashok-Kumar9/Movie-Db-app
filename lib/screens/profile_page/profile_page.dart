import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teachedison/controllers/movie_detail_controller.dart';
import 'package:teachedison/screens/on_boarding_screen.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final MovieDetailController movieController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.black,
            leading: Icon(Icons.arrow_back),
            title: Text('Profile'),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                profileImage(),
                SizedBox(height: 8.0),
                Text(
                  'Akshay Kumar',
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.mail_outline,
                      color: Colors.white,
                    ),
                    SizedBox(width: 8.0),
                    Text(
                      'akshaykumar9024276892@gmail.com',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.0,
                          letterSpacing: 1),
                    ),
                  ],
                ),
                SizedBox(
                  height: 28.0
                ),
                profileSectionTile(
                    iconData: Icons.verified_user,
                    sectionName: 'My Account',
                    onTap: () {}),
                profileSectionTile(
                    iconData: Icons.notifications,
                    sectionName: 'Notifications',
                    onTap: () {}),
                profileSectionTile(
                    iconData: Icons.settings,
                    sectionName: 'Settings',
                    onTap: () {}),
                profileSectionTile(
                    iconData: Icons.help_outline,
                    sectionName: 'Help Center',
                    onTap: () {}),
                profileSectionTile(
                  iconData: Icons.logout,
                  sectionName: 'Logout',
                  onTap: () {
                    movieController.listOfMovies.clear();
                    Get.off(
                      () => OnBoardingScreen(),
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Padding profileSectionTile(
      {required IconData iconData,
      required String sectionName,
      Function()? onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all(Colors.black.withOpacity(0.2)),
        ),
        onPressed: onTap,
        child: Row(
          children: [
            Icon(
              iconData,
              size: 28,
              color: Colors.lightBlue,
            ),
            SizedBox(
              width: 16.0,
              height: 44.0,
            ),
            Expanded(
              child: Text(
                sectionName,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.lightBlue,
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              size: 28,
              color: Colors.lightBlue,
            ),
          ],
        ),
      ),
    );
  }
}


SizedBox profileImage() {
  return SizedBox(
    height: 150.0,
    width: 150.0,
    child: Stack(
      fit: StackFit.expand,
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(
            'https://tse1.mm.bing.net/th?id=OIP.Ek1sZyyrItnu4s12BXY3OgHaEf&pid=Api&P=0&w=259&h=157',
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 18.0,
            child: Icon(
              Icons.camera_alt,
              color: Colors.lightBlue,
              size: 28.0,
            ),
          ),
        ),
      ],
    ),
  );
}
