import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:zigzag/feature/shop/favorites.dart';
import 'package:zigzag/theme/base_dimens.dart';
import 'package:zigzag/theme/base_text_styles.dart';

import '../../components/sliver_app_bar_delegate.dart';
import '../../generated/assets.gen.dart';
import '../../theme/base_color.dart';
import 'ranking_view.dart';

final shopControllerProvider = StateProvider.autoDispose<ScrollController>(
    (ref) => ScrollController(initialScrollOffset: 0.0));

enum ShopTabEnum {
  ranking('Ranking'),
  favorites('Favorites');

  final String label;
  const ShopTabEnum(this.label);
}

final shopTabIndex = StateProvider.autoDispose<int>((ref) => 0);
final shopTabsProvider = StateProvider.autoDispose<List<Tab>>(
  (ref) => ShopTabEnum.values
      .map(
        (e) => Tab(text: e.label),
      )
      .toList(),
);

class Shops extends StatefulHookConsumerWidget {
  const Shops({super.key});

  @override
  ConsumerState<Shops> createState() => _ShopsState();
}

class _ShopsState extends ConsumerState<Shops>
    with AutomaticKeepAliveClientMixin {
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    var tabController = useTabController(
      initialLength: ref.watch(shopTabsProvider).length,
      initialIndex: ref.watch(shopTabIndex),
    );

    tabController.addListener(() {
      ref.read(shopTabIndex.notifier).update(
            (state) => tabController.index,
          );
    });
    var shopController = ref.watch(shopControllerProvider);

    /// ranking
    var tabRankingController = useTabController(
      initialLength: ref.watch(rankingTabsProvider).length,
      initialIndex: ref.watch(rankingTabIndex),
    );

    tabRankingController.addListener(() {
      ref.read(rankingTabIndex.notifier).update(
            (state) => tabController.index,
          );
    });

    return Scaffold(
      backgroundColor: BaseColors.background,
      body: SafeArea(
        child: NestedScrollView(
          controller: shopController,
          physics: const BouncingScrollPhysics(),
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                // leading: Text(
                //   'Shop',
                //   style: BaseTextStyles.bodyText18.bold().copyWith(
                //         fontSize: 22,
                //         color: BaseColors.white500,
                //       ),
                // ),
                backgroundColor: BaseColors.background,
                // leadingWidth: 100,
                foregroundColor: BaseColors.background,
                shadowColor: BaseColors.background,
                surfaceTintColor: BaseColors.background,
                scrolledUnderElevation: 0,
                floating: true,
                snap: true,
                forceElevated: innerBoxIsScrolled,
                elevation: 0,
                title: Text(
                  'Shop',
                  style: BaseTextStyles.bodyText18.bold().copyWith(
                        fontSize: 22,
                        color: BaseColors.white500,
                      ),
                ),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: MyAssets.icons.searchLine.svg(),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: MyAssets.icons.shoppingBagLine.svg(),
                  ),
                ],
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate: SliverAppBarDelegate(
                  minHeight: 60.0,
                  maxHeight: 60.0,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: BaseColors.background,
                    ),
                    child: TabBar(
                      onTap: (index) {
                        ref.read(shopTabIndex.notifier).update(
                              (state) => index,
                            );
                      },
                      // isScrollable: true,
                      controller: tabController,
                      tabs: ref.watch(shopTabsProvider),
                      indicatorColor: Colors.white,
                      // dividerHeight: 1,
                      dividerColor: BaseColors.background2,
                      indicatorSize: TabBarIndicatorSize.tab,
                      // tabAlignment: TabAlignment.start,
                      unselectedLabelStyle:
                          BaseTextStyles.bodyText16.semiBold(),
                      unselectedLabelColor: BaseColors.neutral500,
                      // label
                      labelStyle: BaseTextStyles.bodyText16.semiBold(),
                      labelColor: Colors.white,
                    ),
                  ),
                ),
              ),
              ref.watch(shopTabIndex) == 0
                  ? SliverPersistentHeader(
                      pinned: true,
                      delegate: SliverAppBarDelegate(
                        minHeight: 60.0,
                        maxHeight: 60.0,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 8),
                          color: BaseColors.background,
                          child: Container(
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: BaseColors.hexColor('202425'),
                              borderRadius:
                                  BorderRadius.circular(BaseDimens.radius8),
                            ),
                            child: TabBar(
                              onTap: (index) {
                                ref.read(rankingTabIndex.notifier).update(
                                      (state) => index,
                                    );
                              },
                              // isScrollable: true,
                              controller: tabRankingController,
                              tabs: ref.watch(rankingTabsProvider),
                              indicatorColor: Colors.white,
                              indicator: BoxDecoration(
                                color: BaseColors.background,
                                borderRadius:
                                    BorderRadius.circular(BaseDimens.radius8),
                              ),

                              dividerHeight: 0,
                              // dividerColor: BaseColors.background2,
                              indicatorSize: TabBarIndicatorSize.tab,
                              // tabAlignment: TabAlignment.start,
                              unselectedLabelStyle:
                                  BaseTextStyles.bodyText14.medium(),
                              unselectedLabelColor: BaseColors.neutral500,
                              // label
                              labelStyle: BaseTextStyles.bodyText14.medium(),
                              labelColor: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    )
                  : const SliverToBoxAdapter(),
            ];
          },
          body: TabBarView(
            controller: tabController,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              RankingView(tabController: tabRankingController),
              const Favorites(),
            ],
          ),
        ),
      ),
    );
  }
}
