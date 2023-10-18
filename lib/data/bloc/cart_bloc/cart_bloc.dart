import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:smart_watch_ui/data/repositories/cart_repository.dart';
import 'package:smart_watch_ui/model/cart_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartRepository cartRepository;
  CartBloc({
    required this.cartRepository,
  }) : super(CartInitial()) {
    on<CartLoadedEvent>(getCarts());
    on<AddToCartEvent>(addToCart());
    on<RemoveCartEvent>(deleteCart());
  }

  EventHandler<CartLoadedEvent, CartState> getCarts() => ((event, emit) async {
        emit(CartLoadingState());
        try {
          List<CartModel> carts = cartRepository.getCarts();
          emit(CartLoadedState(carts));
        } catch (error) {
          emit(CartErrorState(error.toString()));
        }
      });

  EventHandler<AddToCartEvent, CartState> addToCart() => ((event, emit) {
        try {
          cartRepository.addToCart(event.cartModel);
          emit(const AddToCartState());
        } catch (error) {
          emit(CartErrorState(error.toString()));
        }
      });

  EventHandler<RemoveCartEvent, CartState> deleteCart() => (((event, emit) {
        try {
          cartRepository.deleteFromCart(event.cartModel);
          add(const CartLoadedEvent());
          emit(const RemoveCartState());
        } catch (error) {
          emit(CartErrorState(error.toString()));
        }
      }));
}
