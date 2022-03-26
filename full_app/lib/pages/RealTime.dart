import 'package:flutter/material.dart';
import 'package:full_app/helper/transform.dart';
class RealTimeObjectDetection extends StatelessWidget {
  const RealTimeObjectDetection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RealTimeObject(),
    );
  }
}
class RealTimeObject extends StatelessWidget {
  const RealTimeObject({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Real time object detection'),
        centerTitle: true,
      ),
      body: Container(
        child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.zero,
              child: Container(
                color: Color.fromARGB(255, 16, 39, 83),
              ),
            ),
            Positioned(
              left: 0.0,
              top: 0.0,
              right: null,
              bottom: null,
              width: 360.0,
              height: 194.0,
              child: Container(
                width: 360.0,
                height: 194.0,
                child: ClipRRect(
                  borderRadius: BorderRadius.zero,
                  child: Image.asset(
                    "assets/images/realtime.png",
                    color: null,
                    fit: BoxFit.cover,
                    width: 360.0,
                    height: 194.0,
                    colorBlendMode: BlendMode.dstATop,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 80.0,
              top: 212.0,
              right: null,
              bottom: null,
              child: Text(
                '''Real Time Object Detection''',
                overflow: TextOverflow.visible,
                textAlign: TextAlign.left,
                style: TextStyle(
                  height: 1.171875,
                  fontSize: 18.0,
                  fontFamily: 'Work Sans',
                  fontWeight: FontWeight.w800,
                  color: Color.fromARGB(255, 255, 255, 255),
                  /* letterSpacing: -0.36, */
                ),
              ),
            ),
            Positioned(
              left: 44.0,
              top: 271.0,
              right: null,
              bottom: null,
              width: 282.0,
              height: 80.0,
              child:
              Text(
                '''This will detect object in real time . Your just need to Click ‘Open Camera’ Button''',
                overflow: TextOverflow.visible,
                textAlign: TextAlign.left,
                style: TextStyle(
                  height: 1.171875,
                  fontSize: 18.0,
                  fontFamily: 'Yaldevi',
                  fontWeight: FontWeight.w400,
                  color: Color.fromARGB(255, 255, 255, 255),
                  /* letterSpacing: -0.36, */
                ),
              ),
            ),
            Positioned(
              left: 139.0,
              top: 400.0,
              right: null,
              bottom: null,
              width: 82.0,
              height: 78.0,
              child: Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.zero,
                  child: Image.asset(
                    "assets/images/camera-icon.png",
                    color: null,
                    fit: BoxFit.cover,
                    colorBlendMode: BlendMode.dstATop,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 193.0,
              top: 560.5620727539062,
              right: null,
              bottom: null,
              width: 108.0,
              height: 105.0,
              child: TransformHelper.rotate(
                  a: 0.86,
                  b: 0.51,
                  c: -0.51,
                  d: 0.86,
                  child: Container(
                    width: 108.0,
                    height: 105.0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.zero,
                      child: Image.asset(
                        "assets/images/Handsonefingericon1.png",
                        color: null,
                        fit: BoxFit.cover,
                        width: 108.0,
                        height: 105.0,
                        colorBlendMode: BlendMode.dstATop,
                      ),
                    ),
                  )),
            ),
            Positioned(
              left: 50.0,
              top: 540.0,
              right: null,
              bottom: null,
              width: 108.0,
              height: 105.0,
              child: Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.zero,
                  child: Image.asset(
                    "assets/images/pikachu.png",
                    color: null,
                    fit: BoxFit.cover,
                    colorBlendMode: BlendMode.dstATop,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

