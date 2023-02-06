
import '../models/product_model.dart';

class OrderProductDto {
  final ProductModel product;
  final int amout;

  OrderProductDto({
    required this.product,
    required this.amout,
  });

  double get totalPrice => amout * product.price;

}