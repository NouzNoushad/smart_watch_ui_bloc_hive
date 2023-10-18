import 'package:flutter/material.dart';
import 'package:smart_watch_ui/utils/colors.dart';
import 'package:smart_watch_ui/utils/dummy_data.dart';
import 'package:smart_watch_ui/utils/extensions.dart';

import '../../smart_watch_details/layout/smart_watch_details.dart';

class DiscountOffer extends StatelessWidget {
  const DiscountOffer({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(vertical: 10),
          itemBuilder: (context, index) {
            var smartWatch = smartWatches.reversed.toList()[index];
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => SmartWatchDetails(
                          smartWatch: smartWatch,
                        )));
              },
              child: SizedBox(
                width: context.width * 0.4,
                child: Stack(children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: context.height * 0.2,
                      decoration: BoxDecoration(
                          color: smartWatch.bgColor,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/${smartWatch.image}.png',
                          height: context.height * 0.16,
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Text(
                          smartWatch.title,
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: ColorPicker.whiteColor,
                          ),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Text(
                          '\$${smartWatch.price}',
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: ColorPicker.whiteColor,
                          ),
                        )
                      ],
                    ),
                  )
                ]),
              ),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(
                width: 15,
              ),
          itemCount: smartWatches.length),
    );
  }
}
