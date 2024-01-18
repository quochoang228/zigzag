import 'package:flutter/material.dart';

class AppCoordinator {
  static final navigatorKey = GlobalKey<NavigatorState>();
  static BuildContext get context => navigatorKey.currentState!.context;
}