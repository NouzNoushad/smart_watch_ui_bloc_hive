import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_watch_ui/data/bloc/cart_bloc/cart_bloc.dart';
import 'package:smart_watch_ui/model/cart_model.dart';
import 'package:smart_watch_ui/model/smart_watch_model.dart';
import 'package:smart_watch_ui/utils/colors.dart';
import 'package:smart_watch_ui/utils/dummy_data.dart';
import 'package:smart_watch_ui/utils/extensions.dart';
import 'package:uuid/uuid.dart';

class WatchInfo extends StatelessWidget {
  final SmartWatchModel smartWatch;
  const WatchInfo({super.key, required this.smartWatch});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      decoration: const BoxDecoration(
          color: ColorPicker.whiteColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          )),
      padding: const EdgeInsets.all(20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  smartWatch.title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  '\$${smartWatch.price}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            CircleAvatar(
              backgroundColor: ColorPicker.lightLikeColor,
              child: const Icon(
                Icons.favorite,
                color: ColorPicker.likeColor,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        const Text(
          'It was a houmorously perilous business for both of us. For, before we proceed further, it must be said that the monkey-rope was fast at both ends fast to Queequegs broad canvas belt.',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            height: 2,
            color: ColorPicker.greyColor,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            ...List.generate(
                smartWatches.length,
                (index) => Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: CircleAvatar(
                        radius: 12,
                        backgroundColor: smartWatches[index].color,
                      ),
                    ))
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Expanded(
              child: SizedBox(
                height: context.height * 0.06,
                child: ElevatedButton(
                  onPressed: () {
                    String id = const Uuid().v4();
                    CartModel cartModel = CartModel(
                        id,
                        smartWatch.title,
                        smartWatch.price,
                        smartWatch.bgColor.value,
                        smartWatch.image);
                    context.read<CartBloc>().add(AddToCartEvent(cartModel));
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      backgroundColor: ColorPicker.blackColor,
                      behavior: SnackBarBehavior.floating,
                      content: Text(
                        'Watch Added to Cart',
                        style: TextStyle(color: ColorPicker.whiteColor),
                      ),
                    ));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: smartWatch.bgColor.withOpacity(0.8),
                  ),
                  child: const Text(
                    'Add to cart',
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: SizedBox(
                height: context.height * 0.06,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: smartWatch.bgColor,
                  ),
                  child: const Text(
                    'Buy now',
                  ),
                ),
              ),
            ),
          ],
        )
      ]),
    );
  }
}
