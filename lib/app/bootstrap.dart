import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../theme/base_color.dart';

Future<void> bootstrap({required Widget app}) async {
  WidgetsFlutterBinding.ensureInitialized();

  // set orientations
  setPreferredOrientations();

  // set style UI system
  setSystemUI();

  // init firebase
  // await NotificationService.init();

  runZonedGuarded<Future<void>>(() async {
    runApp(
      ProviderScope(
        child: app,
      ),
    );
  }, (error, stackTrace) async {
    if (kDebugMode) {
      // in development, print error and stack trace
      // ignore: avoid_print
      print('$error');

      // ignore: avoid_print
      print('$stackTrace');
    } else {
      // report to a error tracking system in production
    }
  });
  // This captures errors reported by the Flutter framework.
  FlutterError.onError = (FlutterErrorDetails details) async {
    final dynamic exception = details.exception;
    final StackTrace? stackTrace = details.stack;
    if (kDebugMode) {
      // In development mode simply print to console.
      FlutterError.dumpErrorToConsole(details);
    } else {
      // In production mode report to the application zone
      if (stackTrace != null) {
        Zone.current.handleUncaughtError(exception, stackTrace);
      }
    }
  };
}

Future<void> setPreferredOrientations() {
  // disable disable Landscape mode
  return SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    // DeviceOrientation.landscapeRight,
    // DeviceOrientation.landscapeLeft,
  ]);
}

void setSystemUI() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,

      // background status bar
      systemNavigationBarColor: BaseColors.background,

      // background Navigation
      statusBarIconBrightness: Brightness.dark,

      statusBarBrightness: Brightness.light,

      // set màu cho icon của status bar
      // systemNavigationBarDividerColor: Colors.orangeAccent,
    ),
  );
}
