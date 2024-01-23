import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zigzag/theme/base_dimens.dart';
import 'package:zigzag/theme/base_text_styles.dart';

import '../../generated/assets.gen.dart';
import '../../theme/base_color.dart';

class Favorites extends StatefulWidget {
  const Favorites({super.key});

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> with AutomaticKeepAliveClientMixin {
    @override
  bool get wantKeepAlive => true;

   @override
  Widget build(BuildContext context) {
    super.build(context);
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