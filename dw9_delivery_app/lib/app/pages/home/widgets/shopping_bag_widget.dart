import 'package:dw9_delivery_app/app/core/extensions/formatter_extensions.dart';
import 'package:dw9_delivery_app/app/core/ui/helpers/size_extensions.dart';
import 'package:dw9_delivery_app/app/core/ui/styles/text_styles.dart';
import 'package:dw9_delivery_app/app/dto/order_product_dto.dart';
import 'package:flutter/material.dart';

class ShoppingBagWidget extends StatelessWidget {
  final List<OrderProductDto> bag;

  const ShoppingBagWidget({super.key, required this.bag});

  @override
  Widget build(BuildContext context) {
    var totalBag = bag
        .fold<double>(
          0.0,
          (total, element) => total += element.totalPrice,
        )
        .currencyPTBR;

    return Container(
      width: context.screenWidth,
      height: 90,
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Color(0XFF140E0E),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(31, 204, 191, 191),
            blurRadius: 5,
          )
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: ElevatedButton(
        onPressed: () {},
        child: Stack(
          children: [
            const Align(
                alignment: Alignment.centerLeft,
                child: Icon(
                  Icons.shopping_cart_outlined,
                )),
            Align(
                alignment: Alignment.center,
                child: Text(
                  'Ver sacola',
                  style:
                      context.textStyles.textExtraBold.copyWith(fontSize: 16),
                )),
            Align(
                alignment: Alignment.centerRight,
                child: Text(
                  totalBag,
                  style:
                      context.textStyles.textExtraBold.copyWith(fontSize: 16),
                ))
          ],
        ),
      ),
    );
  }
}
