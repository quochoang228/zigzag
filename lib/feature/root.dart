import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:zigzag/l10n/l10n.dart';
import 'package:zigzag/theme/base_color.dart';
import 'package:zigzag/theme/base_dimens.dart';

import '../generated/assets.gen.dart';
import '../theme/base_text_styles.dart';
import 'discovery/discovery_page.dart';
import 'home/home_page.dart';
import 'shop/shop_page.dart';

final rootPageControllerProvider = StateProvider.autoDispose<PageController>(
    (ref) => PageController(initialPage: ref.watch(rootIndexProvider)));

final rootIndexProvider = StateProvider.autoDispose<int>((ref) => 0);

class RootPage extends StatefulHookConsumerWidget {
  const RootPage({super.key});

  @override
  ConsumerState<RootPage> createState() => _RootPageState();
}

class _RootPageState extends ConsumerState<RootPage> {
  @override
  Widget build(BuildContext context) {
    DateTime? currentBackPressTime;
    var pageController = ref.watch(rootPageControllerProvider);

    var canPop = ref.watch(rootIndexProvider) == 0;

    return PopScope(
      canPop: canPop,
      onPopInvoked: (didPop) {
        if (didPop) {
          DateTime now = DateTime.now();
          if (currentBackPressTime == null ||
              now.difference(currentBackPressTime!) >
                  const Duration(seconds: 2)) {
            currentBackPressTime = now;
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Bấm lần nữa để thoát'),
              ),
            );
          }
        } else {
          ref.read(rootIndexProvider.notifier).update(
                (state) => 0,
              );
          pageController.jumpToPage(
            0,
          );
        }
      },
      child: Scaffold(
        backgroundColor: BaseColors.white500,
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: PageView(
          controller: pageController,
          physics: const NeverScrollableScrollPhysics(),
          onPageChanged: (value) =>
              ref.read(rootIndexProvider.notifier).update((state) => value),
          children: const [
            HomePage(),
            Shops(),
            DiscoveryPage(),
            DiscoveryPage(),
            DiscoveryPage(),
          ],
        ),
        bottomNavigationBar: BottomNavBar(
          items: [
            BottomNavigationBarItem(
              icon: iconNav(child: MyAssets.icons.navHome.svg()),
              activeIcon: iconNav(child: MyAssets.icons.navHomeActive.svg()),
              label: context.l10n.home,
            ),
            BottomNavigationBarItem(
              icon: iconNav(child: MyAssets.icons.navShopping.svg()),
              activeIcon:
                  iconNav(child: MyAssets.icons.navShoppingActive.svg()),
              label: context.l10n.shops,
            ),
            BottomNavigationBarItem(
              icon: iconNav(child: MyAssets.icons.navDiscovery.svg()),
              activeIcon:
                  iconNav(child: MyAssets.icons.navDiscoveryActive.svg()),
              label: context.l10n.discovery,
            ),
            BottomNavigationBarItem(
              icon: iconNav(child: MyAssets.icons.navLoyalty.svg()),
              activeIcon: iconNav(child: MyAssets.icons.navLoyaltyActive.svg()),
              label: context.l10n.loyalty,
            ),
            BottomNavigationBarItem(
              icon: iconNav(child: MyAssets.icons.navAccount.svg()),
              activeIcon: iconNav(child: MyAssets.icons.navAccount.svg()),
              label: context.l10n.account,
            ),
          ],
          currentIndex: ref.watch(rootIndexProvider),
          onTap: (index) {
            if (index != ref.watch(rootIndexProvider)) {
              ref.read(rootIndexProvider.notifier).update((state) => index);
            } else {
              switch (index) {
                case 0:
                  if (ref.watch(homePageControllerProvider).hasClients) {
                    ref.watch(homePageControllerProvider).animateTo(
                          0.0,
                          duration: const Duration(milliseconds: 600),
                          curve: Curves.easeOut,
                        );
                  }
                  break;
                case 1:
                  if (ref.watch(shopControllerProvider).hasClients) {
                    ref.watch(shopControllerProvider).animateTo(
                          0.0,
                          duration: const Duration(milliseconds: 600),
                          curve: Curves.easeOut,
                        );
                  }
                  break;
                case 2:
                  break;
                case 3:
                  break;
                case 3:
                  break;
              }
            }
            pageController.jumpToPage(index);
          },
        ),
      ),
    );
  }
}

Widget iconNav({required Widget child}) => Container(
      padding: const EdgeInsets.only(bottom: 3),
      child: child,
    );

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    required this.currentIndex,
    required this.onTap,
    required this.items,
    super.key,
  });

  final int currentIndex;
  final ValueSetter<int> onTap;

  final List<BottomNavigationBarItem> items;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(BaseDimens.radius16),
          topLeft: Radius.circular(BaseDimens.radius16),
        ),
        border: Border(
          top: BorderSide(
            color: BaseColors.background2,
          ),
        ),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(BaseDimens.radius16),
          topRight: Radius.circular(BaseDimens.radius16),
        ),
        child: BottomNavigationBar(
          backgroundColor: BaseColors.background,
          selectedItemColor: BaseColors.hexColor('F5F6F8'),
          selectedLabelStyle: BaseTextStyles.nav.bold().copyWith(fontSize: 10),

          unselectedItemColor: BaseColors.hexColor('585C5D'),
          unselectedLabelStyle:
              BaseTextStyles.nav.bold().copyWith(fontSize: 10),

          // enableFeedback: true,
          elevation: 10,
          type: BottomNavigationBarType.fixed,
          items: items,
          currentIndex: currentIndex,
          onTap: onTap,
        ),
      ),
    );
  }
}
