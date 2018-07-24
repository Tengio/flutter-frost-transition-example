import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MenuButton extends StatelessWidget {
  final GestureTapCallback onTap;
  final String text;

  MenuButton({
    this.onTap,
    this.text = "Button",
  });

  @override
  Widget build(BuildContext context) => new GestureDetector(
        onTap: onTap,
        child: new Container(
          height: 54.0,
          decoration: new BoxDecoration(
            border: new Border.all(color: Colors.white),
            color: Colors.black.withOpacity(0.3),
          ),
          child: new Row(
            children: <Widget>[
              new Expanded(
                child: new Text(
                  text,
                  textAlign: TextAlign.center,
                  style: new TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      );
}
