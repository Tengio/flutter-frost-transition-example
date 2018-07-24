import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FrostTransition extends AnimatedWidget {
  final Widget child;
  final Animation<double> animation;

  FrostTransition({this.animation, this.child}) : super(listenable: animation);

  @override

  /// Use a [BackdropFilter] with [ImageFilter.blur] to do the Frosted Glass effect.
  /// See https://stackoverflow.com/questions/43550853/how-do-i-do-the-frosted-glass-effect-in-flutter for original source.
  Widget build(BuildContext context) => new BackdropFilter(
        filter: new ImageFilter.blur(sigmaX: animation.value, sigmaY: animation.value),
        child: new Container(
          child: child,
        ),
      );
}
