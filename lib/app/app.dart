import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../l10n/l10n.dart';
import '../router/router_config.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      builder: (context, child) {
        // final MediaQueryData data = MediaQuery.of(context);
        // return MediaQuery(
        //   data: data.copyWith(
        //     textScaleFactor: 1.0,
        //   ),
        //   child: child!,
        // );
        return child!;
      },
      debugShowCheckedModeBanner: false,
      routerConfig: goRouterConfiguration,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
