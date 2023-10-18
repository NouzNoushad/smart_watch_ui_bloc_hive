part of 'cart_bloc.dart';

sealed class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class CartLoadedEvent extends CartEvent {
  const CartLoadedEvent();

  @override
  List<Object> get props => [];
}

class AddToCartEvent extends CartEvent {
  final CartModel cartModel;
  const AddToCartEvent(this.cartModel);

  @override
  List<Object> get props => [cartModel];
}

class RemoveCartEvent extends CartEvent {
  final CartModel cartModel;
  const RemoveCartEvent(this.cartModel);

  @override
  List<Object> get props => [cartModel];
}
