import 'package:flutter/material.dart';
import 'package:zigzag/theme/base_color.dart';

class DiscoveryPage extends StatefulWidget {
  const DiscoveryPage({super.key});

  @override
  State<DiscoveryPage> createState() => _DiscoveryPageState();
}

class _DiscoveryPageState extends State<DiscoveryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BaseColors.background,
      body: SafeArea(
        child: Column(
          children: [
            _buildCarousel(context, 1),
          ],
        ),
        // child: ListView.builder(
        //   padding: const EdgeInsets.symmetric(vertical: 16.0),
        //   itemBuilder: (BuildContext context, int index) {
        //     if (index % 2 == 0) {
        //       return _buildCarousel(context, index ~/ 2);
        //     } else {
        //       return const Divider();
        //     }
        //   },
        // ),
      ),
    );
  }

  Widget _buildCarousel(BuildContext context, int carouselIndex) {
    return SizedBox(
      height: 200.0,
      // child: ListView.separated(
      //   controller: ScrollController(initialScrollOffset: 100),
      //   physics: const PageScrollPhysics(),
      //   scrollDirection: Axis.horizontal,
      //   padding: const EdgeInsets.symmetric(horizontal: 16),
      //   itemBuilder: (context, index) {
      //     return Container(
      //       color: Colors.amber,
      //       width: MediaQuery.sizeOf(context).width * 0.9,
      //       child: Text('$index'),
      //       // margin: const EdgeInsets.only(right: 16),
      //     );
      //   },
      //   separatorBuilder: (context, index) => const Gap(16),
      //   itemCount: 10,
      // ),
      child: PageView.builder(
        controller: PageController(viewportFraction: 0.8),
        itemCount: 5,
        itemBuilder: (BuildContext context, int itemIndex) {
          return Container(
            color: Colors.amber,
            margin: const EdgeInsets.only(right: 16),
            child: Text('$itemIndex'),
          );
          // return _buildCarouselItem(context, carouselIndex, itemIndex);
        },
      ),
    );
  }

  Widget _buildCarouselItem(
      BuildContext context, int carouselIndex, int itemIndex) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
        ),
      ),
    );
  }
}
