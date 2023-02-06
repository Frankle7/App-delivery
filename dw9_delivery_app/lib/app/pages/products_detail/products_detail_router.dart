import 'package:dw9_delivery_app/app/pages/products_detail/products_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductsDetailRouter {
  ProductsDetailRouter._();

  static Widget get page =>
      MultiProvider(
        providers: [
          Provider(
            create: (context) => Object(),
            )
        ], 
        child: const ProductsDetailPage()
        );
}
 