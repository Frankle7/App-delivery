import 'package:auto_size_text/auto_size_text.dart';
import 'package:fk7_delivery_app/app/core/extensions/formatter_extensions.dart';
import 'package:fk7_delivery_app/app/core/ui/helpers/size_extensions.dart';
import 'package:fk7_delivery_app/app/core/ui/styles/text_styles.dart';
import 'package:fk7_delivery_app/app/core/ui/widgets/delivery_appbar.dart';
import 'package:fk7_delivery_app/app/dto/order_product_dto.dart';
import 'package:fk7_delivery_app/app/models/product_model.dart';
import 'package:fk7_delivery_app/app/pages/products_detail/product_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/ui/base_state/base_state.dart';
import '../../core/ui/widgets/delivery_increment_decrement_button.dart';

class ProductsDetailPage extends StatefulWidget {
  final ProductModel product;
  final OrderProductDto? order;

  const ProductsDetailPage({super.key, required this.product, this.order});

  @override
  State<ProductsDetailPage> createState() => _ProductsDetailPageState();
}

class _ProductsDetailPageState
    extends BaseState<ProductsDetailPage, ProductDetailController> {
  @override
  void initState() {
    super.initState();
    final amout = widget.order?.amout ?? 1;
    controller.initial(amout, widget.order != null);
  }

  void _showConfirmDelete(int amout) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: const Text('Que isso, vai destir de mim?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Cancelar',
                style: context.textStyles.textBold.copyWith(color: Colors.red),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.of(context).pop(
                  OrderProductDto(product: widget.product, amout: amout),
                );
              },
              child: Text(
                'Confirmar',
                style: context.textStyles.textBold,
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeliveryAppbar(),
      body: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: context.screenWidth,
              height: context.percenHeight(.4),
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: NetworkImage(widget.product.image),
              )),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                widget.product.name,
                style: context.textStyles.textExtraBold
                    .copyWith(fontSize: 22, color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: SingleChildScrollView(
                  child: Text(
                    widget.product.description,
                    style: context.textStyles.textLight
                        .copyWith(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ),
            const Divider(color: Colors.white),
            Row(
              children: [
                Container(
                  width: context.percenWidth(.5),
                  height: 68,
                  padding: const EdgeInsets.all(10.5),
                  child: BlocBuilder<ProductDetailController, int>(
                    builder: (context, amout) {
                      return DeliveryIncrementDecrementButton(
                        decrementTap: () {
                          controller.decrement();
                        },
                        incrementTap: () {
                          controller.increment();
                        },
                        amout: amout,
                      );
                    },
                  ),
                ),
                Container(
                  width: context.percenWidth(.5),
                  height: 60,
                  padding: const EdgeInsets.all(8.0),
                  child: BlocBuilder<ProductDetailController, int>(
                    builder: (context, amout) {
                      return ElevatedButton(
                          style: amout == 0
                              ? ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red)
                              : null,
                          onPressed: () {
                            if (amout == 0) {
                              _showConfirmDelete(amout);
                            } else {
                              Navigator.of(context).pop(OrderProductDto(
                                  product: widget.product, amout: amout));
                            }
                          },
                          child: Visibility(
                            visible: amout > 0,
                            replacement: Text('Excluir Produto',
                                style: context.textStyles.textExtraBold),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Adicionar',
                                  style: context.textStyles.textExtraBold
                                      .copyWith(
                                          fontSize: 13, color: Colors.white),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: AutoSizeText(
                                    (widget.product.price * amout).currencyPTBR,
                                    maxFontSize: 13,
                                    minFontSize: 5,
                                    maxLines: 1,
                                    style: context.textStyles.textExtraBold
                                        .copyWith(color: Colors.white),
                                  ),
                                )
                              ],
                            ),
                          ));
                    },
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
