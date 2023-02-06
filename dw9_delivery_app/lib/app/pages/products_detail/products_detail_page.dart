import 'package:auto_size_text/auto_size_text.dart';
import 'package:dw9_delivery_app/app/core/ui/helpers/size_extensions.dart';
import 'package:dw9_delivery_app/app/core/ui/styles/text_styles.dart';
import 'package:dw9_delivery_app/app/core/ui/widgets/delivery_appbar.dart';
import 'package:flutter/material.dart';

import '../../core/ui/widgets/delivery_increment_decrement_button.dart';

class ProductsDetailPage extends StatelessWidget {
  const ProductsDetailPage({super.key});

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
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://assets.unileversolutions.com/recipes-v2/106684.jpg?imwidth=800'),
                      fit: BoxFit.cover)),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                'X-burguer',
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
                    'Lanche acompanha pão, hambúguer, mussarela e maionese',
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
                  child: const DeliveryIncrementDecrementButton(),
                ),
                Container(
                  width: context.percenWidth(.5),
                  height: 60,
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Adicionar',
                            style: context.textStyles.textExtraBold
                                .copyWith(fontSize: 13, color: Colors.white),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: AutoSizeText(
                              r'R$ 6000,99',
                              maxFontSize: 13,
                              minFontSize: 5,
                              maxLines: 1,
                              style: context.textStyles.textExtraBold
                                  .copyWith(color: Colors.white),
                            ),
                          )
                        ],
                      )),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
