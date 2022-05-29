import 'package:flutter/material.dart';
import 'package:ownpractice/pages/ExtractTextFromImage.dart';
import 'package:ownpractice/pages/ImageFromGallery/DetectFromGallery.dart';
import 'package:ownpractice/pages/RealTimeObjectDetection/main_realtime.dart';
import 'package:ownpractice/pages/TextToSpeech.dart';
import 'package:ownpractice/pages/homepage.dart';
import 'package:ownpractice/pages/youtube_api1.dart';
import 'package:ownpractice/pages/youtube_api2.dart';
import 'package:ownpractice/pages/youtube_api3.dart';
import 'package:ownpractice/pages/youtube_api4.dart';
import 'package:particles_flutter/particles_flutter.dart';

void main(){
  runApp(MaterialApp(
    home: FirstScreen(),
    routes: {
      '/HomeScreen': (context) => HomeScreen(),
      '/RealTime' : (context) => RealTime(),
      '/FromGallery' : (context) => Gallery(),
      '/TextToSpeech' : (context) => TxtToSpeech(),
      '/ExtractTextFromImage' : (context) => ExtractTextFromImage(),
      '/YoutubeApi' : (context) => YoutubeApiApp(),
      '/YoutubeApi2' : (context) => YoutubeApiApp_two(),
      '/YoutubeApi3' : (context) => YoutubeApiAppThree(),
      '/YoutubeApi4': (context) => YoutubeApiAppFour(),
    },
  ));
}


class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/background.jpg'),
                  fit: BoxFit.cover
              ),
            ),

            child: Stack(
              clipBehavior: Clip.none,
              fit: StackFit.expand,
              alignment: Alignment.center,
              children: [
                Positioned(
                  left: 230.0,
                  top: 50.0,
                  right: null,
                  bottom: null,
                  width: 125.0,
                  height: 162.0,
                  child: Text('Lets learn with flutter',
                    overflow: TextOverflow.visible,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      height: 1.171875,
                      fontSize: 34.0,
                      fontFamily: 'Arial',
                      fontWeight: FontWeight.w700,
                      //color: Color.fromARGB(255, 93, 72, 72),
                    ),
                  ),
                ),
                Positioned(
                  left: 95.0,
                  top: 573.0,
                  right: null,
                  bottom: null,
                  width: 210.0,
                  height: 46.0,
                  child: GestureDetector(
                    onTap: () => Navigator.pushNamed(context, '/HomeScreen'),
                    child: Container(
                      width: 210.0,
                      height: 46.0,
                      child: Stack(
                        fit: StackFit.expand,
                        alignment: Alignment.center,
                        children: [
                          Positioned(
                            left: 0.0,
                            top: 0.0,
                            right: null,
                            bottom: null,
                            width: 210.0,
                            height: 46.0,
                            child: Container(
                              width: 210.0,
                              height: 46.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(45.0),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(45.0),
                                child: Container(
                                  color: Color.fromARGB(173, 67, 28, 149),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 73.0,
                            top: 12.0,
                            right: null,
                            bottom: null,
                            width: 89.0,
                            height: 23.0,
                            child: Text(
                              '''Click here''',
                              overflow: TextOverflow.visible,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                height: 1.171875,
                                fontSize: 18.0,
                                fontFamily: 'Work Sans',
                                fontWeight: FontWeight.w800,
                                color: Color.fromARGB(255, 255, 255, 255),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 0.0,
                            top: 0.0,
                            right: null,
                            bottom: null,
                            width: 50.0,
                            height: 46.0,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(64.0),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(64.0),
                                child: Image.asset(
                                  "assets/images/flutterlogo.png",
                                  color: null,
                                  fit: BoxFit.cover,
                                  colorBlendMode: BlendMode.dstATop,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}