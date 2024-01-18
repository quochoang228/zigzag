import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'coordinator.dart';

class AppService {
  static GlobalKey get navigatorKey => AppCoordinator.navigatorKey;

  Future<void> openDialog(Widget widget, bool barrierDismissible) async {
    showDialog(context: navigatorKey.currentState!.context, builder: (_) => widget, barrierDismissible: barrierDismissible);
  }

  void pushReplacement(String path) {
    navigatorKey.currentState!.context.pushReplacement(path);
  }
}
