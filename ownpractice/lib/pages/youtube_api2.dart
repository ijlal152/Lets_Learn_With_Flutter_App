import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

void main() {
  runApp(const YoutubeApiApp_two());
}

class YoutubeApiApp_two extends StatelessWidget {
  const YoutubeApiApp_two({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Youtube Video',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: YoutubeVideoTwo(),
    );
  }
}

class YoutubeVideoTwo extends StatefulWidget {
  const YoutubeVideoTwo({Key? key}) : super(key: key);

  @override
  State<YoutubeVideoTwo> createState() => _YoutubeVideoTwoState();
}

class _YoutubeVideoTwoState extends State<YoutubeVideoTwo> {
  YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: 'bKNY3QDBJiY',
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
