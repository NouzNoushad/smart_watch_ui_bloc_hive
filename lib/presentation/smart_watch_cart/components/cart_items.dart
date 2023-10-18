import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_watch_ui/data/bloc/cart_bloc/cart_bloc.dart';
import 'package:smart_watch_ui/utils/colors.dart';
import 'package:smart_watch_ui/utils/extensions.dart';

import '../../../model/cart_model.dart';

class CartItems extends StatefulWidget {
  final List<CartModel> carts;
  const CartItems({super.key, required this.carts});

  @override
  State<CartItems> createState() => _CartItemsState();
}

class _CartItemsState extends State<CartItems> {
  @override
  Widget build(BuildContext context) {
    return widget.carts.isNotEmpty
        ? ListView.separated(
            itemBuilder: (context, index) {
              var cart = widget.carts[index];
              return SizedBox(
                height: context.height * 0.17,
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: context.width * 0.35,
                        child: Stack(children: [
                          Container(
                            margin: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(cart.color)),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Image.asset(
                              'assets/${cart.image}.png',
                              scale: 3,
                            ),
                          )
                        ]),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                cart.title,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              Text(
                                '\$${cart.price}',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Row(
                                children: [
                                  CircleAvatar(
                                    radius: 12,
                                    backgroundColor: ColorPicker.tealColor,
                                    child: Icon(Icons.remove),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text('1'),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  CircleAvatar(
                                    radius: 12,
                                    backgroundColor: ColorPicker.tealColor,
                                    child: Icon(Icons.add),
                                  ),
                                ],
                              )
                            ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: GestureDetector(
                          onTap: () {
                            // remove cart
                            CartModel cartModel = CartModel(cart.id, cart.title,
                                cart.price, cart.color, cart.image);
                            context.read<CartBloc>().add(
                                  RemoveCartEvent(cartModel),
                                );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              backgroundColor: ColorPicker.blackColor,
                              behavior: SnackBarBehavior.floating,
                              content: Text(
                                'Cart Removed Successfully',
                                style: TextStyle(color: ColorPicker.whiteColor),
                              ),
                            ));
                          },
                          child: ClipOval(
                            child: Material(
                              color: Colors.grey.shade200,
                              child: const Icon(
                                Icons.close,
                                color: ColorPicker.greyColor,
                              ),
                            ),
                          ),
                        ),
                      )
                    ]),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(
                  height: 20,
                ),
            itemCount: widget.carts.length)
        : const Center(
            child: Text('No Cart Items Found'),
          );
  }
}
