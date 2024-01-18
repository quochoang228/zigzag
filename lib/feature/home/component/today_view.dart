import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zigzag/generated/assets.gen.dart';
import 'package:zigzag/theme/base_dimens.dart';
import 'package:zigzag/theme/base_text_styles.dart';

import '../../../theme/base_color.dart';

class TodayView extends StatefulWidget {
  const TodayView({super.key});

  @override
  State<TodayView> createState() => _TodayViewState();
}

class _TodayViewState extends State<TodayView> {
  @override
  Widget build(BuildContext context) {
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
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.sizeOf(context).height * 0.4,
            color: BaseColors.blue300,
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
                          alignment: Alignment.center,
                          child: Text(
                            menu[index].toUpperCase(),
                            textAlign: TextAlign.center,
                            style: BaseTextStyles.bodyText10.bold().apply(
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
            child: Text(
              'Recoment for you'.toUpperCase(),
              style: BaseTextStyles.bodyText16.semiBold().copyWith(
                    color: BaseColors.white500,
                  ),
            ),
          ),
          ListView.separated(
            itemCount: 100,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) => const Gap(16),
            itemBuilder: (context, index) {
              return Container(color: Colors.amber, child: Text('data'));
            },
          )
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
