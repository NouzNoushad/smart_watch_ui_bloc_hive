import 'package:hive/hive.dart';
import 'package:smart_watch_ui/model/cart_model.dart';
import 'package:smart_watch_ui/utils/constant.dart';

abstract class CartRepository {
  List<CartModel> getCarts();
  void addToCart(CartModel cartModel);
  void deleteFromCart(CartModel cartModel);
}

// repository implementation
class CartRepositoryImpl extends CartRepository {
  final Box<CartModel> openBox = Hive.box(databaseName);
  @override
  void addToCart(CartModel cartModel) {
    openBox.put(cartModel.id, cartModel);
  }

  @override
  void deleteFromCart(CartModel cartModel) {
    openBox.delete(cartModel.id);
  }

  @override
  List<CartModel> getCarts() {
    return openBox.values.toList();
  }
}
