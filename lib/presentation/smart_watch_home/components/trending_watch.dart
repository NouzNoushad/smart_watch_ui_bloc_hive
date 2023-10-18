import 'package:flutter/material.dart';
import 'package:smart_watch_ui/utils/colors.dart';
import 'package:smart_watch_ui/utils/dummy_data.dart';
import 'package:smart_watch_ui/utils/extensions.dart';

import '../../smart_watch_details/layout/smart_watch_details.dart';

class TrendingWatch extends StatelessWidget {
  const TrendingWatch({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
        itemBuilder: (context, index) {
          var smartWatch = smartWatches[index];
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SmartWatchDetails(
                        smartWatch: smartWatch,
                      )));
            },
            child: Stack(
              children: [
                SizedBox(
                  width: context.width * 0.65,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      width: context.width * 0.58,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: smartWatch.bgColor),
                      padding: const EdgeInsets.all(15),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  smartWatch.title,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: ColorPicker.whiteColor),
                                ),
                                const SizedBox(
                                  height: 6,
                                ),
                                Text(
                                  '\$${smartWatch.price}',
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: ColorPicker.whiteColor),
                                ),
                              ],
                            ),
                            const CircleAvatar(
                              backgroundColor: ColorPicker.lightColor,
                              child: Icon(
                                Icons.favorite,
                                color: ColorPicker.whiteColor,
                              ),
                            ),
                          ]),
                    ),
                  ),
                ),
                Positioned(
                    bottom: 0,
                    right: -3,
                    child: Image.asset(
                      'assets/${smartWatch.image}.png',
                      scale: 1.5,
                    ))
              ],
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(
              width: 20,
            ),
        itemCount: smartWatches.length);
  }
}
