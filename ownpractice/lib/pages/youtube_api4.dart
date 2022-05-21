import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

void main() {
  runApp(const YoutubeApiAppFour());
}

class YoutubeApiAppFour extends StatelessWidget {
  const YoutubeApiAppFour({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Youtube Video',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: YoutubeVideoFour(),
    );
  }
}

class YoutubeVideoFour extends StatefulWidget {
  const YoutubeVideoFour({Key? key}) : super(key: key);

  @override
  State<YoutubeVideoFour> createState() => _YoutubeVideoFourState();
}

class _YoutubeVideoFourState extends State<YoutubeVideoFour> {
  YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: '7s3nBOSXZeo',
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Youtube Videos'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Cartoon" , style: TextStyle(
              fontSize: 15,
            )),
            SizedBox(
              height: 10,
            ),
            YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
              progressIndicatorColor: Colors.blueAccent,
            ),
          ],
        ),
      ),
    );
  }
}
