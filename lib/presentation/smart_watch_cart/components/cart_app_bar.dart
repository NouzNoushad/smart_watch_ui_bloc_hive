import 'package:flutter/material.dart';
import 'package:smart_watch_ui/presentation/smart_watch_home/layout/smart_watch_home.dart';

class CartAppBar extends StatelessWidget {
  const CartAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              GestureDetector(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const SmartWatchHomeScreen())),
                  child: const Icon(Icons.arrow_back_ios)),
              const SizedBox(
                width: 15,
              ),
              const Text(
                'Cart List',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
          const Icon(Icons.search),
        ],
      ),
    );
  }
}
