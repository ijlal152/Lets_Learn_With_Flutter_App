import 'package:flutter/material.dart';
import 'package:ownpractice/helper/transform.dart';
import 'package:flutter_tts/flutter_tts.dart';
class Text_to_Speech extends StatelessWidget {
  const Text_to_Speech({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TxtToSpeech(),
    );
  }
}

class TxtToSpeech extends StatelessWidget {
  //const TxtToSpeech({Key? key}) : super(key: key);

  final FlutterTts flutterTts = FlutterTts();

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
        title: Text("Convert Text to Speech"),
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
                    "assets/images/speak.jpg",
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
              left: 120.0,
              top: 212.0,
              right: null,
              bottom: null,
              child: Text(
                '''Text to Speech''',
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
              left: 60.0,
              top: 271.0,
              right: null,
              bottom: null,
              width: 282.0,
              height: 80.0,
              child:
              Text(
                '''Type the text in the given field''',
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
              left: 45.0,
              top: 320.0,
              right: null,
              bottom: null,
              width: 270.0,
              child: TextField(
                controller: textEditingController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  fillColor: Colors.orange,
                  filled: true,
                  border: OutlineInputBorder(),
                  hintText: 'Enter here',
                  hintStyle: TextStyle(
                    color: Colors.white,
                  ),
                  hoverColor: Colors.white,
                ),
              ),
            ),

            Positioned(
              left: 139.0,
              top: 410.0,
              right: null,
              bottom: null,
              width: 82.0,
              height: 78.0,
              child: GestureDetector(
                onTap: () => speak(textEditingController.text),
                child: Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.zero,
                    child: Image.asset(
                      "assets/images/Speaker-icon.png",
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
