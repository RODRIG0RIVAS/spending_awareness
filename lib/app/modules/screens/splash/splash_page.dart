import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:spending_awareness/generated/l10n.dart';
import 'splash_controller.dart';

class SplashPage extends StatefulWidget {
  final String title;
  const SplashPage({Key key, this.title = "Spending Awareness"})
      : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends ModularState<SplashPage, SplashController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.green,
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Observer(builder: (_) {
            if (!controller.startToUp) {
              return Container();
            }
            return TweenAnimationBuilder(
              duration: Duration(milliseconds: 1000),
              curve: Curves.easeInOut,
              tween: Tween<double>(begin: 0.0, end: 1.0),
              builder: ((context, opacityValue, widget) {
                return Opacity(
                  opacity: opacityValue,
                  child: Container(
                    child: Text(S.of(context).lbl_title,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w500)),
                  ),
                );
              }),
            );
          }),
          centerTitle: true,
          elevation: 0.0,
        ),
        body: Observer(builder: (_) {
          if (!controller.startToUp) {
            return Container(
              margin: const EdgeInsets.only(top: 42.5),
              alignment: Alignment.center,
              child: Text(S.of(context).lbl_title,
                  style: TextStyle(
                      fontSize: 28.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w500)),
            );
          }

          return Center(
              child: TweenAnimationBuilder(
            duration: Duration(milliseconds: 800),
            curve: Curves.easeInOut,
            tween: Tween<Alignment>(
                begin: Alignment.center, end: Alignment.topCenter),
            builder: ((context, alignment, widget) {
              return TweenAnimationBuilder(
                duration: Duration(milliseconds: 800),
                curve: Curves.easeInOut,
                tween: Tween<double>(begin: 28.0, end: 20.0),
                builder: ((context, fontSizeValue, widget) {
                  return TweenAnimationBuilder(
                    duration: Duration(milliseconds: 800),
                    curve: Curves.easeInOut,
                    tween: Tween<double>(begin: 1.0, end: 0.0),
                    builder: ((context, opacityValue, widget) {
                      return Opacity(
                        opacity: opacityValue,
                        child: Container(
                          margin: const EdgeInsets.only(top: 42.5),
                          alignment: alignment,
                          child: Text(S.of(context).lbl_title,
                              style: TextStyle(
                                  fontSize: fontSizeValue,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500)),
                        ),
                      );
                    }),
                  );
                }),
              );
            }),
          ));
        }));
  }
}
