import 'package:fk7_delivery_app/app/core/provider/application_binding.dart';
import 'package:fk7_delivery_app/app/core/ui/theme/theme_config.dart';
import 'package:fk7_delivery_app/app/pages/auth/login/login_router.dart';
import 'package:fk7_delivery_app/app/pages/home/home_router.dart';
import 'package:fk7_delivery_app/app/pages/order/widget/order_router.dart';
import 'package:fk7_delivery_app/app/pages/products_detail/products_detail_router.dart';
import 'package:fk7_delivery_app/app/pages/splash/splash_page.dart';
import 'package:flutter/material.dart';

import 'pages/auth/register/register_router.dart';
import 'pages/order/widget/order_completed_page.dart';

class Fk7DeliveryApp extends StatelessWidget {
  const Fk7DeliveryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ApplicationBinding(
      child: MaterialApp(
        title: 'Delivery App',
        theme: ThemeConfig.theme,
        routes: {
          '/': (context) => const SplashPage(),
          '/home': (context) =>  HomeRouter.page,
          '/productDetail':(context) => ProductsDetailRouter.page,
          '/auth/login':(context) => LoginRouter.page, 
          '/auth/register':(context) =>  RegisterRouter.page, 
          '/order':(context) =>  OrderRouter.page,
          '/order/completed': (context) => const OrderCompletedPage(), 

        },
      ),
    );
  }
} 