import 'package:fk7_delivery_app/app/pages/products_detail/product_detail_controller.dart';
import 'package:fk7_delivery_app/app/pages/products_detail/products_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductsDetailRouter {
  ProductsDetailRouter._();

  static Widget get page => MultiProvider(
        providers: [
          Provider(
            create: (context) => ProductDetailController(),
          )
        ],
        builder: (context, child) {
          final args = ModalRoute.of(context)!.settings.arguments
              as Map<String, dynamic>;

          return ProductsDetailPage(
            product: args['product'],
            order: args['order'],
          );
        },
      );
}
