import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:ownpractice/helper/transform.dart';
import 'dart:async';
import 'package:tflite/tflite.dart';
import 'dart:math' as math;
import 'package:ownpractice/pages/RealTimeObjectDetection/camera.dart';
import 'package:ownpractice/pages/RealTimeObjectDetection/models.dart';
import 'package:ownpractice/pages/RealTimeObjectDetection/bndbox.dart';

/*List<CameraDescription> cameras = 0 as List<CameraDescription>;

Future<Null> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    cameras = await availableCameras();
  } on CameraException catch (e) {
    print('Error: $e.code\nError Message: $e.message');
  }
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'tflite real-time detection',
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: HomePage(cameras),
    );
  }
}*/

List<CameraDescription> cameras = 0 as List<CameraDescription>;

/*Future<Null> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    cameras = await availableCameras();
  } on CameraException catch (e) {
    print('Error: $e.code\nError Message: $e.message');
  }
  runApp(new RealTimeObject());
}*/

class RealTime extends StatelessWidget {
  Future<Null> main() async {
    WidgetsFlutterBinding.ensureInitialized();
    try {
      cameras = await availableCameras();
    } on CameraException catch (e) {
      print('Error: $e.code\nError Message: $e.message');
    }
    //runApp(new MyApp());
  }
  const RealTime({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RealTimeObject(cameras),
    );

  }
}


class RealTimeObject extends StatefulWidget {

  //const RealTimeObject(List<CameraDescription> cameras, {Key? key}) : super(key: key);


  final List<CameraDescription> cameras;
  RealTimeObject(this.cameras);

  @override
  _RealTimeObjectState createState() => _RealTimeObjectState();
}

class _RealTimeObjectState extends State<RealTimeObject> {

  List<dynamic>? _recognitions; // changes here
  int _imageHeight = 0;
  int _imageWidth = 0;
  String _model = "";

  @override
  void initState() {
    //this._recognitions = _recognitions; // changed here
    super.initState();
  }

  loadModel() async {
    String res;
    switch (_model) {
      case yolo:
        res = (await Tflite.loadModel(
          model: "assets/yolov2_tiny.tflite",
          labels: "assets/yolov2_tiny.txt",
        ))!;
        break;

      case mobilenet:
        res = (await Tflite.loadModel(
            model: "assets/mobilenet_v1_1.0_224.tflite",
            labels: "assets/mobilenet_v1_1.0_224.txt"))!;
        break;

      case posenet:
        res = (await Tflite.loadModel(
            model: "assets/posenet_mv1_075_float_from_checkpoints.tflite"))!;
        break;

      default:
        res = (await Tflite.loadModel(
            model: "assets/ssd_mobilenet.tflite",
            labels: "assets/ssd_mobilenet.txt"))!;
    }
    print(res);
  }

  onSelect(model) {
    setState(() {
      _model = model;
    });
    loadModel();
  }

  setRecognitions(recognitions, imageHeight, imageWidth) {
    setState(() {
      _recognitions = recognitions;
      _imageHeight = imageHeight;
      _imageWidth = imageWidth;
    });
  }


  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return Scaffold(

      appBar: AppBar(
        title: Text('Real time object detection'),
        centerTitle: true,
      ),
      body: _model == ""
        ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: const Text(ssd),
              onPressed: () => onSelect(ssd),
            ),
            RaisedButton(
              child: const Text(yolo),
              onPressed: () => onSelect(yolo),
            ),
            RaisedButton(
              child: const Text(mobilenet),
              onPressed: () => onSelect(mobilenet),
            ),
            RaisedButton(
              child: const Text(posenet),
              onPressed: () => onSelect(posenet),
            ),
          ],
        ),
      )
          : Stack(
        children: [
          Camera(
            widget.cameras,
            _model,
            setRecognitions,
          ),
          BndBox(
              _recognitions == null ? [] : _recognitions!,
              math.max(_imageHeight, _imageWidth),
              math.min(_imageHeight, _imageWidth),
              screen.height,
              screen.width,
              _model),
        ],
      )
      /*body: Container(
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
      ),*/
    );
  }
}

