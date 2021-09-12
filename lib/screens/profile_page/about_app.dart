import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutApp extends StatelessWidget {
  const AboutApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        children: [
          SizedBox(height: 20),
          Container(
            color: Colors.white,
            child: Image(
              height: 100,
              image: NetworkImage(
                'https://images-na.ssl-images-amazon.com/images/G/01/digital/video/acquisition/amazon_video_light._SY32_FMpng_.png',
              ),
            ),
          ),
          SizedBox(height: 20),
          Divider(color: Colors.orange),
          SizedBox(height: 20),
          ListTile(
            onTap: () {
              launch('https://www.primevideo.com/ref=atv_nb_logo');
            },
            title: Text('Visit Our Website',
                style: TextStyle(color: Colors.white)),
            trailing: Icon(Icons.arrow_forward_ios,
                color: Colors.cyanAccent, size: 20),
          ),
          ListTile(
            onTap: () {
              launch('https://www.primevideo.com/ref=atv_nb_logo');
            },
            title: Text('About Us', style: TextStyle(color: Colors.white)),
            trailing: Icon(Icons.arrow_forward_ios,
                color: Colors.cyanAccent, size: 20),
          ),
          ListTile(
            onTap: () {
              launch(
                  'mailto:ashokkumar9024276892@gmail.com?subject=Feedback&body=Hi, Just visited your app');
            },
            title: Text('Feedback', style: TextStyle(color: Colors.white)),
            trailing: Icon(Icons.arrow_forward_ios,
                color: Colors.cyanAccent, size: 20),
          ),
          ListTile(
            onTap: () {
              launch(
                  'mailto:ashokkumar9024276892@gmail.com?subject=Report%20Bug&body=');
            },
            title: Text('Report Bug', style: TextStyle(color: Colors.white)),
            trailing: Icon(Icons.arrow_forward_ios,
                color: Colors.cyanAccent, size: 20),
          ),
          ListTile(
            onTap: () {
              launch('https://github.com/Ashok-Kumar9/TeachEdison');
            },
            title: Text('Share app', style: TextStyle(color: Colors.white)),
            trailing: Icon(Icons.arrow_forward_ios,
                color: Colors.cyanAccent, size: 20),
          ),
          ListTile(
            title: Text('Terms and conditions',
                style: TextStyle(color: Colors.white)),
            trailing: Icon(Icons.arrow_forward_ios,
                color: Colors.cyanAccent, size: 20),
          ),
        ],
      ),
    );
  }
}
