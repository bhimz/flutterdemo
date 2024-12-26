import 'package:flutter/material.dart';

enum TransitionType {
  slideUp,
  slideLeft,
}

Offset _createOffset(TransitionType transition) {
  switch (transition) {
    case TransitionType.slideUp:
      return const Offset(0.0, 1.0);
    case TransitionType.slideLeft:
      return const Offset(1.0, 0.0);
  }
}

Route createRoute({required Widget target, TransitionType transition = TransitionType.slideUp}) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => target,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final begin = _createOffset(transition);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var offsetAnimation = animation.drive(tween);

      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
  );
}