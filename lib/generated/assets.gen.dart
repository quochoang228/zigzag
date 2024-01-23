/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/arrow-right.svg
  SvgGenImage get arrowRight =>
      const SvgGenImage('assets/icons/arrow-right.svg');

  /// File path: assets/icons/banner01.png
  AssetGenImage get banner01 =>
      const AssetGenImage('assets/icons/banner01.png');

  /// File path: assets/icons/banner02.png
  AssetGenImage get banner02 =>
      const AssetGenImage('assets/icons/banner02.png');

  /// File path: assets/icons/banner03.png
  AssetGenImage get banner03 =>
      const AssetGenImage('assets/icons/banner03.png');

  /// File path: assets/icons/example.png
  AssetGenImage get example => const AssetGenImage('assets/icons/example.png');

  /// File path: assets/icons/like.svg
  SvgGenImage get like => const SvgGenImage('assets/icons/like.svg');

  /// File path: assets/icons/logo.svg
  SvgGenImage get logo => const SvgGenImage('assets/icons/logo.svg');

  /// File path: assets/icons/menu-line.svg
  SvgGenImage get menuLine => const SvgGenImage('assets/icons/menu-line.svg');

  /// File path: assets/icons/nav-account-active.svg
  SvgGenImage get navAccountActive =>
      const SvgGenImage('assets/icons/nav-account-active.svg');

  /// File path: assets/icons/nav-account.svg
  SvgGenImage get navAccount =>
      const SvgGenImage('assets/icons/nav-account.svg');

  /// File path: assets/icons/nav-loyalty-active.svg
  SvgGenImage get navLoyaltyActive =>
      const SvgGenImage('assets/icons/nav-loyalty-active.svg');

  /// File path: assets/icons/nav-loyalty.svg
  SvgGenImage get navLoyalty =>
      const SvgGenImage('assets/icons/nav-loyalty.svg');

  /// File path: assets/icons/nav-shopping-active.svg
  SvgGenImage get navShoppingActive =>
      const SvgGenImage('assets/icons/nav-shopping-active.svg');

  /// File path: assets/icons/nav-shopping.svg
  SvgGenImage get navShopping =>
      const SvgGenImage('assets/icons/nav-shopping.svg');

  /// File path: assets/icons/nav_discovery.svg
  SvgGenImage get navDiscovery =>
      const SvgGenImage('assets/icons/nav_discovery.svg');

  /// File path: assets/icons/nav_discovery_active.svg
  SvgGenImage get navDiscoveryActive =>
      const SvgGenImage('assets/icons/nav_discovery_active.svg');

  /// File path: assets/icons/nav_home.svg
  SvgGenImage get navHome => const SvgGenImage('assets/icons/nav_home.svg');

  /// File path: assets/icons/nav_home_active.svg
  SvgGenImage get navHomeActive =>
      const SvgGenImage('assets/icons/nav_home_active.svg');

  /// File path: assets/icons/search-line.svg
  SvgGenImage get searchLine =>
      const SvgGenImage('assets/icons/search-line.svg');

  /// File path: assets/icons/shopping-bag-line.svg
  SvgGenImage get shoppingBagLine =>
      const SvgGenImage('assets/icons/shopping-bag-line.svg');

  /// List of all assets
  List<dynamic> get values => [
        arrowRight,
        banner01,
        banner02,
        banner03,
        example,
        like,
        logo,
        menuLine,
        navAccountActive,
        navAccount,
        navLoyaltyActive,
        navLoyalty,
        navShoppingActive,
        navShopping,
        navDiscovery,
        navDiscoveryActive,
        navHome,
        navHomeActive,
        searchLine,
        shoppingBagLine
      ];
}

class MyAssets {
  MyAssets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme theme = const SvgTheme(),
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      theme: theme,
      colorFilter: colorFilter,
      color: color,
      colorBlendMode: colorBlendMode,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
