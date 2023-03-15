import '../../models/payment_type_model.dart';
import 'package:fk7_delivery_app/app/dto/order_dto.dart';

abstract class OrderRepository {
  Future<List<PaymentTypeModel>> getAllPaymentsTypes();
  Future<void> saveOrder(OrderDto order);

}
