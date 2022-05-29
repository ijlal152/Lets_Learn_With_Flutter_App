import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

class Gallery extends StatelessWidget {
  const Gallery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TfliteModel(),
    );
  }
}

class TfliteModel extends StatefulWidget {
  TfliteModel({Key? key}) : super(key: key);
  final FlutterTts flutterTts = FlutterTts();

  @override
  State<TfliteModel> createState() => _TfliteModelState();
}

class _TfliteModelState extends State<TfliteModel> {

  late File _image;
  late List _results;
  bool imageSelect=false;

  final FlutterTts flutterTts = FlutterTts();

  @override
  void initState()
  {
    super.initState();
    loadModel();
  }
  Future loadModel()
  async {
    Tflite.close();
    String res;
    res=(await Tflite.loadModel(model: "assets/models/mobilenet_v1_1.0_224.tflite",labels: "assets/models/mobilenet_v1_1.0_224.txt"))!;
    print("Models loading status: $res");
  }
  Future imageClassification(File image)
  async {
    final List? recognitions = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 6,
      threshold: 0.05,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    setState(() {
      _results=recognitions!;
      _image=image;
      imageSelect=true;
    });
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();
    speak(String text) async{
      await flutterTts.setLanguage("en-US");
      await flutterTts.setPitch(1);
      await flutterTts.speak(text);
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image Classification"),
        centerTitle: true,
      ),
      body: Container(
        color: Color.fromARGB(255, 16, 39, 83),
        child: ListView(
          children: [
            (imageSelect)?Container(
              margin: const EdgeInsets.all(10),
              child: Image.file(_image),
            ):Container(
              //height: 600,
              margin: const EdgeInsets.all(10),
              child: const Opacity(
                opacity: 0.8,
                child: Center(
                  child: Text("No image selected",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: (imageSelect)?_results.map((result) {
                  return Stack(
                    alignment: Alignment.topCenter,
                    children: <Widget>[
                      Positioned(
                        child: Card(
                          child: Container(
                            margin: EdgeInsets.all(10),
                            child: Stack(
                              //alignment: Alignment.center,
                              children: <Widget>[
                                Text(
                                  "${result['label']}",
                                  style: const TextStyle(color: Colors.red,
                                    fontSize: 20,
                                    height: 3,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 4,
                        width: 40,
                        height: 40,
                        child: GestureDetector(
                          onTap: () => speak(result['label']),
                          child: Container(
                            child: Image.asset(
                              "assets/images/Speaker-icon.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );

                }).toList():[],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: pickImage,
        tooltip: "Pick Image",
        child: const Icon(Icons.image),
      ),
    );
  }
  Future pickImage()
  async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
    );
    File image=File(pickedFile!.path);
    imageClassification(image);
  }
}

// import 'dart:io';
// import 'package:image/image.dart' as img;
// import 'package:image_picker/image_picker.dart';
// import 'package:flutter/material.dart';
// import 'dart:math';
// import 'dart:typed_data';
// import 'package:flutter/services.dart';
// import 'dart:async';
// import 'dart:ui';
// import 'package:tflite/tflite.dart';
//
// import '../../helper/transform.dart';
//
// const String mobile = "MobileNet";
// const String ssd = "SSD MobileNet";
// const String yolo = "Tiny YOLOv2";
// const String deeplab = "DeepLab";
// const String posenet = "PoseNet";
//
// class Gallery extends StatelessWidget {
//   const Gallery({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: MyApp(),
//     );
//   }
// }
//
// class MyApp extends StatefulWidget {
//   //const MyApp({Key? key}) : super(key: key);
//
//   @override
//   _MyAppState createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   File? _image;
//   List? _recognitions;
//   String _model = mobile;
//   double? _imageHeight;
//   double? _imageWidth;
//   bool _busy = false;
//
//   ImagePicker picker = ImagePicker();
//
//   Future predictImagePicker() async {
//     // ignore: deprecated_member_use
//     var image = await picker.pickImage(source: ImageSource.gallery);
//     if (image == null) {
//       return;
//     }
//     setState(() {
//       _busy = true;
//     });
//     File a = File(image.path);
//     predictImage(a);
//   }
//
//   Future predictImage(File image) async {
//     if (image == null) return;
//
//     switch (_model) {
//       case yolo:
//         await yolov2Tiny(image);
//         break;
//       case ssd:
//         await ssdMobileNet(image);
//         break;
//       case deeplab:
//         await segmentMobileNet(image);
//         break;
//       case posenet:
//         await poseNet(image);
//         break;
//       default:
//         await recognizeImage(image);
//       // await recognizeImageBinary(image);
//     }
//
//     new FileImage(image)
//         .resolve(new ImageConfiguration())
//         .addListener(ImageStreamListener((ImageInfo info, bool _) {
//       setState(() {
//         _imageHeight = info.image.height.toDouble();
//         _imageWidth = info.image.width.toDouble();
//       });
//     }));
//
//     setState(() {
//       _image = image;
//       _busy = false;
//     });
//   }
//
//   @override
//   void initState() {
//     super.initState();
//
//     _busy = true;
//
//     loadModel().then((val) {
//       setState(() {
//         _busy = false;
//       });
//     });
//   }
//
//   Future loadModel() async {
//     Tflite.close();
//     try {
//       String res;
//       switch (_model) {
//         case yolo:
//           res = (await Tflite.loadModel(
//             model: "assets/models/yolov2_tiny.tflite",
//             labels: "assets/models/yolov2_tiny.txt",
//             // useGpuDelegate: true,
//           ))!;
//           break;
//         case ssd:
//           res = (await Tflite.loadModel(
//             model: "assets/models/ssd_mobilenet.tflite",
//             labels: "assets/models/ssd_mobilenet.txt",
//             // useGpuDelegate: true,
//           ))!;
//           break;
//         case deeplab:
//           res = (await Tflite.loadModel(
//             model: "assets/models/deeplabv3_257_mv_gpu.tflite",
//             labels: "assets/models/deeplabv3_257_mv_gpu.txt",
//             // useGpuDelegate: true,
//           ))!;
//           break;
//         case posenet:
//           res = (await Tflite.loadModel(
//             model:
//                 "assets/models/posenet_mv1_075_float_from_checkpoints.tflite",
//             // useGpuDelegate: true,
//           ))!;
//           break;
//         default:
//           res = (await Tflite.loadModel(
//             model: "assets/models/mobilenet_v1_1.0_224.tflite",
//             labels: "assets/models/mobilenet_v1_1.0_224.txt",
//             // useGpuDelegate: true,
//           ))!;
//       }
//       print(res);
//     } on PlatformException {
//       print('Failed to load model.');
//     }
//   }
//
//   Uint8List imageToByteListFloat32(
//       img.Image image, int inputSize, double mean, double std) {
//     var convertedBytes = Float32List(1 * inputSize * inputSize * 3);
//     var buffer = Float32List.view(convertedBytes.buffer);
//     int pixelIndex = 0;
//     for (var i = 0; i < inputSize; i++) {
//       for (var j = 0; j < inputSize; j++) {
//         var pixel = image.getPixel(j, i);
//         buffer[pixelIndex++] = (img.getRed(pixel) - mean) / std;
//         buffer[pixelIndex++] = (img.getGreen(pixel) - mean) / std;
//         buffer[pixelIndex++] = (img.getBlue(pixel) - mean) / std;
//       }
//     }
//     return convertedBytes.buffer.asUint8List();
//   }
//
//   Future<Uint8List> imageToByteListUint8(img.Image image, int inputSize) async {
//     var convertedBytes = Uint8List(1 * inputSize * inputSize * 3);
//     var buffer = Uint8List.view(convertedBytes.buffer);
//     int pixelIndex = 0;
//     for (var i = 0; i < inputSize; i++) {
//       for (var j = 0; j < inputSize; j++) {
//         var pixel = image.getPixel(j, i);
//         buffer[pixelIndex++] = img.getRed(pixel);
//         buffer[pixelIndex++] = img.getGreen(pixel);
//         buffer[pixelIndex++] = img.getBlue(pixel);
//       }
//     }
//     return convertedBytes.buffer.asUint8List();
//   }
//
//   Future recognizeImage(File image) async {
//     int startTime = new DateTime.now().millisecondsSinceEpoch;
//     var recognitions = await Tflite.runModelOnImage(
//       path: image.path,
//       numResults: 6,
//       threshold: 0.05,
//       imageMean: 127.5,
//       imageStd: 127.5,
//     );
//     setState(() {
//       _recognitions = recognitions;
//     });
//     int endTime = new DateTime.now().millisecondsSinceEpoch;
//     print("Inference took ${endTime - startTime}ms");
//   }
//
//   Future recognizeImageBinary(File image) async {
//     int startTime = new DateTime.now().millisecondsSinceEpoch;
//     var imageBytes = (await rootBundle.load(image.path)).buffer;
//     img.Image oriImage = img.decodeJpg(imageBytes.asUint8List());
//     img.Image resizedImage = img.copyResize(oriImage, height: 224, width: 224);
//     var recognitions = await Tflite.runModelOnBinary(
//       binary: imageToByteListFloat32(resizedImage, 224, 127.5, 127.5),
//       numResults: 6,
//       threshold: 0.05,
//     );
//     setState(() {
//       _recognitions = recognitions;
//     });
//     int endTime = new DateTime.now().millisecondsSinceEpoch;
//     print("Inference took ${endTime - startTime}ms");
//   }
//
//   Future yolov2Tiny(File image) async {
//     int startTime = new DateTime.now().millisecondsSinceEpoch;
//     var recognitions = await Tflite.detectObjectOnImage(
//       path: image.path,
//       model: "YOLO",
//       threshold: 0.3,
//       imageMean: 0.0,
//       imageStd: 255.0,
//       numResultsPerClass: 1,
//     );
//     // var imageBytes = (await rootBundle.load(image.path)).buffer;
//     // img.Image oriImage = img.decodeJpg(imageBytes.asUint8List());
//     // img.Image resizedImage = img.copyResize(oriImage, 416, 416);
//     // var recognitions = await Tflite.detectObjectOnBinary(
//     //   binary: imageToByteListFloat32(resizedImage, 416, 0.0, 255.0),
//     //   model: "YOLO",
//     //   threshold: 0.3,
//     //   numResultsPerClass: 1,
//     // );
//     setState(() {
//       _recognitions = recognitions;
//     });
//     int endTime = new DateTime.now().millisecondsSinceEpoch;
//     print("Inference took ${endTime - startTime}ms");
//   }
//
//   Future ssdMobileNet(File image) async {
//     int startTime = new DateTime.now().millisecondsSinceEpoch;
//     var recognitions = await Tflite.detectObjectOnImage(
//       path: image.path,
//       numResultsPerClass: 1,
//     );
//     // var imageBytes = (await rootBundle.load(image.path)).buffer;
//     // img.Image oriImage = img.decodeJpg(imageBytes.asUint8List());
//     // img.Image resizedImage = img.copyResize(oriImage, 300, 300);
//     // var recognitions = await Tflite.detectObjectOnBinary(
//     //   binary: imageToByteListUint8(resizedImage, 300),
//     //   numResultsPerClass: 1,
//     // );
//     setState(() {
//       _recognitions = recognitions;
//     });
//     int endTime = new DateTime.now().millisecondsSinceEpoch;
//     print("Inference took ${endTime - startTime}ms");
//   }
//
//   Future segmentMobileNet(File image) async {
//     int startTime = new DateTime.now().millisecondsSinceEpoch;
//     var recognitions = await Tflite.runSegmentationOnImage(
//       path: image.path,
//       imageMean: 127.5,
//       imageStd: 127.5,
//     );
//
//     setState(() {
//       _recognitions = recognitions;
//     });
//     int endTime = new DateTime.now().millisecondsSinceEpoch;
//     print("Inference took ${endTime - startTime}");
//   }
//
//   Future poseNet(File image) async {
//     int startTime = new DateTime.now().millisecondsSinceEpoch;
//     var recognitions = await Tflite.runPoseNetOnImage(
//       path: image.path,
//       numResults: 2,
//     );
//
//     print(recognitions);
//
//     setState(() {
//       _recognitions = recognitions;
//     });
//     int endTime = new DateTime.now().millisecondsSinceEpoch;
//     print("Inference took ${endTime - startTime}ms");
//   }
//
//   onSelect(model) async {
//     setState(() {
//       _busy = true;
//       _model = model;
//       _recognitions = null;
//     });
//     await loadModel();
//
//     if (_image != null)
//       predictImage(_image!);
//     else
//       setState(() {
//         _busy = false;
//       });
//   }
//
//   List<Widget> renderBoxes(Size screen) {
//     if (_recognitions == null) return [];
//     if (_imageHeight == null || _imageWidth == null) return [];
//
//     double factorX = screen.width;
//     double factorY = _imageHeight! / _imageWidth! * screen.width;
//     Color blue = Color.fromRGBO(37, 213, 253, 1.0);
//     return _recognitions!.map((re) {
//       return Positioned(
//         left: re["rect"]["x"] * factorX,
//         top: re["rect"]["y"] * factorY,
//         width: re["rect"]["w"] * factorX,
//         height: re["rect"]["h"] * factorY,
//         child: Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.all(Radius.circular(8.0)),
//             border: Border.all(
//               color: blue,
//               width: 2,
//             ),
//           ),
//           child: Text(
//             "${re["detectedClass"]} ${(re["confidenceInClass"] * 100).toStringAsFixed(0)}%",
//             style: TextStyle(
//               background: Paint()..color = blue,
//               color: Colors.white,
//               fontSize: 12.0,
//             ),
//           ),
//         ),
//       );
//     }).toList();
//   }
//
//   List<Widget> renderKeypoints(Size screen) {
//     if (_recognitions == null) return [];
//     if (_imageHeight == null || _imageWidth == null) return [];
//
//     double factorX = screen.width;
//     double factorY = _imageHeight! / _imageWidth! * screen.width;
//
//     var lists = <Widget>[];
//     _recognitions!.forEach((re) {
//       var color = Color((Random().nextDouble() * 0xFFFFFF).toInt() << 0)
//           .withOpacity(1.0);
//       var list = re["keypoints"].values.map<Widget>((k) {
//         return Positioned(
//           left: k["x"] * factorX - 6,
//           top: k["y"] * factorY - 6,
//           width: 100,
//           height: 12,
//           child: Text(
//             "● ${k["part"]}",
//             style: TextStyle(
//               color: color,
//               fontSize: 12.0,
//             ),
//           ),
//         );
//       }).toList();
//
//       lists..addAll(list);
//     });
//
//     return lists;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     List<Widget> stackChildren = [];
//
//     if (_model == deeplab && _recognitions != null) {
//       stackChildren.add(Positioned(
//         top: 0.0,
//         left: 0.0,
//         width: size.width,
//         child: _image == null
//             ? Text('No image selected.')
//             : Container(
//                 decoration: BoxDecoration(
//                     image: DecorationImage(
//                         alignment: Alignment.topCenter,
//                         image: MemoryImage(
//                             Uint8List.fromList(List<int>.from(_recognitions!))),
//                         fit: BoxFit.fill)),
//                 child: Opacity(opacity: 0.3, child: Image.file(_image!))),
//       ));
//     } else {
//       stackChildren.add(Positioned(
//         top: 0.0,
//         left: 0.0,
//         width: size.width,
//         child:
//             _image == null ? Text('No image selected.', style: TextStyle(
//               color: Colors.white,
//             ),) : Image.file(_image!),
//       ));
//     }
//
//     if (_model == mobile) {
//       stackChildren.add(Center(
//         child: Column(
//           children: _recognitions != null
//               ? _recognitions!.map((res) {
//                   return Text(
//                     "${res["index"]} - ${res["label"]}: ${res["confidence"].toStringAsFixed(3)}",
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 20.0,
//                       background: Paint()..color = Colors.white,
//                     ),
//                   );
//                 }).toList()
//               : [],
//         ),
//       ));
//     } else if (_model == ssd || _model == yolo) {
//       stackChildren.addAll(renderBoxes(size));
//     } else if (_model == posenet) {
//       stackChildren.addAll(renderKeypoints(size));
//     }
//
//     if (_busy) {
//       stackChildren.add(const Opacity(
//         child: ModalBarrier(dismissible: false, color: Colors.grey),
//         opacity: 0.3,
//       ));
//       stackChildren.add(const Center(child: CircularProgressIndicator()));
//     }
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Object Detection From Image"),
//         centerTitle: true,
//       ),
//       body: Container(
//         child: Stack(
//           fit: StackFit.expand,
//           alignment: Alignment.center,
//           children: [
//             ClipRRect(
//               borderRadius: BorderRadius.zero,
//               child: Container(
//                 color: Color.fromARGB(255, 16, 39, 83),
//               ),
//             ),
//             Positioned(
//               left: 0.0,
//               top: 0.0,
//               right: null,
//               bottom: null,
//               width: 360.0,
//               height: 140.0,
//               child: Container(
//                 width: 360.0,
//                 height: 140.0,
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.zero,
//                   child: Image.asset(
//                     "assets/images/fromgallery.png",
//                     color: null,
//                     fit: BoxFit.cover,
//                     width: 360.0,
//                     height: 194.0,
//                     colorBlendMode: BlendMode.dstATop,
//                   ),
//                 ),
//               ),
//             ),
//             Positioned(
//               width: 360.0,
//               height: 140.0,
//               top: 100,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: <Widget>[
//                   ElevatedButton(onPressed: (){onSelect(mobile);}, child: const Text("MobileNet")),
//                   ElevatedButton(onPressed: (){onSelect(ssd);}, child: const Text("SSD MobileNet")),
//                   ElevatedButton(onPressed: (){onSelect(yolo);}, child: const Text("Yolo V2")),
//                 ],
//               ),
//             ),
//
//             Positioned(
//               width: 340,
//               height: 390.0,
//               top: 203,
//               child: Stack(
//                 children: stackChildren,
//               ),
//             ),
//
//             Positioned(
//               left: 265.0,
//               top: 605.0,
//               right: null,
//               bottom: null,
//               width: 60.0,
//               height: 60.0,
//               child: GestureDetector(
//                 onTap: () => predictImagePicker(),
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.zero,
//                   child: Image.asset(
//                     "assets/images/g2.png",
//                     color: null,
//                     fit: BoxFit.cover,
//                     colorBlendMode: BlendMode.dstATop,
//                   ),
//                 ),
//               ),
//             ),
//             Positioned(
//               left: 30.0,
//               top: 600.0,
//               right: null,
//               bottom: null,
//               width: 65.0,
//               height: 60.0,
//               child: Container(
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.zero,
//                   child: Image.asset(
//                     "assets/images/pikachu.png",
//                     color: null,
//                     fit: BoxFit.cover,
//                     colorBlendMode: BlendMode.dstATop,
//                   ),
//                 ),
//               ),
//             ),
//
//           ],
//         ),
//       ),
//       /*appBar: AppBar(
//         title: const Text('Object Detection From Image'),
//         actions: <Widget>[
//           PopupMenuButton<String>(
//             onSelected: onSelect,
//             itemBuilder: (context) {
//               List<PopupMenuEntry<String>> menuEntries = [
//                 const PopupMenuItem<String>(
//                   child: Text(mobile),
//                   value: mobile,
//                 ),
//                 const PopupMenuItem<String>(
//                   child: Text(ssd),
//                   value: ssd,
//                 ),
//                 const PopupMenuItem<String>(
//                   child: Text(yolo),
//                   value: yolo,
//                 ),
//                 const PopupMenuItem<String>(
//                   child: Text(deeplab),
//                   value: deeplab,
//                 ),
//                 const PopupMenuItem<String>(
//                   child: Text(posenet),
//                   value: posenet,
//                 )
//               ];
//               return menuEntries;
//             },
//           )
//         ],
//       ),
//       body: Stack(
//         children: stackChildren,
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: predictImagePicker,
//         tooltip: 'Pick Image',
//         child: Icon(Icons.image),
//       ),*/
//     );
//   }
// }
