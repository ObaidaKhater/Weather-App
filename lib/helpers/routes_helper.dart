import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class RouteHelper {
  RouteHelper._();

  static RouteHelper routeHelper = RouteHelper._();
  GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();

// push
  push(Widget widget) {
    navKey.currentState!.push(
      PageTransition(
        type: PageTransitionType.fade,
        child: widget,
      ),
    );
  }

// push replacement
  pushReplacement(Widget widget) {
    navKey.currentState!.pushReplacement(
      PageTransition(
        type: PageTransitionType.fade,
        child: widget,
      ),
    );
  }

// push and remove until
  pushAndRemoveUntil(Widget widget) {
    navKey.currentState!.pushAndRemoveUntil(
        PageTransition(
          type: PageTransitionType.fade,
          child: widget,
        ),
        (route) => false);
  }

// pop
  pop({var values}) {
    navKey.currentState!.pop(values);
  }

// close dialog
  closeDialog() {
    Navigator.of(RouteHelper.routeHelper.navKey.currentContext!,
            rootNavigator: true)
        .pop();
  }
}
