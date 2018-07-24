import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frost_transition/frost_transition.dart';
import 'package:frost_transition/widgets/menu_button.dart';

/// This is where the magic happens.
/// A [PopupRoute] with a transparent background and a [FrostTransition] that increase the value of the Frosted Glass blur effect over a short period of time.
class OverlayMenuPage extends PopupRoute<Null> {
  static const double frostAnimationStartValue = 0.0;
  static const double frostAnimationEndValue = 10.0;

  @override
  Color get barrierColor => null;

  @override
  bool get barrierDismissible => true;

  @override
  String get barrierLabel => "Close";

  @override
  Widget buildTransitions(
          BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) =>

      /// The blur is just done here.
      new FrostTransition(
        animation: new Tween<double>(
          begin: frostAnimationStartValue,
          end: frostAnimationEndValue,
        ).animate(animation),
        child: child,
      );

  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) =>
      new _PageLayout();

  @override
  Duration get transitionDuration => const Duration(milliseconds: 300);
}

class _PageLayout extends StatefulWidget {
  @override
  _PageLayoutState createState() => new _PageLayoutState();
}

/// Just a nice dummy UI.
class _PageLayoutState extends State<_PageLayout> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.transparent,
      body: new Builder(
        builder: (BuildContext context) => new Padding(
              padding: new EdgeInsets.all(24.0),
              child: new Column(
                children: <Widget>[
                  new Padding(padding: new EdgeInsets.only(top: MediaQuery.of(context).padding.top + 24.0)),
                  new Text(
                    "Frozen",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).primaryTextTheme.headline,
                  ),
                  new Padding(padding: new EdgeInsets.only(top: 32.0)),
                  new MenuButton(
                    text: "Let it go",
                    onTap: () => Scaffold.of(context).showSnackBar(
                          new SnackBar(
                            content: const Text('Can\'t hold it back anymore'),
                          ),
                        ),
                  ),
                  new Padding(padding: new EdgeInsets.only(top: 16.0)),
                  new MenuButton(
                    text: "Let it go!",
                    onTap: () => Scaffold.of(context).showSnackBar(
                          new SnackBar(
                            content: const Text('The cold never bothered me anyway!'),
                          ),
                        ),
                  ),
                  new Expanded(
                    child: new Column(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
                      new MenuButton(
                        text: "Back",
                        onTap: () => Navigator.of(context).pop(),
                      ),
                    ]),
                  )
                ],
              ),
            ),
      ),
    );
  }
}
