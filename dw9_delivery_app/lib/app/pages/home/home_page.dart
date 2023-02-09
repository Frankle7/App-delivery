import 'package:dw9_delivery_app/app/core/ui/widgets/delivery_appbar.dart';
import 'package:dw9_delivery_app/app/pages/home/home_controller.dart';
import 'package:dw9_delivery_app/app/pages/home/home_state.dart';
import 'package:dw9_delivery_app/app/pages/home/widgets/delivery_product_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/ui/base_state/base_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends BaseState<HomePage, HomeController> {
  @override
  void onReady() {
    controller.loadProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: DeliveryAppbar(),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: BlocConsumer<HomeController, HomeState>(
            listener: (context, state) {
              state.status.matchAny(
                any: () => hideLoader(),
                loading: () => showLoader(),
                error: () {
                  hideLoader();
                  showError(state.errorMessage ?? 'Erro nao informado');
                },
              );
            },
            buildWhen: (previous, current) => current.status.matchAny(
              any: () => false,
              initial: () => true,
              loaded: () => true,
            ),
            builder: (context, state) {
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.products.length,
                      itemBuilder: (context, index) {
                        final products = state.products[index];
                        final orders = state.shoppingBag
                            .where((order) => order.product == products);
                            
                        return DeliveryProductTile(
                          product: products,
                          orderProduct: orders.isNotEmpty? orders.first : null,
                          );
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ));
  }
}
