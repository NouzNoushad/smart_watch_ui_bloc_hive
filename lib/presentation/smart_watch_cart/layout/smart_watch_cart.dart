import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_watch_ui/data/bloc/cart_bloc/cart_bloc.dart';
import 'package:smart_watch_ui/utils/colors.dart';
import 'package:smart_watch_ui/utils/extensions.dart';

import '../components/cart_app_bar.dart';
import '../components/cart_items.dart';

class SmartWatchCart extends StatefulWidget {
  const SmartWatchCart({super.key});

  @override
  State<SmartWatchCart> createState() => _SmartWatchCartState();
}

class _SmartWatchCartState extends State<SmartWatchCart> {
  @override
  void initState() {
    // get cart details
    context.read<CartBloc>().add(const CartLoadedEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPicker.whiteColor,
      body: SafeArea(
        child: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            if (state is CartLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is CartLoadedState) {
              num total = state.carts.fold(0, (pr, el) => pr + el.price);
              return Column(
                children: [
                  const CartAppBar(),
                  Expanded(
                    flex: 8,
                    child: CartItems(
                      carts: state.carts,
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        child: Row(
                          children: [
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Total Price',
                                  style:
                                      TextStyle(color: ColorPicker.greyColor),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  '\$$total',
                                  style: const TextStyle(
                                      fontSize: 20,
                                      color: ColorPicker.blackColor,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            )),
                            Expanded(
                              flex: 3,
                              child: SizedBox(
                                height: context.height * 0.08,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: ColorPicker.tealColor,
                                  ),
                                  child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Buy now'),
                                        Icon(Icons.arrow_forward_ios),
                                      ]),
                                ),
                              ),
                            )
                          ],
                        ),
                      )),
                ],
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
