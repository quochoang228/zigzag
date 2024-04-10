import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gap/gap.dart';
import 'package:zigzag/feature/home/component/banneer.dart';
import 'package:zigzag/generated/assets.gen.dart';
import 'package:zigzag/theme/base_dimens.dart';
import 'package:zigzag/theme/base_text_styles.dart';

import '../../../components/loop_page_view/scroll_loop_auto_scroll.dart';
import '../../../theme/base_color.dart';

class TodayView extends StatefulWidget {
  const TodayView({super.key});

  @override
  State<TodayView> createState() => _TodayViewState();
}

class _TodayViewState extends State<TodayView>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    var menu = [
      'SOHO',
      'Clothes',
      '상의',
      '직진배송',
      '원피스',
      'Food',
      'Brand',
      'Rafle',
      'Styleing',
      'Fast Shipping',
      '바지',
      '스커트',
      'Shoes',
      'Plus',
      'Bags',
    ];
    var banner = [
      'https://images.pexels.com/photos/2899937/pexels-photo-2899937.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      'https://images.pexels.com/photos/2899937/pexels-photo-2899937.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      'https://images.pexels.com/photos/1478477/pexels-photo-1478477.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      'https://images.pexels.com/photos/2899937/pexels-photo-2899937.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      'https://images.pexels.com/photos/2899937/pexels-photo-2899937.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      'https://images.pexels.com/photos/1478477/pexels-photo-1478477.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      'https://images.pexels.com/photos/2899937/pexels-photo-2899937.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      'https://images.pexels.com/photos/2899937/pexels-photo-2899937.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      'https://images.pexels.com/photos/1478477/pexels-photo-1478477.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    ];
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.sizeOf(context).height * 0.4,
            color: BaseColors.blue300,
            child: Stack(
              children: [
                PageView(
                  // controller: PageController(viewportFraction: 0.9),
                  children: [
                    ...banner.map(
                      (e) => LocationListItem(
                          imageUrl: e, name: "name", country: "Hà Nội"),
                      // (e) => Container(
                      //   decoration: BoxDecoration(
                      //     image: DecorationImage(
                      //       image: NetworkImage(e),
                      //       fit: BoxFit.cover,
                      //     ),
                      //   ),
                      // ),
                    ),
                  ],
                ),
                Positioned.fill(
                  right: 16,
                  bottom: 16,
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(BaseDimens.radius16),
                        color: BaseColors.hexColor('151018'),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 12),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '1',
                            style: BaseTextStyles.bodyText12.medium().copyWith(
                                  color: BaseColors.white500,
                                ),
                          ),
                          Text(
                            '/2',
                            style: BaseTextStyles.bodyText12.medium().copyWith(
                                  color: BaseColors.hexColor('B9B7BA'),
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            color: BaseColors.white500,
            child: Row(children: [
              Expanded(
                child: Text(
                  'Discount up to 94% on the occasion of Lunar New Year',
                  style: BaseTextStyles.bodyText13.semiBold(),
                ),
                // child: ScrollLoopAutoScroll(
                //   scrollDirection: Axis.horizontal,
                //   reverseScroll: false,
                //   enableScrollInput: false,
                //   duration: const Duration(minutes: 3),
                //   child: Text(
                //     'Discount up to 94% on the occasion of Lunar New Year',
                //     style: BaseTextStyles.bodyText13.semiBold(),
                //   ),
                // ),
              ),
              const Gap(16),
              MyAssets.icons.arrowRight.svg(width: 16, height: 16),
            ]),
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.25,
            child: ScrollConfiguration(
              behavior: AppScrollBehavior(),
              child: GridView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.all(16),
                // physics: const PageScrollPhysics(),
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  // số item 1 hàng
                  mainAxisSpacing: 16,
                  // margin phía dưới
                  crossAxisSpacing: 16,
                  // marigin bên phải
                  childAspectRatio: 1.5,
                  // Tỉ lệ 2 chiều ngang / dọc
                  // mainAxisExtent: 105,
                ),
                itemCount: menu.length,
                itemBuilder: (context, index) {
                  //IntrinsicHeight
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AspectRatio(
                        aspectRatio: 1,
                        child: Container(
                          decoration: BoxDecoration(
                            color: BaseColors.background2,
                            borderRadius: BorderRadius.circular(
                              BaseDimens.radius18,
                            ),
                          ),
                          padding: const EdgeInsets.all(2),
                          alignment: Alignment.center,
                          child: Text(
                            menu[index].toUpperCase(),
                            textAlign: TextAlign.center,
                            style: BaseTextStyles.bodyText11.bold().apply(
                                  color: BaseColors.white500,
                                ),
                          ),
                        ),
                      ),
                      Text(
                        menu[index],
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: BaseTextStyles.bodyText12.medium().copyWith(
                              color: BaseColors.white500,
                            ),
                      )
                    ],
                  );
                },
              ),
            ),
          ),
          // Container(
          //   height: 200,
          //   color: Colors.amber,
          //   child: GridView.builder(
          //     scrollDirection: Axis.horizontal,
          //     padding: const EdgeInsets.all(16),
          //     physics: const PageScrollPhysics(),
          //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //       crossAxisCount: 2,
          //       // số item 1 hàng
          //       mainAxisSpacing: 16,
          //       // margin phía dưới
          //       crossAxisSpacing: 16,
          //       // marigin bên phải
          //       childAspectRatio: 1,
          //       // Tỉ lệ 2 chiều ngang / dọc
          //       // mainAxisExtent: 105,
          //     ),
          //     itemCount: 40,
          //     itemBuilder: (context, index) {
          //       return Container(
          //         color: BaseColors.blue100,
          //         child: Text('data'),
          //       );
          //     },
          //   ),
          // ),
          Container(
            height: BaseDimens.spacing12,
            color: BaseColors.line,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Items recommended for you',
                  style: BaseTextStyles.bodyText16.semiBold().copyWith(
                        color: BaseColors.white500,
                      ),
                ),
                Text(
                  'sponsored',
                  style: BaseTextStyles.bodyText11.copyWith(
                    color: BaseColors.hexColor('424547'),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.3,
            child: ListView.separated(
              itemCount: 3,
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => const Gap(16),
              itemBuilder: (context, index) {
                return SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.35,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AspectRatio(
                        aspectRatio: 0.9,
                        child: Container(
                          decoration: BoxDecoration(
                              color: BaseColors.blue100,
                              borderRadius: BorderRadius.circular(
                                BaseDimens.radius8,
                              )),
                        ),
                      ),
                      const Gap(8),
                      Text(
                        '골골스',
                        style: BaseTextStyles.bodyText12.bold().copyWith(
                              color: BaseColors.white500,
                            ),
                      ),
                      Text(
                        '[컬러추가💛37만장돌파👏🏻구김적은촤르르핏] 핀턱 스트레이트 일자슬랙스◆',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: BaseTextStyles.bodyText12.copyWith(
                          color: BaseColors.white500,
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '16%',
                            style: BaseTextStyles.bodyText14.bold().copyWith(
                                  color: BaseColors.tintPink,
                                ),
                          ),
                          Text(
                            "119.9€",
                            style: BaseTextStyles.bodyText14.bold().copyWith(
                                  color: BaseColors.white500,
                                ),
                          ),
                        ],
                      ),
                      const Gap(4),
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: BaseColors.background3,
                          borderRadius: BorderRadius.circular(
                            BaseDimens.radius4,
                          ),
                        ),
                        child: Text(
                          'Free ship',
                          style: BaseTextStyles.bodyText10.copyWith(
                            color: BaseColors.textLabel,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: BaseDimens.spacing16,
              vertical: 4,
            ),
            color: BaseColors.background2,
            child: Row(children: [
              // MyAssets.icons.example.image(),
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: NetworkImage(
                      'https://images.pexels.com/photos/3002552/pexels-photo-3002552.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                    ),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(BaseDimens.radius8),
                ),
              ),
              const Gap(BaseDimens.spacing6),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '이 상품을 클릭한',
                    style: BaseTextStyles.bodyText14.copyWith(
                      color: BaseColors.tintPink,
                    ),
                  ),
                  Text(
                    '이 상품을 클릭한 다른 고객이 좋아하는 상품',
                    style: BaseTextStyles.bodyText14.copyWith(
                      color: BaseColors.white500,
                    ),
                  ),
                ],
              )),
            ]),
          ),
          GridView.builder(
            scrollDirection: Axis.vertical,
            padding: const EdgeInsets.all(16),
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              // số item 1 hàng
              mainAxisSpacing: 16,
              // margin phía dưới
              crossAxisSpacing: 8,
              // marigin bên phải
              childAspectRatio: 0.55,
              // Tỉ lệ 2 chiều ngang / dọc
              // mainAxisExtent: 105,
            ),
            itemCount: 10,
            itemBuilder: (context, index) {
              //IntrinsicHeight
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Container(
                        decoration: BoxDecoration(
                          // color: BaseColors.background2,
                          borderRadius: BorderRadius.circular(
                            BaseDimens.radius18,
                          ),
                          image: const DecorationImage(
                            image: NetworkImage(
                                'https://images.pexels.com/photos/12513869/pexels-photo-12513869.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        alignment: Alignment.bottomCenter,
                        padding: const EdgeInsets.all(BaseDimens.size8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 2,
                                horizontal: 4,
                              ),
                              decoration: BoxDecoration(
                                  color: BaseColors.blue500,
                                  borderRadius: BorderRadius.circular(
                                      BaseDimens.radius16)),
                              child: Text(
                                'FAST SHIP',
                                style: BaseTextStyles.bodyText8
                                    .semiBold()
                                    .copyWith(
                                      color: BaseColors.white500,
                                    ),
                              ),
                            ),
                            MyAssets.icons.like.svg(),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Gap(BaseDimens.spacing8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'MAENIQUE',
                            style: BaseTextStyles.bodyText13.bold().copyWith(
                                  color: BaseColors.white500,
                                ),
                          ),
                        ],
                      ),
                      Text(
                        'Stan collar short mustag training',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: BaseTextStyles.bodyText12.copyWith(
                          color: BaseColors.white500,
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Z Discount',
                            style: BaseTextStyles.bodyText12.bold().copyWith(
                                  color: BaseColors.tintPink,
                                ),
                          ),
                          const Gap(BaseDimens.spacing8),
                          // Text(
                          //   "119.000",
                          //   style: BaseTextStyles.bodyText12.copyWith(
                          //     color: BaseColors.white500,
                          //     decoration: TextDecoration.underline,
                          //   ),
                          // ),
                          Text(
                            '119.000',
                            style: BaseTextStyles.bodyText12.copyWith(
                              decoration: TextDecoration.lineThrough,
                              color: BaseColors.white500,
                              decorationColor: BaseColors.white500, // optional
                              // decorationThickness: 2, // optional
                              // decorationStyle:
                              //     TextDecorationStyle.solid, // optional
                            ),
                          )
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '16%',
                            style: BaseTextStyles.bodyText16.bold().copyWith(
                                  color: BaseColors.tintPink,
                                ),
                          ),
                          Text(
                            "119.9€",
                            style: BaseTextStyles.bodyText16.bold().copyWith(
                                  color: BaseColors.white500,
                                ),
                          ),
                        ],
                      ),
                      const Gap(4),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: BaseColors.hexColor('C0CBC7'),
                              borderRadius: BorderRadius.circular(
                                BaseDimens.radius4,
                              ),
                            ),
                            child: Text(
                              'Originals',
                              style: BaseTextStyles.bodyText10.copyWith(
                                color: BaseColors.hexColor('262A2D'),
                              ),
                            ),
                          ),
                          const Gap(BaseDimens.spacing8),
                          Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: BaseColors.hexColor('262A2D'),
                              borderRadius: BorderRadius.circular(
                                BaseDimens.radius4,
                              ),
                            ),
                            child: Text(
                              'Free order',
                              style: BaseTextStyles.bodyText10.copyWith(
                                color: BaseColors.hexColor('808485'),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              '주목해야 할 라이징 스토어',
              style: BaseTextStyles.bodyText16.semiBold().copyWith(
                    color: BaseColors.white500,
                  ),
            ),
          ),
          Container(
            height: 400,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(BaseDimens.radius16),
              child: GridView.custom(
                gridDelegate: SliverQuiltedGridDelegate(
                  crossAxisCount: 3,
                  mainAxisSpacing: 2,
                  crossAxisSpacing: 2,
                  repeatPattern: QuiltedGridRepeatPattern.inverted,
                  pattern: [
                    QuiltedGridTile(2, 2),
                    QuiltedGridTile(1, 1),
                    QuiltedGridTile(1, 1),
                  ],
                ),
                scrollDirection: Axis.horizontal,
                // padding: const EdgeInsets.symmetric(horizontal: 16),
                semanticChildCount: 15,
                childrenDelegate: SliverChildBuilderDelegate(
                  (context, index) => Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(banner[index % banner.length]),
                        fit: BoxFit.cover,
                      ),
                      // borderRadius: (index == 0)
                      //     ? const BorderRadius.only(
                      //         topLeft: Radius.circular(BaseDimens.radius16))
                      //     : index == 1
                      //         ? const BorderRadius.only(
                      //             bottomLeft:
                      //                 Radius.circular(BaseDimens.radius16))
                      //         : index == (banner.length - 1)
                      //             ? const BorderRadius.only(
                      //                 bottomRight:
                      //                     Radius.circular(BaseDimens.radius16))
                      //             : index == (banner.length - 3)
                      //                 ? const BorderRadius.only(
                      //                     topRight: Radius.circular(
                      //                         BaseDimens.radius16))
                      //                 : const BorderRadius.all(Radius.zero),
                    ),
                    alignment: Alignment.bottomCenter,
                    padding: const EdgeInsets.all(12),
                    child: Text(
                      '주목해야 할',
                      style: BaseTextStyles.bodyText12.semiBold().copyWith(
                            color: BaseColors.white500,
                          ),
                    ),
                  ),
                  childCount: banner.length,
                ),
              ),
            ),
          ),
          GridView.builder(
            scrollDirection: Axis.vertical,
            padding: const EdgeInsets.all(16),
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              // số item 1 hàng
              mainAxisSpacing: 16,
              // margin phía dưới
              crossAxisSpacing: 8,
              // marigin bên phải
              childAspectRatio: 0.55,
              // Tỉ lệ 2 chiều ngang / dọc
              // mainAxisExtent: 105,
            ),
            itemCount: 10,
            itemBuilder: (context, index) {
              //IntrinsicHeight
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Container(
                        decoration: BoxDecoration(
                          // color: BaseColors.background2,
                          borderRadius: BorderRadius.circular(
                            BaseDimens.radius18,
                          ),
                          image: const DecorationImage(
                            image: NetworkImage(
                                'https://images.pexels.com/photos/12513869/pexels-photo-12513869.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        alignment: Alignment.bottomCenter,
                        padding: const EdgeInsets.all(BaseDimens.size8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 2,
                                horizontal: 4,
                              ),
                              decoration: BoxDecoration(
                                  color: BaseColors.blue500,
                                  borderRadius: BorderRadius.circular(
                                      BaseDimens.radius16)),
                              child: Text(
                                'FAST SHIP',
                                style: BaseTextStyles.bodyText8
                                    .semiBold()
                                    .copyWith(
                                      color: BaseColors.white500,
                                    ),
                              ),
                            ),
                            MyAssets.icons.like.svg(),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Gap(BaseDimens.spacing8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'MAENIQUE',
                            style: BaseTextStyles.bodyText13.bold().copyWith(
                                  color: BaseColors.white500,
                                ),
                          ),
                        ],
                      ),
                      Text(
                        'Stan collar short mustag training',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: BaseTextStyles.bodyText12.copyWith(
                          color: BaseColors.white500,
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Z Discount',
                            style: BaseTextStyles.bodyText12.bold().copyWith(
                                  color: BaseColors.tintPink,
                                ),
                          ),
                          const Gap(BaseDimens.spacing8),
                          // Text(
                          //   "119.000",
                          //   style: BaseTextStyles.bodyText12.copyWith(
                          //     color: BaseColors.white500,
                          //     decoration: TextDecoration.underline,
                          //   ),
                          // ),
                          Text(
                            '119.000',
                            style: BaseTextStyles.bodyText12.copyWith(
                              decoration: TextDecoration.lineThrough,
                              color: BaseColors.white500,
                              decorationColor: BaseColors.white500, // optional
                              // decorationThickness: 2, // optional
                              // decorationStyle:
                              //     TextDecorationStyle.solid, // optional
                            ),
                          )
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '16%',
                            style: BaseTextStyles.bodyText16.bold().copyWith(
                                  color: BaseColors.tintPink,
                                ),
                          ),
                          Text(
                            "119.9€",
                            style: BaseTextStyles.bodyText16.bold().copyWith(
                                  color: BaseColors.white500,
                                ),
                          ),
                        ],
                      ),
                      const Gap(4),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: BaseColors.hexColor('C0CBC7'),
                              borderRadius: BorderRadius.circular(
                                BaseDimens.radius4,
                              ),
                            ),
                            child: Text(
                              'Originals',
                              style: BaseTextStyles.bodyText10.copyWith(
                                color: BaseColors.hexColor('262A2D'),
                              ),
                            ),
                          ),
                          const Gap(BaseDimens.spacing8),
                          Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: BaseColors.hexColor('262A2D'),
                              borderRadius: BorderRadius.circular(
                                BaseDimens.radius4,
                              ),
                            ),
                            child: Text(
                              'Free order',
                              style: BaseTextStyles.bodyText10.copyWith(
                                color: BaseColors.hexColor('808485'),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              );
            },
          ),

          Container(
            height: BaseDimens.spacing24,
          ),
        ],
      ),
    );
  }
}

// if this gridview used on flutter web need below class for scrolling
class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
