import 'package:flutter/material.dart';
import 'package:smart_watch_ui/utils/colors.dart';

import '../../smart_watch_cart/layout/smart_watch_cart.dart';
import '../components/discount_offer.dart';
import '../components/trending_watch.dart';

class SmartWatchHomeScreen extends StatefulWidget {
  const SmartWatchHomeScreen({super.key});

  @override
  State<SmartWatchHomeScreen> createState() => _SmartWatchHomeScreenState();
}

class _SmartWatchHomeScreenState extends State<SmartWatchHomeScreen>
    with SingleTickerProviderStateMixin {
  late final TabController tabController =
      TabController(length: 4, vsync: this);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPicker.whiteColor,
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(Icons.menu),
                    Row(
                      children: [
                        const Icon(
                          Icons.search,
                          size: 25,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const SmartWatchCart()));
                          },
                          child: const Icon(
                            Icons.shopping_cart,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )),
          Expanded(
              flex: 6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Discover',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TabBar(
                          controller: tabController,
                          isScrollable: true,
                          labelColor: ColorPicker.blackColor,
                          unselectedLabelColor: ColorPicker.greyColor,
                          labelPadding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          indicatorColor: ColorPicker.transparent,
                          tabs: ["Apple", 'Samsung', 'Xiaomi', 'Asus']
                              .map((watch) {
                            return Text(
                              watch,
                              style: const TextStyle(
                                fontSize: 15,
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                      child: TabBarView(
                    controller: tabController,
                    children: const [
                      TrendingWatch(),
                      Center(
                        child: Text('Samsung'),
                      ),
                      Center(
                        child: Text('Xiaomi'),
                      ),
                      Center(
                        child: Text('Asus'),
                      ),
                    ],
                  ))
                ],
              )),
          const Expanded(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Discount Offer',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    DiscountOffer(),
                  ],
                ),
              )),
        ],
      )),
    );
  }
}
