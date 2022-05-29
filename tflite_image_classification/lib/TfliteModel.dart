import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';
import 'package:flutter_tts/flutter_tts.dart';

class TfliteModel extends StatefulWidget {
  //const TfliteModel({Key? key}) : super(key: key);

  final FlutterTts flutterTts = FlutterTts();

  @override
  _TfliteModelState createState() => _TfliteModelState();
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
    res=(await Tflite.loadModel(model: "assets/model.tflite",labels: "assets/labels.txt"))!;
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
      //print(await flutterTts.getVoices);
      await flutterTts.speak(text);
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image Classification"),
      ),
      body: ListView(
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
                child: Text("No image selected"),
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
                                "assets/Speaker-icon.png",
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
