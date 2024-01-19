import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:zigzag/feature/home/component/today_view.dart';
import 'package:zigzag/theme/base_color.dart';


import '../../components/sliver_app_bar_delegate.dart';
import '../../generated/assets.gen.dart';

enum TabEnum {
  o0('Today'),
  o1('Best'),
  o2('Brach'),
  o3('Sellers'),
  o4('Lifestyle'),
  o5('Sale'),
  o6('Hot');

  final String groupName;
  const TabEnum(this.groupName);
}

final groupTabIndex = StateProvider.autoDispose<int>((ref) => 0);
final groupTabsProvider = StateProvider.autoDispose<List<Tab>>(
  (ref) => TabEnum.values
      .map(
        (e) => Tab(text: e.groupName),
      )
      .toList(),
);

final homePageControllerProvider = StateProvider.autoDispose<ScrollController>(
    (ref) => ScrollController(initialScrollOffset: 0.0));

class HomePage extends StatefulHookConsumerWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    var tabController = useTabController(
      initialLength: ref.watch(groupTabsProvider).length,
      initialIndex: ref.watch(groupTabIndex),
    );

    tabController.addListener(() {
      ref.read(groupTabIndex.notifier).update(
            (state) => tabController.index,
          );
    });

    var scrollcontroller = ref.watch(homePageControllerProvider);

    return Scaffold(
      backgroundColor: BaseColors.background,
      body: SafeArea(
        child: NestedScrollView(
          controller: scrollcontroller,
          physics: const BouncingScrollPhysics(),
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                leading: Padding(
                  padding: const EdgeInsets.only(left: 14.0),
                  child: MyAssets.icons.logo.svg(),
                ),
                backgroundColor: BaseColors.background,
                leadingWidth: 100,
                foregroundColor: BaseColors.background,
                shadowColor: BaseColors.background,
                surfaceTintColor: BaseColors.background,
                scrolledUnderElevation: 0,
                floating: true,
                snap: true,
                forceElevated: innerBoxIsScrolled,
                elevation: 0,
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: MyAssets.icons.menuLine.svg(),
                  ),
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
                        ref.read(groupTabIndex.notifier).update(
                              (state) => index,
                            );
                      },
                      isScrollable: true,
                      controller: tabController,
                      tabs: ref.watch(groupTabsProvider),
                      indicatorColor: Colors.white,
                      dividerHeight: 0,
                      indicatorSize: TabBarIndicatorSize.tab,
                      tabAlignment: TabAlignment.start,
                      unselectedLabelStyle: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                      unselectedLabelColor: BaseColors.neutral500,
                      // label
                      labelStyle: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                      ),
                      labelColor: Colors.white,
                    ),
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            controller: tabController,
            children: [
              const TodayView(),
              SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      color: Colors.red,
                      height: 500,
                    ),
                    Container(
                      color: Colors.blue,
                      height: 1000,
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.red,
              ),
              Container(
                color: Colors.amber,
              ),
              Container(
                color: Colors.blue,
              ),
              Container(
                color: Colors.red,
              ),
              Container(
                color: Colors.red,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
