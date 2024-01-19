import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../components/sliver_app_bar_delegate.dart';
import '../../theme/base_color.dart';
import '../../theme/base_text_styles.dart';

enum RankingTabEnum {
  ranking('Ranking'),
  favorites('Favorites');

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
  const RankingView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RankingViewState();
}

class _RankingViewState extends ConsumerState<RankingView> {
  @override
  Widget build(BuildContext context) {
    var tabController = useTabController(
      initialLength: ref.watch(rankingTabsProvider).length,
      initialIndex: ref.watch(rankingTabIndex),
    );

    tabController.addListener(() {
      ref.read(rankingTabIndex.notifier).update(
            (state) => tabController.index,
          );
    });

    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [
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
                    ref.read(rankingTabIndex.notifier).update(
                          (state) => index,
                        );
                  },
                  // isScrollable: true,
                  controller: tabController,
                  tabs: ref.watch(rankingTabsProvider),
                  indicatorColor: Colors.white,
                  // dividerHeight: 1,
                  dividerColor: BaseColors.background2,
                  indicatorSize: TabBarIndicatorSize.tab,
                  // tabAlignment: TabAlignment.start,
                  unselectedLabelStyle: BaseTextStyles.bodyText16.semiBold(),
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
      body: PageView(),
    );
  }
}
