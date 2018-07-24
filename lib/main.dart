import 'package:flutter/material.dart';
import 'package:frost_transition/overlay_menu_page.dart';
import 'package:frost_transition/widgets/menu_button.dart';
import 'package:video_player/video_player.dart';

void main() => runApp(new FrostTransitionExampleApp());

class FrostTransitionExampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => new MaterialApp(home: new _HomePage());
}

class _HomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<_HomePage> {
  VideoPlayerController videoController;
  bool isShowingMenu = false;

  @override
  void initState() {
    videoController = new VideoPlayerController.asset("res/video.mp4")
      ..setLooping(true)
      ..initialize().then((_) => videoController.play().then((_) => setState(() {})));
    super.initState();
  }

  @override
  void dispose() {
    videoController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        color: Colors.black,
        child: new Stack(
          children: <Widget>[
            new Container(
              child: new Center(
                child: new AspectRatio(
                  aspectRatio: 360 / 640,
                  child: new VideoPlayer(videoController),
                ),
              ),
            ),
            new Positioned(
              left: 24.0,
              right: 24.0,
              bottom: 24.0,
              child: new MenuButton(
                text: "Show Menu",
                onTap: () {
                  setState(() => isShowingMenu = true);

                  /// Open the menu here, this will play the Frost Transition.
                  Navigator.of(context).push(new OverlayMenuPage()).then((_) => setState(() => isShowingMenu = false));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
