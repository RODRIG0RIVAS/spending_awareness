import 'package:flutter/material.dart';

class MyTweens {
  static final _opacityTween = Tween<double>(begin: 0.0, end: 1.0);

  TweenAnimationBuilder getOpacityAnimationBuilder(
      {Widget toAnimateWidget(context, opacityValue, widget)}) {
    return TweenAnimationBuilder(
        tween: _opacityTween,
        curve: Curves.easeInOut,
        duration: Duration(milliseconds: 800),
        builder: ((context, opacityValue, widget) {
          return toAnimateWidget(context, opacityValue, widget);
        }));
  }

  TweenAnimationBuilder getEdgeInsetsAnimationBuilder(
      {EdgeInsets beginEdgeInsets,
      EdgeInsets endEdgeInsets,
      Widget toAnimateWidget(context, opacityValue, widget)}) {
    return TweenAnimationBuilder(
      tween: Tween<EdgeInsets>(begin: beginEdgeInsets, end: endEdgeInsets),
      duration: Duration(milliseconds: 1000),
      curve: Curves.easeOutQuint,
      builder: ((context, edgeInsetsValue, widget) {
        return toAnimateWidget(context, edgeInsetsValue, widget);
      }),
    );
  }
}
