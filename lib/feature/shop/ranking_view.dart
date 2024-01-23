import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:zigzag/theme/base_dimens.dart';
import 'package:zigzag/theme/base_text_styles.dart';
import '../../components/sliver_app_bar_delegate.dart';
import '../../generated/assets.gen.dart';
import '../../theme/base_color.dart';

enum RankingTabEnum {
  stores('Stores'),
  brands('Brands'),
  beauty('Beauty'),
  home('Home');

  final String label;
  const RankingTabEnum(this.label);
}

final rankingTabIndex = StateProvider.autoDispose<int>((ref) => 0);
final rankingTabsProvider = StateProvider.autoDispose<List<Tab>>(
  (ref) => RankingTabEnum.values
      .map(
        (e) => Tab(text: e.label),
      )
      .toList(),
);

class RankingView extends StatefulHookConsumerWidget {
  const RankingView({
    super.key,
    required this.tabController,
  });

  final TabController tabController;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RankingViewState();
}

class _RankingViewState extends ConsumerState<RankingView>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  SliverPersistentHeader makeHeader(String headerTitle) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: SliverAppBarDelegate(
        minHeight: 60.0,
        maxHeight: 200.0,
        child: Container(
            color: Colors.lightBlue, child: Center(child: Text(headerTitle))),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return TabBarView(
      controller: widget.tabController,
      physics: const NeverScrollableScrollPhysics(),
      children: const [
        RankingPageView(size: 10),
        RankingPageView(size: 2),
        RankingPageView(size: 5),
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              BannerRanking(),
            ],
          ),
        ),
      ],
    );
  }
}

class RankingPageView extends StatefulWidget {
  const RankingPageView({super.key, required this.size});

  final int size;

  @override
  State<RankingPageView> createState() => _RankingPageViewState();
}

class _RankingPageViewState extends State<RankingPageView> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: widget.size,
      separatorBuilder: (context, index) =>
          const Divider(color: BaseColors.background3, height: 24),
      padding: const EdgeInsets.all(BaseDimens.size16).copyWith(top: 0),
      itemBuilder: (context, index) {
        return Container(
          // padding: const EdgeInsets.all(16),
          // decoration: const BoxDecoration(
          //   color: BaseColors.blue400,
          // ),
          child: Column(
            children: [
              IntrinsicHeight(
                child: Row(
                  children: [
                    const Gap(BaseDimens.spacing16),
                    Text(
                      '${index + 1}',
                      style: BaseTextStyles.bodyText16.semiBold().copyWith(
                            color: BaseColors.white500,
                          ),
                    ),
                    const Gap(BaseDimens.spacing16),
                    Container(
                      width: 55,
                      height: 55,
                      decoration: BoxDecoration(
                          image: const DecorationImage(
                            image: NetworkImage(
                                'https://images.unsplash.com/photo-1601762603339-fd61e28b698a?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
                            fit: BoxFit.cover,
                          ),
                          borderRadius:
                              BorderRadius.circular(BaseDimens.radius66),
                          border: Border.all(
                            color: BaseColors.tintPink,
                            width: 2,
                          )),
                    ),
                    const Gap(BaseDimens.spacing12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Giordano',
                            style:
                                BaseTextStyles.bodyText16.semiBold().copyWith(
                                      color: BaseColors.white500,
                                    ),
                          ),
                          Text(
                            'Closer',
                            style: BaseTextStyles.bodyText12.copyWith(
                              color: BaseColors.textLabel,
                            ),
                          ),
                          const Gap(2),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 2, horizontal: 4),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                BaseDimens.radius2,
                              ),
                              color: BaseColors.background2,
                            ),
                            child: Text(
                              'Upto 30,000 won coupon',
                              style: BaseTextStyles.bodyText8.copyWith(
                                color: BaseColors.hexColor('8E87BB'),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        MyAssets.icons.like.svg(),
                        Text(
                          '1.9M',
                          style: BaseTextStyles.bodyText12
                              .copyWith(color: BaseColors.textLabel),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Gap(BaseDimens.spacing16),
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
    );
  }
}

class BannerRanking extends StatefulWidget {
  const BannerRanking({super.key});

  @override
  State<BannerRanking> createState() => _BannerRankingState();
}

class _BannerRankingState extends State<BannerRanking>
    with SingleTickerProviderStateMixin {
  final PageController scrollController = PageController();
  final ValueNotifier<int> _idxNotifier = ValueNotifier<int>(1);

  @override
  void dispose() {
    scrollController.dispose();
    _idxNotifier.dispose();
    super.dispose();
  }

  var list = [
    MyAssets.icons.banner01.provider(),
    MyAssets.icons.banner02.provider(),
    MyAssets.icons.banner03.provider(),
    MyAssets.icons.banner01.provider(),
    MyAssets.icons.banner02.provider(),
    MyAssets.icons.banner03.provider(),
  ];

  @override
  void initState() {
    scrollController.addListener(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        Timer.periodic(const Duration(seconds: 5), (timer) {
          scrollController.nextPage(
            duration: const Duration(milliseconds: 700),
            curve: Curves.ease,
          );
        });
      },
    );

    return SizedBox(
      height: 100,
      child: Stack(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(BaseDimens.radius8),
              child: PageView.builder(
                controller: scrollController,
                onPageChanged: (index) => _idxNotifier.value = index,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: list[index % list.length],
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              )),
          Positioned.fill(
            right: 12,
            bottom: 4,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
                decoration: BoxDecoration(
                  color: BaseColors.neutral800,
                  borderRadius: BorderRadius.circular(BaseDimens.radius4),
                ),
                child: ValueListenableBuilder<int>(
                  valueListenable: _idxNotifier,
                  builder: (_, selectedIndex, __) {
                    return Text(
                      '${_idxNotifier.value % list.length}/${list.length}',
                      style: BaseTextStyles.bodyText10.copyWith(
                        color: BaseColors.white500,
                      ),
                    );
                  },
                ),
                // child: Text(
                //   '1/${list.length}',
                //   style: BaseTextStyles.bodyText10.copyWith(
                //     color: BaseColors.white500,
                //   ),
                // ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
