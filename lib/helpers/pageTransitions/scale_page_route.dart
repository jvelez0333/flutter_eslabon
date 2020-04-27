import 'package:flutter/material.dart';

class ScalePageRoute extends PageRouteBuilder {
  final Widget widget;

  ScalePageRoute({this.widget}) : super(
    pageBuilder: (context, animation, secondaryAnimation) => widget,
    transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
      return ScaleTransition(
        scale: animation,
        alignment: Alignment.centerRight,
        child: child,
      );
    }
  );
}