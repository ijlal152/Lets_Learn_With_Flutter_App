import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:ownpractice/pages/RealTime/camerapage.dart';
import '../../helper/transform.dart';
class ObjectDetectInRealTime extends StatelessWidget {
  const ObjectDetectInRealTime({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RealTimeDetection(),
    );
  }
}

class RealTimeDetection extends StatefulWidget {
  const RealTimeDetection({Key? key}) : super(key: key);

  @override
  State<RealTimeDetection> createState() => _RealTimeDetectionState();
}

class _RealTimeDetectionState extends State<RealTimeDetection> {
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
              child: GestureDetector(
                // on tap function 
                onTap: ()async{
                  await availableCameras().then(
                          (value) => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CameraPage(cameras:value)),
                          ),
                  );
                },
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



// import 'package:camera/camera.dart';
// import 'package:flutter/material.dart';
// import 'package:tflite/tflite.dart';
// import 'package:ownpractice/main.dart';
//
// List<CameraDescription>? cameras;
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   try {
//     cameras = await availableCameras();
//   } on CameraException catch (e) {
//     print('Error: $e.code\nError Message: $e.message');
//   }
//
//   runApp(ObjectDetectInRealTime());
// }
// //List<CameraDescription> cameras;
//
//
// class ObjectDetectInRealTime extends StatelessWidget {
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: RealTimeDetection(cameras!),
//     );
//   }
// }
//
// class RealTimeDetection extends StatefulWidget {
//   //const RealTimeDetection({Key? key}) : super(key: key);
//   final List<CameraDescription> camera;
//   RealTimeDetection(this.camera);
//
//   @override
//   State<RealTimeDetection> createState() => _RealTimeDetectionState();
// }
//
// class _RealTimeDetectionState extends State<RealTimeDetection> {
//
//   CameraController? cameraController;
//   CameraImage? cameraImage;
//   List? recognitionsList;
//
//   initCamera(){
//     cameraController = CameraController(cameras![0], ResolutionPreset.high);
//     cameraController!.initialize().then((value) {
//       setState(() {
//         cameraController!.startImageStream((image) => {
//           cameraImage = image,
//           runModel(),
//         });
//       });
//     });
//   }
//
//   runModel() async {
//     recognitionsList = (await Tflite.detectObjectOnFrame(
//       bytesList: cameraImage!.planes.map((plane) {
//         return plane.bytes;
//       }).toList(),
//       imageHeight: cameraImage!.height,
//       imageWidth: cameraImage!.width,
//       imageMean: 127.5,
//       imageStd: 127.5,
//       numResultsPerClass: 1,
//       threshold: 0.4,
//     ))!;
//
//     setState(() {
//       cameraImage;
//     });
//   }
//
//   Future loadModel() async {
//     Tflite.close();
//     await Tflite.loadModel(
//         model: "assets/models/ssd_mobilenet.tflite",
//         labels: "assets/models/ssd_mobilenet.txt");
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//
//     cameraController!.stopImageStream();
//     Tflite.close();
//   }
//
//   @override
//   void initState() {
//     super.initState();
//
//     loadModel();
//     initCamera();
//   }
//
//   List<Widget> displayBoxesAroundRecognizedObjects(Size screen) {
//     if (recognitionsList == null) return [];
//     double factorX = screen.width;
//     double factorY = screen.height;
//
//     Color colorPick = Colors.pink;
//     return recognitionsList!.map((result) {
//       return Positioned(
//         left: result["rect"]["x"] * factorX,
//         top: result["rect"]["y"] * factorY,
//         width: result["rect"]["w"] * factorX,
//         height: result["rect"]["h"] * factorY,
//         child: Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.all(Radius.circular(10.0)),
//             border: Border.all(color: Colors.pink, width: 2.0),
//           ),
//           child: Text(
//             "${result['detectedClass']} ${(result['confidenceInClass'] * 100).toStringAsFixed(0)}%",
//             style: TextStyle(
//               background: Paint()..color = colorPick,
//               color: Colors.black,
//               fontSize: 18.0,
//             ),
//           ),
//         ),
//       );
//     }).toList();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//     Size size = MediaQuery.of(context).size;
//     List<Widget> list = [];
//
//     list.add(
//       Positioned(
//         top: 0.0,
//         left: 0.0,
//         width: size.width,
//         height: size.height - 100,
//         child: Container(
//           height: size.height - 100,
//           child: (!cameraController!.value.isInitialized)
//               ? new Container()
//               : AspectRatio(
//             aspectRatio: cameraController!.value.aspectRatio,
//             child: CameraPreview(cameraController!),
//           ),
//         ),
//       ),
//     );
//
//     if (cameraImage != null) {
//       list.addAll(displayBoxesAroundRecognizedObjects(size));
//     }
//
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Colors.black,
//         body: Container(
//           margin: EdgeInsets.only(top: 50),
//           color: Colors.black,
//           child: Stack(
//             children: list,
//           ),
//         ),
//       ),
//     );
//   }
// }
//
