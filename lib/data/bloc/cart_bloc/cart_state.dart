part of 'cart_bloc.dart';

sealed class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

final class CartInitial extends CartState {}

final class CartLoadingState extends CartState {}

class CartLoadedState extends CartState {
  final List<CartModel> carts;
  const CartLoadedState(this.carts);

  @override
  List<Object> get props => [carts];
}

class AddToCartState extends CartState {
  const AddToCartState();

  @override
  List<Object> get props => [];
}

class RemoveCartState extends CartState {
  const RemoveCartState();

  @override
  List<Object> get props => [];
}

class CartErrorState extends CartState {
  final String error;
  const CartErrorState(this.error);

  @override
  List<Object> get props => [error];
}
