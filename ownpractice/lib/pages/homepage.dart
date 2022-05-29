import 'package:flutter/material.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Lets learn with flutter"),
          centerTitle: true
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
              left: 145.0,
              top: 15.0,
              //right: null,
              bottom: null,
              //width: 101.0,
              height: 24.0,
              child: Text(
                '''Entertainment''',
                overflow: TextOverflow.visible,
                textAlign: TextAlign.left,
                style: TextStyle(
                  //height: 1.171875,
                  fontSize: 18.0,
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.w900,
                  color: Color.fromARGB(255, 255, 255, 255),
                  /* letterSpacing: -0.28, */
                ),
              ),
            ),
            Positioned(
              left: 8.0,
              top: 50.0,
              right: null,
              bottom: null,
              width: 343.0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(14.0),
                child: LayoutBuilder(
                    builder: (BuildContext context, BoxConstraints constraints) {
                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Container(
                          //color: Color.fromARGB(200, 168, 135, 164),
                          width: 750.0,
                          height: 262.0,
                          child: Stack(
                            fit: StackFit.expand,
                            alignment: Alignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(14.0),
                                child: Container(
                                  //color: Color.fromARGB(127, 16, 39, 84),
                                ),
                              ),
                              Positioned(
                                left: 0.0,
                                top: 0.0,
                                right: null,
                                bottom: null,
                                width: 181.0,
                                height: 260.0,
                                child: GestureDetector(
                                  onTap: ()=> Navigator.pushNamed(context, '/YoutubeApi'),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(14.0),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(14.0),
                                      child: Image.asset(
                                        "assets/images/c1.jpg",
                                        color: null,
                                        fit: BoxFit.cover,
                                        //colorBlendMode: BlendMode.dstATop,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 193.0,
                                top: 0.0,
                                right: null,
                                bottom: null,
                                width: 181.0,
                                height: 260.0,
                                child: GestureDetector(
                                  onTap: ()=> Navigator.pushNamed(context, '/YoutubeApi2'),
                                  child: Container(
                                    width: 181.0,
                                    height: 260.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(14.0),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(14.0),
                                      child: Image.asset(
                                        "assets/images/c2.jpg",
                                        color: null,
                                        fit: BoxFit.cover,
                                        width: 181.0,
                                        height: 260.0,
                                        colorBlendMode: BlendMode.dstATop,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 579.0,
                                top: 0.0,
                                right: null,
                                bottom: null,
                                width: 181.0,
                                height: 260.0,
                                child: GestureDetector(
                                  onTap: ()=> Navigator.pushNamed(context, '/YoutubeApi3'),
                                  child: Container(
                                    width: 181.0,
                                    height: 260.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(14.0),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(14.0),
                                      child: Image.asset(
                                        "assets/images/c3.jpg",
                                        color: null,
                                        fit: BoxFit.cover,
                                        width: 181.0,
                                        height: 260.0,
                                        colorBlendMode: BlendMode.dstATop,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 386.0,
                                top: 0.0,
                                right: null,
                                bottom: null,
                                width: 181.0,
                                height: 260.0,
                                child: GestureDetector(
                                  onTap: ()=> Navigator.pushNamed(context, '/YoutubeApi4'),
                                  child: Container(
                                    width: 181.0,
                                    height: 260.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(14.0),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(14.0),
                                      child: Image.asset(
                                        "assets/images/c4.jpg",
                                        color: null,
                                        fit: BoxFit.cover,
                                        width: 181.0,
                                        height: 260.0,
                                        colorBlendMode: BlendMode.dstATop,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }
                ),
              ),
            ),
            Positioned(
              left: 12.0,
              top: 340.0,
              right: null,
              bottom: null,
              width: 116.0,
              height: 23.0,
              child: Text(
                '''Learn with AI''',
                overflow: TextOverflow.visible,
                textAlign: TextAlign.left,
                style: TextStyle(
                  height: 1.171875,
                  fontSize: 18.0,
                  fontFamily: 'Work Sans',
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(255, 255, 255, 255),
                  /* letterSpacing: -0.36, */
                ),
              ),
            ),

            Positioned(
              left: 325.0,
              top: 340.0,
              right: null,
              bottom: null,
              width: 23.0,
              height: 23.0,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.asset(
                    "assets/images/star.png",
                    color: null,
                    fit: BoxFit.cover,
                    colorBlendMode: BlendMode.dstATop,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 295.0,
              top: 340.0,
              right: null,
              bottom: null,
              width: 23.0,
              height: 23.0,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.asset(
                    "assets/images/star.png",
                    color: null,
                    fit: BoxFit.cover,
                    colorBlendMode: BlendMode.dstATop,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 265.0,
              top: 340.0,
              right: null,
              bottom: null,
              width: 23.0,
              height: 23.0,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.asset(
                    "assets/images/star.png",
                    color: null,
                    fit: BoxFit.cover,
                    colorBlendMode: BlendMode.dstATop,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 235.0,
              top: 340.0,
              right: null,
              bottom: null,
              width: 23.0,
              height: 23.0,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.asset(
                    "assets/images/star.png",
                    color: null,
                    fit: BoxFit.cover,
                    colorBlendMode: BlendMode.dstATop,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 205.0,
              top: 340.0,
              right: null,
              bottom: null,
              width: 23.0,
              height: 23.0,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.asset(
                    "assets/images/star.png",
                    color: null,
                    fit: BoxFit.cover,
                    colorBlendMode: BlendMode.dstATop,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 10.0,
              top: 375.0,
              right: null,
              bottom: null,
              width: 340.0,
              height: 275.0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(14.0),
                child: LayoutBuilder(
                    builder: (BuildContext context, BoxConstraints constraints) {
                      return SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Container(
                          height: 437.0,
                          width: 300.0,
                          //color: Color.fromARGB(211, 45, 255, 255),
                          child: Stack(children: [
                            Container(
                              width: constraints.maxWidth,
                              child:  Container(
                                width: 336.0,
                                //height: 237.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14.0),
                                ),
                                child: Stack(
                                  fit: StackFit.expand,
                                  alignment: Alignment.center,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(14.0),
                                      child: Container(
                                        //color: Color.fromARGB(127, 91, 109, 145),
                                      ),
                                    ),
                                    Positioned(             //  first rectangle
                                      left: 9.0,
                                      top: 15.0,
                                      right: null,
                                      bottom: null,
                                      width: 323.0,
                                      height: 76.0,
                                      child: GestureDetector(
                                        onTap: () => Navigator.pushNamed(context, '/RealTime'),
                                        child: Container(
                                          width: 310.0,
                                          height: 76.0,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(18.0),
                                          ),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(18.0),
                                            child: Container(
                                              color: Color.fromARGB(127, 91, 109, 145),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 26.0,
                                      top: 5.0,
                                      right: null,
                                      bottom: null,
                                      width: 75.0,
                                      height: 65.0,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10.0),
                                        ),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(10.0),
                                          child: Image.asset(
                                            "assets/images/realtime.png",
                                            color: null,
                                            fit: BoxFit.cover,
                                            colorBlendMode: BlendMode.dstATop,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 128.0,
                                      top: 26.0,
                                      right: null,
                                      bottom: null,
                                      width: 184.0,
                                      height: 18.0,
                                      child: Text(
                                        '''Real Time Object Detection''',
                                        overflow: TextOverflow.visible,
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          height: 1.171875,
                                          fontSize: 14.0,
                                          fontFamily: 'Work Sans',
                                          fontWeight: FontWeight.w600,
                                          color: Color.fromARGB(255, 255, 255, 255),
                                          /* letterSpacing: -0.28, */
                                        ),
                                      ),
                                    ),

                                    Positioned(
                                      left: 128.0,
                                      top: 63.0,
                                      right: null,
                                      bottom: null,
                                      width: 69.0,
                                      height: 18.0,
                                      child: Text(
                                        '''Click here''',
                                        overflow: TextOverflow.visible,
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          height: 1.171875,
                                          fontSize: 14.0,
                                          fontFamily: 'Work Sans',
                                          fontWeight: FontWeight.w700,
                                          color: Color.fromARGB(255, 255, 255, 255),
                                          /* letterSpacing: -0.28, */
                                        ),
                                      ),
                                    ),

                                    Positioned(
                                      left: 265.0,
                                      top: 63.0,
                                      right: null,
                                      bottom: null,
                                      width: 49.0,
                                      height: 18.0,
                                      child: Text(
                                        '''01 / 04''',
                                        overflow: TextOverflow.visible,
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          height: 1.171875,
                                          fontSize: 14.0,
                                          fontFamily: 'Work Sans',
                                          fontWeight: FontWeight.w900,
                                          color: Colors.white,
                                          /* letterSpacing: -0.28, */
                                        ),
                                      ),
                                    ),






                                    Positioned(     // second rectangle
                                      left: 9.0,
                                      top: 120.0,
                                      right: null,
                                      bottom: null,
                                      width: 323.0,
                                      height: 76.0,
                                      child: GestureDetector(
                                        onTap: () => Navigator.pushNamed(context, '/FromGallery'),
                                        child: Container(
                                          width: 310.0,
                                          height: 76.0,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(18.0),
                                          ),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(18.0),
                                            child: Container(
                                              color: Color.fromARGB(127, 91, 109, 145),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 22.0,
                                      top: 108.0,
                                      right: null,
                                      bottom: null,
                                      width: 85.0,
                                      height: 67.0,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10.0),
                                        ),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(10.0),
                                          child: Image.asset(
                                            "assets/images/g2.png",
                                            color: null,
                                            fit: BoxFit.cover,
                                            colorBlendMode: BlendMode.dstATop,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 265.0,
                                      top: 175.0,
                                      right: null,
                                      bottom: null,
                                      width: 51.0,
                                      height: 18.0,
                                      child: Text(
                                        '''02 / 04''',
                                        overflow: TextOverflow.visible,
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          height: 1.171875,
                                          fontSize: 14.0,
                                          fontFamily: 'Work Sans',
                                          fontWeight: FontWeight.w900,
                                          color: Colors.white,

                                          /* letterSpacing: -0.28, */
                                        ),
                                      ),
                                    ),

                                    Positioned(
                                      left: 128.0,
                                      top: 175.0,
                                      right: null,
                                      bottom: null,
                                      width: 69.0,
                                      height: 18.0,
                                      child: Text(
                                        '''Click here''',
                                        overflow: TextOverflow.visible,
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          height: 1.171875,
                                          fontSize: 14.0,
                                          fontFamily: 'Work Sans',
                                          fontWeight: FontWeight.w700,
                                          color: Color.fromARGB(255, 255, 255, 255),

                                          /* letterSpacing: -0.28, */
                                        ),
                                      ),
                                    ),

                                    Positioned(
                                      left: 128.0,
                                      top: 130.0,
                                      right: null,
                                      bottom: null,
                                      width: 185.0,
                                      height: 34.0,
                                      child:Text(
                                        '''Detect Object from gallery Images''',
                                        overflow: TextOverflow.visible,
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          height: 1.171875,
                                          fontSize: 14.0,
                                          fontFamily: 'Work Sans',
                                          fontWeight: FontWeight.w600,
                                          color: Color.fromARGB(255, 255, 255, 255),
                                          /* letterSpacing: -0.28, */
                                        ),
                                      ),
                                    ),

                                    Positioned(  // third rectangle
                                      left: 9.0,
                                      top: 225.0,
                                      right: null,
                                      bottom: null,
                                      width: 323.0,
                                      height: 76.0,
                                      child: GestureDetector(
                                        onTap: () => Navigator.pushNamed(context, '/TextToSpeech'),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(18.0),
                                          ),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(18.0),
                                            child: Container(
                                              color: Color.fromARGB(127, 91, 109, 145),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),

                                    Positioned(
                                      left: 24.0,
                                      top: 218.0,
                                      right: null,
                                      bottom: null,
                                      width: 85.0,
                                      height: 67.0,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10.0),
                                        ),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(10.0),
                                          child: Image.asset(
                                            "assets/images/Speaker-icon.png",
                                            color: null,
                                            fit: BoxFit.cover,
                                            colorBlendMode: BlendMode.dstATop,
                                          ),
                                        ),
                                      ),
                                    ),

                                    Positioned(
                                      left: 265.0,
                                      top: 279.0,
                                      right: null,
                                      bottom: null,
                                      width: 51.0,
                                      height: 18.0,
                                      child: Text(
                                        '''03 / 04''',
                                        overflow: TextOverflow.visible,
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          height: 1.171875,
                                          fontSize: 14.0,
                                          fontFamily: 'Work Sans',
                                          fontWeight: FontWeight.w900,
                                          color: Colors.white,
                                          /* letterSpacing: -0.28, */
                                        ),
                                      ),
                                    ),

                                    Positioned(
                                      left: 128.0,
                                      top: 238.0,
                                      right: null,
                                      bottom: null,
                                      width: 185.0,
                                      height: 18.0,
                                      child: Text(
                                        '''Text to Speech''',
                                        overflow: TextOverflow.visible,
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          height: 1.171875,
                                          fontSize: 14.0,
                                          fontFamily: 'Work Sans',
                                          fontWeight: FontWeight.w600,
                                          color: Color.fromARGB(255, 255, 255, 255),
                                          /* letterSpacing: -0.28, */
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                        left: 128.0,
                                        top: 279.0,
                                        right: null,
                                        bottom: null,
                                        width: 69.0,
                                        height: 18.0,
                                        child: Text(
                                          '''Click here''',
                                          overflow: TextOverflow.visible,
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            height: 1.171875,
                                            fontSize: 14.0,
                                            fontFamily: 'Work Sans',
                                            fontWeight: FontWeight.w700,
                                            color: Color.fromARGB(255, 255, 255, 255),
                                            /* letterSpacing: -0.28, */
                                          ),
                                        )),

                                    Positioned(     // fourth rectangle
                                      left: 9.0,
                                      top: 335.0,
                                      right: null,
                                      bottom: null,
                                      width: 323.0,
                                      height: 76.0,
                                      child: GestureDetector(
                                        onTap: () => Navigator.pushNamed(context, '/ExtractTextFromImage'),
                                        child: Container(
                                          width: 310.0,
                                          height: 76.0,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(18.0),
                                          ),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(18.0),
                                            child: Container(
                                              color: Color.fromARGB(127, 91, 109, 145),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 26.0,
                                      top: 320.0,
                                      right: null,
                                      bottom: null,
                                      width: 95.0,
                                      height: 78.0,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10.0),
                                        ),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(10.0),
                                          child: Image.asset(
                                            "assets/images/v1.png",
                                            color: null,
                                            fit: BoxFit.cover,
                                            colorBlendMode: BlendMode.dstATop,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 127.0,
                                      top: 347.0,
                                      right: null,
                                      bottom: null,
                                      width: 185.0,
                                      height: 18.0,
                                      child: Text(
                                        '''Extract Text From Image''',
                                        overflow: TextOverflow.visible,
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          height: 1.171875,
                                          fontSize: 14.0,
                                          fontFamily: 'Work Sans',
                                          fontWeight: FontWeight.w600,
                                          color: Color.fromARGB(255, 255, 255, 255),
                                          /* letterSpacing: -0.28, */
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 265.0,
                                      top: 390.0,
                                      right: null,
                                      bottom: null,
                                      width: 52.0,
                                      height: 18.0,
                                      child: Text(
                                        '''04 / 04''',
                                        overflow: TextOverflow.visible,
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          height: 1.171875,
                                          fontSize: 14.0,
                                          fontFamily: 'Work Sans',
                                          fontWeight: FontWeight.w900,
                                          color: Colors.white,
                                          /* letterSpacing: -0.28, */
                                        ),
                                      ),
                                    ),

                                    Positioned(
                                      left: 128.0,
                                      top: 390.0,
                                      right: null,
                                      bottom: null,
                                      width: 69.0,
                                      height: 18.0,
                                      child: Text(
                                        '''Click here''',
                                        overflow: TextOverflow.visible,
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          height: 1.171875,
                                          fontSize: 14.0,
                                          fontFamily: 'Work Sans',
                                          fontWeight: FontWeight.w700,
                                          color: Color.fromARGB(255, 255, 255, 255),
                                          /* letterSpacing: -0.28, */
                                        ),
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            ),
                          ],),
                        ),
                      );
                    }
                ),
              ),
            )
          ],
        ),
      ),

    );
  }
}


