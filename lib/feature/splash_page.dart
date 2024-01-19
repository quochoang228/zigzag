import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:zigzag/generated/assets.gen.dart';
import 'package:zigzag/router/paths.dart';
import 'package:zigzag/theme/base_color.dart';

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
      backgroundColor: BaseColors.tintPink,
      body: Center(
        child: MyAssets.icons.logo.svg(
          width: MediaQuery.sizeOf(context).width * 0.15,
          height: MediaQuery.sizeOf(context).width * 0.15,
          colorFilter: const ColorFilter.mode(
            BaseColors.black500,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
