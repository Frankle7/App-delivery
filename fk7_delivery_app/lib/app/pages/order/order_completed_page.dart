import 'package:fk7_delivery_app/app/core/ui/helpers/size_extensions.dart';
import 'package:fk7_delivery_app/app/core/ui/styles/text_styles.dart';
import 'package:fk7_delivery_app/app/core/ui/widgets/delivery_button.dart';
import 'package:flutter/material.dart';

class OrderCompletedPage extends StatelessWidget {
  const OrderCompletedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: context.percenHeight(.20),
              ),
              Image.asset('assets/images/logo_rounded.png'),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  'Seu pedido foi concluído com sucesso, em breve você receberá uma confirmação do seu pedido por whatsApp, com estimativa de tempo de entrega. \n Obrigado!',
                  textAlign: TextAlign.center,
                  style: context.textStyles.textBold.copyWith(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              DeliveryButton(
                width: context.percenWidth(.85),
                label: 'FECHAR',
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}