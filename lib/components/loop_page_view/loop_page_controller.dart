import 'package:flutter/material.dart';

/// A [PageController] extension to handle an infinitely scrollable list in [LoopPageView].
class LoopPageController implements Listenable {
  final int initialShiftedPage;

  // ignore: prefer_final_fields
  int currentShiftedPage;

  // ignore: prefer_final_fields
  int itemCount;

  // ignore: prefer_final_fields
  int initialIndexShift;

  late PageController pageController;

  final int initialPage;

  bool isAnimatingJumpToPage = false;

  int isAnimatingJumpToPageIndex = 0;

  LoopScrollMode scrollMode;

  final LoopActivationMode _activationMode;

  bool _hasJumpedForwardsOnce = false;

  /// Creates a LoopPageController with an immediate looping activation mode.
  /// It enables infinite looping behavior right from the first page.
  /// It allows setting a scroll mode, defaulting to the shortest path between pages.
  /// You can set the `LoopActivationMode` to start looping immediately, only after the first loop,
  /// or to only enable infinite loops going forward. Based on this mode, the controller will adjust the
  /// scroll mode and initial page.
  LoopPageController(
      {this.initialPage = 0,
      bool keepPage = true,
      double viewportFraction = 1.0,
      this.scrollMode = LoopScrollMode.shortest,
      LoopActivationMode activationMode = LoopActivationMode.immediate})
      : assert(viewportFraction > 0.0),
        initialShiftedPage =
            activationMode == LoopActivationMode.immediate ? 1000000 : 0,
        currentShiftedPage =
            activationMode == LoopActivationMode.immediate ? 1000000 : 0,
        itemCount = 0,
        initialIndexShift = 0,
        _activationMode = activationMode,
        pageController = PageController(
          initialPage: initialPage +
              (activationMode == LoopActivationMode.immediate ? 1000000 : 0),
          keepPage: keepPage,
          viewportFraction: viewportFraction,
        );

  bool get hasClients => pageController.hasClients;

  // ignore: invalid_use_of_protected_member
  bool get hasListeners => pageController.hasListeners;

  ScrollPosition get position => pageController.position;

  double get initialScrollOffset => pageController.initialScrollOffset;

  double get offset => pageController.offset;

  // ignore: invalid_use_of_protected_member
  Iterable<ScrollPosition> get positions => pageController.positions;

  bool get keepScrollOffset => pageController.keepScrollOffset;

  @override
  void addListener(VoidCallback listener) {
    pageController.addListener(listener);
  }

  @override
  void removeListener(VoidCallback listener) {
    pageController.removeListener(listener);
  }

  void notifyListeners() {
    // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
    pageController.notifyListeners();
  }

  ScrollPosition createScrollPosition(ScrollPhysics physics,
      ScrollContext context, ScrollPosition oldPosition) {
    return pageController.createScrollPosition(physics, context, oldPosition);
  }

  void attach(ScrollPosition position) {
    pageController.attach(position);
  }

  /// The current page displayed in the controlled [LoopPageView].
  ///
  /// There are circumstances that this [LoopPageController] can't know the current
  /// page. Reading [page] will throw an [AssertionError] in the following cases:
  ///
  /// 1. No [LoopPageView] is currently using this [LoopPageController]. Once a
  /// [LoopPageView] starts using this [LoopPageController], the new [page]
  /// position will be derived:
  ///
  ///   * First, based on the attached [LoopPageView]'s [BuildContext] and the
  ///     position saved at that context's [PageStorage] if [keepPage] is true.
  ///   * Second, from the [LoopPageController]'s [initialPage].
  ///
  /// 2. More than one [LoopPageView] using the same [LoopPageController].
  ///
  /// The [hasClients] property can be used to check if a [LoopPageView] is attached
  /// prior to accessing [page].
  ///
  double get page =>
      notShiftedIndex(pageController.page!.floor()).toDouble() +
      (pageController.page! - pageController.page!.truncate());

  /// Jumps to imediate before or after given page and then
  /// animates the controlled [LoopPageView] from the imediate page to the given page.
  /// This is done in order to build only the given page while still animating its transition.
  ///
  ///
  /// The animation lasts for the given duration and follows the given curve.
  /// The returned [Future] resolves when the animation completes.
  ///
  /// The `duration` and `curve` arguments must not be null.
  Future<void> animateJumpToPage(
    int page, {
    required Duration duration,
    required Curve curve,
  }) {
    final shiftedPage = shiftPage(page);

    if (shiftedPage == currentShiftedPage) return Future.value();

    if (shiftedPage == currentShiftedPage + 1 ||
        shiftedPage == currentShiftedPage - 1) {
      return animateToPage(page, duration: duration, curve: curve);
    }

    if (pageController.viewportFraction == 1.0) isAnimatingJumpToPage = true;
    if (pageController.viewportFraction == 1.0) {
      isAnimatingJumpToPageIndex = currentShiftedPage < shiftedPage
          ? notShiftedIndex(shiftedPage - 1)
          : notShiftedIndex(shiftedPage + 1);
    }

    jumpToPage(currentShiftedPage < shiftedPage ? page - 1 : page + 1);
    return animateToPage(page, duration: duration, curve: curve);
  }

  /// Animates the controlled [LoopPageView] from the current page to the given page.
  ///
  /// The animation lasts for the given duration and follows the given curve.
  /// The returned [Future] resolves when the animation completes.
  ///
  /// The `duration` and `curve` arguments must not be null.
  Future<void> animateToPage(
    int page, {
    required Duration duration,
    required Curve curve,
  }) {
    final int shiftedPage = shiftPage(page);
    if (currentShiftedPage != shiftedPage) {
      currentShiftedPage = shiftedPage;
      return pageController.animateToPage(shiftedPage,
          duration: duration, curve: curve);
    }
    return Future.value();
  }

  void dispose() {
    pageController.dispose();
  }

  /// Changes which page is displayed in the controlled [LoopPageView].
  ///
  /// Jumps the page position from its current value to the given value,
  /// without animation.
  void jumpToPage(int page) {
    final int shiftedPage = initialShiftedPage + page;

    if (currentShiftedPage != shiftedPage) {
      currentShiftedPage = shiftedPage;
      pageController.jumpToPage(shiftedPage);
    }
  }

  /// Animates the controlled [LoopPageView] to the next page.
  ///
  /// The animation lasts for the given duration and follows the given curve.
  /// The returned [Future] resolves when the animation completes.
  ///
  /// The `duration` and `curve` arguments must not be null.
  Future<void> nextPage({required Duration duration, required Curve curve}) {
    return animateToPage(shiftPage(page.round()) + 1,
        duration: duration, curve: curve);
  }

  /// Animates the controlled [LoopPageView] to the previous page.
  ///
  /// The animation lasts for the given duration and follows the given curve.
  /// The returned [Future] resolves when the animation completes.
  ///
  /// The `duration` and `curve` arguments must not be null.
  Future<void> previousPage(
      {required Duration duration, required Curve curve}) {
    return animateToPage(shiftPage(page.round()) - 1,
        duration: duration, curve: curve);
  }

  /// Changes index for which page is displayed in the controlled [LoopPageView]
  /// in order to enable infinite scrolling

  void modJump() {
    int shiftedPage =
        initialShiftedPage + notShiftedIndex(currentShiftedPage);

    /// This code handles 'LoopActivationMode.afterFirstLoop'.
    /// '_hasJumpedForwardsOnce' becomes true when a forward loop completes once.
    /// Then, 'shiftedPage' is updated to enable continuous looping.
    if (_activationMode == LoopActivationMode.afterFirstLoop) {
      if (currentShiftedPage > shiftedPage) {
        _hasJumpedForwardsOnce = true;
      } else {
        _hasJumpedForwardsOnce = false;
      }
      if (_hasJumpedForwardsOnce) {
        shiftedPage = itemCount + notShiftedIndex(currentShiftedPage);
      }
    }

    if (currentShiftedPage != shiftedPage) {
      currentShiftedPage = shiftedPage;
      pageController.jumpToPage(shiftedPage);
    }
  }

  /// Changes a shifted index to a not shifted index.
  int notShiftedIndex(int shiftedIndex) {
    final int currentIndexShift =
        itemCount > 0 ? shiftedIndex % itemCount : shiftedIndex;

    final int difference = currentIndexShift - initialIndexShift;

    if (difference < 0) return difference + itemCount;
    return difference;
  }

  int shiftPage(int page) {
    final modPage = itemCount > 0 ? (page % itemCount) : page;

    final int instantCurrentShiftedPage = currentShiftedPage;

    final int currentNotShiftedPage =
        notShiftedIndex(instantCurrentShiftedPage);

    if (currentNotShiftedPage == modPage) return instantCurrentShiftedPage;

    final int distance = modPage - currentNotShiftedPage;

    final int oppositeDistance = distance > 0
        ? (-1 * currentNotShiftedPage) - (itemCount - modPage)
        : distance == 0
            ? 0
            : distance + itemCount;

    if (instantCurrentShiftedPage + distance < 0) {
      return instantCurrentShiftedPage + oppositeDistance;
    } else if (instantCurrentShiftedPage + oppositeDistance < 0) {
      return instantCurrentShiftedPage + distance;
    }

    switch (scrollMode) {
      case LoopScrollMode.shortest:
        return distance.abs() <= oppositeDistance.abs()
            ? instantCurrentShiftedPage + distance
            : instantCurrentShiftedPage + oppositeDistance;
      case LoopScrollMode.forwards:
        return distance > oppositeDistance
            ? instantCurrentShiftedPage + distance
            : instantCurrentShiftedPage + oppositeDistance;
      case LoopScrollMode.backwards:
        return distance < oppositeDistance
            ? instantCurrentShiftedPage + distance
            : instantCurrentShiftedPage + oppositeDistance;
    }
  }

  /// Updates currentShiftedPage to be equal current [PageController] page.
  void updateCurrentShiftedPage() {
    currentShiftedPage = pageController.page!.roundToDouble().toInt();
  }

  void updateItemCount(int itemCount) {
    itemCount = itemCount;
    initialIndexShift =
        itemCount > 0 ? initialShiftedPage % itemCount : initialShiftedPage;
    currentShiftedPage = initialShiftedPage + initialPage;
  }
}

/// Enum representing different scroll directions for a LoopPageController.
///
/// Values:
/// * `shortest`: The LoopPageController will animate to the closest page. For example, if the current page is 1 and the target page is 5, but the total number of pages is 6, the LoopPageController will go backwards (from 1 to 6 to 5) instead of forwards (from 1 to 2 to 3 to 4 to 5). This is because the shortest path from 1 to 5 in this case is to go backwards.
/// * `forwards`: The LoopPageController will always animate forwards to reach the target page. Even if the target page is technically closer when moving backwards, this option will make the controller move forwards until it reaches the target page.
/// * `backwards`: The LoopPageController will always animate backwards to reach the target page. Similar to `forwards`, but in the opposite direction. Even if the target page is technically closer when moving forwards, this option will make the controller move backwards until it reaches the target page.
enum LoopScrollMode {
  shortest,
  forwards,
  backwards,
}

/// Enum that represents the different modes of activating the infinite loop
/// in the `LoopPageView`.
///
/// The modes are:
/// * `immediate`: Infinite loop is enabled from the start. As soon as the
///   `LoopPageView` is loaded, the user can scroll infinitely in both
///   directions.
///
/// * `afterFirstLoop`: The infinite loop is only enabled after the first loop
///   through all pages. Initially, the user can scroll through the pages in
///   normal sequence. Once the user reaches the end and loops back to the
///   first page, infinite scrolling is enabled.
///
/// * `forwardOnly`: Infinite scrolling is only enabled in the forward
///   direction. The user can scroll forward through the pages indefinitely,
///   but cannot scroll backwards past the first page.
enum LoopActivationMode {
  immediate,
  afterFirstLoop,
  forwardOnly,
}