import 'package:flutter/material.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ExtractTextFromImage extends StatelessWidget {
  const ExtractTextFromImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ExtractText(),
    );
  }
}

class ExtractText extends StatefulWidget {
  ExtractText({Key? key}) : super(key: key);

  @override
  State<ExtractText> createState() => _ExtractTextState();
}

class _ExtractTextState extends State<ExtractText> {

  String result = "";
  File? image;
  ImagePicker? imagePicker;
  final FlutterTts flutterTts = FlutterTts();



  pickImageFromGallery() async {
    PickedFile? pickedFile =
    await imagePicker!.getImage(source: ImageSource.gallery);
    image = File(pickedFile!.path);

    setState(() {
      // ignore: unnecessary_statements
      image;
      performaImageLabeling();
    });
  }
  captureImagewithCamera() async {
    PickedFile? pickedFile =
    await imagePicker!.getImage(source: ImageSource.camera);
    image = File(pickedFile!.path);

    setState(() {
      // ignore: unnecessary_statements
      image;
      performaImageLabeling();
    });
  }

  performaImageLabeling() async{
    final FirebaseVisionImage firebaseVisionImage = FirebaseVisionImage.fromFile(image);
    final TextRecognizer recognizer = FirebaseVision.instance.textRecognizer();
    VisionText visionText = await recognizer.processImage(firebaseVisionImage);
    result = "";
    setState((){
      for (TextBlock block in visionText.blocks) {
        //final String txt = block.text;
        for (TextLine line in block.lines) {
          for (TextElement element in line.elements) {
            result += element.text + " ";
            print(result);
          }
        }
        result += "\n\n";
      }
    });
  }

  @override
  void initState() {
    super.initState();
    imagePicker = ImagePicker();
  }


  @override
  Widget build(BuildContext context) {

    //TextEditingController textEditingController = TextEditingController();
    speak(String text) async{
      await flutterTts.setLanguage("en-US");
      await flutterTts.setPitch(1);
      //print(await flutterTts.getVoices);
      await flutterTts.speak(text);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Extract Text From Image'),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/back.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              width: 100,
            ),
            Container(
              height: 280,
              width: 250,
              margin: EdgeInsets.only(top: 70),
              padding:
              const EdgeInsets.only(left: 28.0, bottom: 5.0, right: 18.0),
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    result,
                    style: TextStyle(fontSize: 16.0, color: Colors.black),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/note.jpg"),
                    fit: BoxFit.cover,
                  )),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0, right: 140.0),
              child: Stack(
                children: [
                  Stack(
                    children: [
                      Center(
                        child: Image.asset(
                          'assets/images/pin.png',
                          height: 240,
                          width: 240,
                        ),
                      ),
                    ],
                  ),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        pickImageFromGallery();
                      },
                      onLongPress: () {
                        captureImagewithCamera();
                      },
                      child: Container(
                        margin: const EdgeInsets.only(top: 25.0),
                        // ignore: unnecessary_null_comparison
                        child: image != null
                            ? Image.file(
                          image!,
                          width: 140.0,
                          height: 192.0,
                          fit: BoxFit.fill,
                        )
                            : Container(
                          width: 240,
                          height: 200,
                          child: const Icon(
                            Icons.camera_front,
                            size: 100,
                            color: Colors.grey,
                          ),
                        ),
                      ), // end here
                    ),
                  ),
                  Positioned(
                    width: 60,
                      height: 60,
                      left: 100.0,
                      child: GestureDetector(
                        onTap: ()=> speak(result),
                        child: Container(
                          child: Image.asset(
                            "assets/images/Speaker-icon.png",
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
          ],
        ),
      ),
    );
  }
}


