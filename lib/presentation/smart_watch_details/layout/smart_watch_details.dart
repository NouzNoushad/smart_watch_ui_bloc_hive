import 'package:flutter/material.dart';
import 'package:smart_watch_ui/model/smart_watch_model.dart';
import 'package:smart_watch_ui/presentation/smart_watch_cart/layout/smart_watch_cart.dart';
import 'package:smart_watch_ui/utils/colors.dart';

import '../components/watch_info.dart';

class SmartWatchDetails extends StatelessWidget {
  final SmartWatchModel smartWatch;
  const SmartWatchDetails({super.key, required this.smartWatch});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: smartWatch.bgColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: ColorPicker.whiteColor,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const SmartWatchCart()));
                    },
                    child: const Icon(
                      Icons.shopping_cart,
                      color: ColorPicker.whiteColor,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Image.asset(
                'assets/${smartWatch.image}.png',
                scale: 1.3,
              ),
            ),
            Expanded(
              child: WatchInfo(
                smartWatch: smartWatch,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
