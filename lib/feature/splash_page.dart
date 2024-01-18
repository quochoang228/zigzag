import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:zigzag/l10n/l10n.dart';
import 'package:zigzag/router/paths.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        var duration = const Duration(seconds: 2);
        Timer(duration, () {
          context.pushReplacement(Paths.root);
        });
      },
    );
    return Scaffold(
      body: Center(
        child: Text(context.l10n.appName),
      ),
    );
  }
}
