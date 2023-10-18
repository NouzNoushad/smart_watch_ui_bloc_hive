import 'package:hive/hive.dart';

part 'cart_model.g.dart';

@HiveType(typeId: 0)
class CartModel extends HiveObject {
  @HiveField(0)
  String id;
  @HiveField(1)
  String title;
  @HiveField(2)
  double price;
  @HiveField(3)
  int color;
  @HiveField(4)
  String image;

  CartModel(this.id, this.title, this.price, this.color, this.image);
}
