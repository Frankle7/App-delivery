import 'package:fk7_delivery_app/app/dto/order_product_dto.dart';

class OrderDto {
  List<OrderProductDto> products;
  String address;
  String document;
  int paymentMethoId;
  OrderDto({
    required this.products,
    required this.address,
    required this.document,
    required this.paymentMethoId,
  });
}
