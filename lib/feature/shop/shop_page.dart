import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:zigzag/theme/base_dimens.dart';
import 'package:zigzag/theme/base_text_styles.dart';

import '../../components/sliver_app_bar_delegate.dart';
import '../../generated/assets.gen.dart';
import '../../theme/base_color.dart';

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

class _ShopsState extends ConsumerState<Shops> {
  @override
  Widget build(BuildContext context) {
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
            ];
          },
          body: TabBarView(
            controller: tabController,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Container(
                  // color: BaseColors.blue400,
                  ),
              const Favorites(),
            ],
          ),
        ),
      ),
    );
  }
}

class Favorites extends StatelessWidget {
  const Favorites({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // physics: const PageScrollPhysics(),
      child: Column(
        children: [
          const Gap(92),
          Text(
            '패션잡화 특가 15% 추가 쿠폰까지',
            style: BaseTextStyles.bodyText18.bold().copyWith(
                  fontSize: 20,
                  color: BaseColors.white500,
                ),
          ),
          Text(
            '[썸머오픈🌴/빠른발송중] 마켓 와이드 트레이닝슬랙스',
            style: BaseTextStyles.bodyText14.copyWith(
              color: BaseColors.textLabel,
            ),
          ),
          const Gap(26),
          ListView.separated(
            itemCount: 10,
            separatorBuilder: (context, index) => const Gap(12),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: const EdgeInsets.all(16),
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                    color: BaseColors.background3,
                    borderRadius: BorderRadius.circular(
                      BaseDimens.radius12,
                    )),
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://images.unsplash.com/photo-1601762603339-fd61e28b698a?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
                        ),
                        const Gap(BaseDimens.spacing8),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Giordano',
                                style: BaseTextStyles.bodyText14
                                    .semiBold()
                                    .copyWith(
                                      color: BaseColors.white500,
                                    ),
                              ),
                              Text(
                                '물스물스랑말',
                                style: BaseTextStyles.bodyText14.copyWith(
                                  color: BaseColors.textLabel,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            MyAssets.icons.like.svg(),
                            Text(
                              '107.90원',
                              style: BaseTextStyles.bodyText12
                                  .copyWith(color: BaseColors.textLabel),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Gap(BaseDimens.spacing8),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: MediaQuery.sizeOf(context).width * 0.4,
                            margin: const EdgeInsets.only(right: 8),
                            decoration: BoxDecoration(
                                image: const DecorationImage(
                                  image: NetworkImage(
                                    'https://images.unsplash.com/photo-1515886657613-9f3515b0c78f?q=80&w=1920&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                                  ),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius:
                                    BorderRadius.circular(BaseDimens.radius6)),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: MediaQuery.sizeOf(context).width * 0.4,
                            margin: const EdgeInsets.only(right: 8),
                            decoration: BoxDecoration(
                                image: const DecorationImage(
                                  image: NetworkImage(
                                    'https://images.unsplash.com/photo-1558769132-cb1aea458c5e?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                                  ),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius:
                                    BorderRadius.circular(BaseDimens.radius6)),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: MediaQuery.sizeOf(context).width * 0.4,
                            decoration: BoxDecoration(
                                image: const DecorationImage(
                                  image: NetworkImage(
                                    'https://images.unsplash.com/photo-1614093302611-8efc4de12964?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                                  ),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius:
                                    BorderRadius.circular(BaseDimens.radius6)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
          const Gap(92),
        ],
      ),
    );
  }
}
